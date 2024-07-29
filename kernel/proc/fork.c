/******************************************************************************/
/* Important Spring 2024 CSCI 402 usage information:                          */
/*                                                                            */
/* This fils is part of CSCI 402 kernel programming assignments at USC.       */
/*         53616c7465645f5fd1e93dbf35cbffa3aef28f8c01d8cf2ffc51ef62b26a       */
/*         f9bda5a68e5ed8c972b17bab0f42e24b19daa7bd408305b1f7bd6c7208c1       */
/*         0e36230e913039b3046dd5fd0ba706a624d33dbaa4d6aab02c82fe09f561       */
/*         01b0fd977b0051f0b0ce0c69f7db857b1b5e007be2db6d42894bf93de848       */
/*         806d9152bd5715e9                                                   */
/* Please understand that you are NOT permitted to distribute or publically   */
/*         display a copy of this file (or ANY PART of it) for any reason.    */
/* If anyone (including your prospective employer) asks you to post the code, */
/*         you must inform them that you do NOT have permissions to do so.    */
/* You are also NOT permitted to remove or alter this comment block.          */
/* If this comment block is removed or altered in a submitted file, 20 points */
/*         will be deducted.                                                  */
/******************************************************************************/

#include "types.h"
#include "globals.h"
#include "errno.h"

#include "util/debug.h"
#include "util/string.h"

#include "proc/proc.h"
#include "proc/kthread.h"

#include "mm/mm.h"
#include "mm/mman.h"
#include "mm/page.h"
#include "mm/pframe.h"
#include "mm/mmobj.h"
#include "mm/pagetable.h"
#include "mm/tlb.h"

#include "fs/file.h"
#include "fs/vnode.h"

#include "vm/shadow.h"
#include "vm/vmmap.h"

#include "api/exec.h"

#include "main/interrupt.h"

/* Pushes the appropriate things onto the kernel stack of a newly forked thread
 * so that it can begin execution in userland_entry.
 * regs: registers the new thread should have on execution
 * kstack: location of the new thread's kernel stack
 * Returns the new stack pointer on success. */
static uint32_t
fork_setup_stack(const regs_t *regs, void *kstack)
{
        /* Pointer argument and dummy return address, and userland dummy return
         * address */
        uint32_t esp = ((uint32_t) kstack) + DEFAULT_STACK_SIZE - (sizeof(regs_t) + 12);
        *(void **)(esp + 4) = (void *)(esp + 8); /* Set the argument to point to location of struct on stack */
        memcpy((void *)(esp + 8), regs, sizeof(regs_t)); /* Copy over struct */
        return esp;
}


/*
 * The implementation of fork(2). Once this works,
 * you're practically home free. This is what the
 * entirety of Weenix has been leading up to.
 * Go forth and conquer.
 */
int
do_fork(struct regs *regs)
{

        KASSERT(regs != NULL);
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");
        KASSERT(curproc != NULL);
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");
        KASSERT(curproc->p_state == PROC_RUNNING);
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");
        vmarea_t *vma, *clone_vma;
        pframe_t *pf;
        mmobj_t *to_delete, *new_shadowed;

        //NOT_YET_IMPLEMENTED("VM: do_fork");

        vmarea_t *lookupResult;

        //Allocate a PCB with proc_create()
        proc_t* childProcess=proc_create("childProcess");

        //Copy the vmmap from the parent process
        childProcess->p_vmmap=vmmap_clone(curproc->p_vmmap);
        childProcess->p_vmmap->vmm_proc=childProcess;

        //clone_vma=childProcess->p_vmmap;

        list_iterate_begin(&(childProcess->p_vmmap->vmm_list),vma,vmarea_t,vma_plink)
        {
            //Accessing the parent's vmmap so we can use some of their values.
            lookupResult=vmmap_lookup(curproc->p_vmmap,vma->vma_start);
            

            //We need to do extra work if the vmarea is made of shadow objects
            if(((vma->vma_flags)&MAP_TYPE)==MAP_PRIVATE)
            {
                //We obtain the bottom object (to_delete) and the original shadow object (new_shadowed)
                to_delete=lookupResult->vma_obj->mmo_un.mmo_bottom_obj;
                new_shadowed=lookupResult->vma_obj;

                //We create the two new shadow objects for the parent and child
                mmobj_t* pshadow=shadow_create();
                mmobj_t* cshadow=shadow_create();

                //We set the parent shadow object to point to the right places, set its bottom object, and add the new shadow object to the bottom obj's list
                pshadow->mmo_shadowed=new_shadowed;
                pshadow->mmo_un.mmo_bottom_obj=to_delete;
                //list_insert_head(&(pshadow->mmo_un.mmo_bottom_obj->mmo_un.mmo_vmas),&(lookupResult->vma_olink));

                //We set the child shadow object to point to the right places, set its bottom object, and add the new shadow object to the bottom obj's list             
                cshadow->mmo_shadowed=new_shadowed;
                cshadow->mmo_un.mmo_bottom_obj=to_delete;
                //list_insert_head(&(cshadow->mmo_un.mmo_bottom_obj->mmo_un.mmo_vmas),&(vma->vma_olink));
                
                //We set the vmareas to have the corresponding shadow objects
                lookupResult->vma_obj=pshadow;
                vma->vma_obj=cshadow;

                //We need to update the reference counts: 
                //The immediately next object needs to be incremented (this will trigger everything down the chain)
                new_shadowed->mmo_ops->ref(new_shadowed);
                //to_delete->mmo_ops->ref(to_delete);

                /*
                //Every object on the chain needs to be incremented
                mmobj_t *curObj = new_shadowed->mmo_shadowed;
                while(curObj->mmo_shadowed != NULL){
                    curObj->mmo_ops->ref(curObj);
                    curObj = curObj->mmo_shadowed;
                }

                //Finally the bottom object needs to be incremented
                curObj->mmo_ops->ref(curObj);
                */
                

            }
            else
            {
                //This means the vmarea isn't private. We can just use the same object, and we increase its reference count
                vma->vma_obj=lookupResult->vma_obj;
                lookupResult->vma_obj->mmo_ops->ref(lookupResult->vma_obj);

            }
            list_insert_tail(mmobj_bottom_vmas(lookupResult->vma_obj),&vma->vma_olink);

        }list_iterate_end();

        //Unmap the userland page trable entries and flush the TLB
        pt_unmap_range(curproc->p_pagedir,USER_MEM_LOW, USER_MEM_HIGH);
        tlb_flush_all();

        //Create the copy of the kthread
        kthread_t* childThread=kthread_clone(curthr);
        childThread->kt_proc=childProcess;
        list_insert_tail(&(childProcess->p_threads),&(childThread->kt_plink));

        //Modifying the kthread's context
        childThread->kt_ctx.c_pdptr=childProcess->p_pagedir;
        childThread->kt_ctx.c_eip=(uint32_t) userland_entry;
        regs->r_eax=0;// setting the return value in the child process before calling fork_setup_stack
        childThread->kt_ctx.c_esp=fork_setup_stack(regs,childThread->kt_kstack);
        childThread->kt_ctx.c_kstack=(uintptr_t)childThread->kt_kstack;
        childThread->kt_ctx.c_kstacksz=DEFAULT_STACK_SIZE; 
        

        //check if this should be same as the parent process or any other ?
        childProcess->p_brk=curproc->p_brk;
        childProcess->p_start_brk=curproc->p_start_brk;

        sched_make_runnable(childThread);
        KASSERT(childProcess->p_state == PROC_RUNNING);
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");
        KASSERT(childProcess->p_pagedir != NULL);
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");
        KASSERT(childThread->kt_kstack != NULL);
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");

        regs->r_eax=childProcess->p_pid;// eax of the parent 

        return childProcess->p_pid;
}
