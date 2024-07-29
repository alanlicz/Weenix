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
#include "kernel.h"
#include "errno.h"

#include "util/debug.h"

#include "proc/proc.h"

#include "mm/mm.h"
#include "mm/mman.h"
#include "mm/page.h"
#include "mm/mmobj.h"
#include "mm/pframe.h"
#include "mm/pagetable.h"

#include "vm/pagefault.h"
#include "vm/vmmap.h"
#include "mm/tlb.h"

/*
 * This gets called by _pt_fault_handler in mm/pagetable.c The
 * calling function has already done a lot of error checking for
 * us. In particular it has checked that we are not page faulting
 * while in kernel mode. Make sure you understand why an
 * unexpected page fault in kernel mode is bad in Weenix. You
 * should probably read the _pt_fault_handler function to get a
 * sense of what it is doing.
 *
 * Before you can do anything you need to find the vmarea that
 * contains the address that was faulted on. Make sure to check
 * the permissions on the area to see if the process has
 * permission to do [cause]. If either of these checks does not
 * pass kill the offending process, setting its exit status to
 * EFAULT (normally we would send the SIGSEGV signal, however
 * Weenix does not support signals).
 *
 * Now it is time to find the correct page. Make sure that if the
 * user writes to the page it will be handled correctly. This
 * includes your shadow objects' copy-on-write magic working
 * correctly.
 *
 * Finally call pt_map to have the new mapping placed into the
 * appropriate page table.
 *
 * @param vaddr the address that was accessed to cause the fault
 *
 * @param cause this is the type of operation on the memory
 *              address which caused the fault, possible values
 *              can be found in pagefault.h
 */


void handle_pagefault(uintptr_t vaddr, uint32_t cause) {
    //Find the vmarea that contains the pages for the vaddr
    vmarea_t *vmarea = vmmap_lookup(curproc->p_vmmap, ADDR_TO_PN(vaddr));
    if (vmarea == NULL || !(vmarea->vma_prot & PROT_READ)) {
        curproc->p_status = EFAULT;
        proc_kill(curproc, EFAULT);
        dbg(DBG_PRINT, "(GRADING3A)\n");
        return;
    }

    //If we are writing, and the vmarea doesn't allow for that, kill the program(is this necessary?)
    if (cause & FAULT_WRITE && !(vmarea->vma_prot & PROT_WRITE)) {
        curproc->p_status = EFAULT;
        proc_kill(curproc, EFAULT);
        dbg(DBG_PRINT, "(GRADING3A)\n");
        return;
    }

    //Getting flags to set with out call to pt_map (What should these be?)
    uint32_t ptflagToPass=PT_PRESENT|PT_USER;
    uint32_t pdflagToPass=PD_PRESENT|PT_USER;
    uint32_t vfn=ADDR_TO_PN(vaddr);

    //If this page is for writing, we set the appropriate flags
    int forwrite=0;
    if(cause & FAULT_WRITE)
    {
        forwrite=1;
        ptflagToPass=ptflagToPass|PT_WRITE;
        pdflagToPass=pdflagToPass|PD_WRITE; 
        dbg(DBG_PRINT, "(GRADING3A)\n");
    }

    //Actually finding the frame we are looking for
    pframe_t* foundPf;
    int resOfLookup=pframe_lookup(vmarea->vma_obj,(vfn-(vmarea->vma_start))+vmarea->vma_off, forwrite,&foundPf); //How is the address calculated? Is this right?
    if(resOfLookup!=0)
    {
        curproc->p_status = EFAULT;
        proc_kill(curproc, EFAULT);
        dbg(DBG_PRINT, "(GRADING3A)\n");
        return;
    }

    //If the cause was for writing, what else do we need to do?
    if(cause&FAULT_WRITE)
    {
        //pframe_pin(foundPf);
        pframe_dirty(foundPf);
        dbg(DBG_PRINT, "(GRADING3A)\n");
    }
    KASSERT(foundPf);
    dbg(DBG_PRINT, "(GRADING3A 5.a)\n");

    //Mapping the pages of our page frame to our vmarea
    pt_map(curproc->p_pagedir, (uintptr_t)PAGE_ALIGN_DOWN(vaddr), pt_virt_to_phys((uintptr_t)foundPf->pf_addr), pdflagToPass, ptflagToPass);
    tlb_flush((uintptr_t)PAGE_ALIGN_DOWN(vaddr));
    dbg(DBG_PRINT, "(GRADING3A)\n");


    /*
    if (cause & FAULT_WRITE && vmarea->vma_prot & PROT_WRITE) {
        if (vmarea->vma_obj->mmo_shadowed) {
            pframe_t *pf;
            int ret = pframe_get(vmarea->vma_obj, ADDR_TO_PN(vaddr), &pf);
            if (ret < 0) {
                curproc->p_status = EFAULT;
                proc_kill(curproc, EFAULT);
                return;
            }
            if (pframe_is_busy(pf)) {
                pframe_pin(pf);
            }
            pframe_clear_busy(pf);
            pframe_t *new_pf;
            ret = pframe_lookup(vmarea->vma_obj, ADDR_TO_PN(vaddr), 0, &new_pf);
            if (ret < 0) {
                curproc->p_status = EFAULT;
                proc_kill(curproc, EFAULT);
                return;
            }
            if (pframe_is_busy(new_pf)) {
                pframe_pin(new_pf);
            }
            pframe_clear_busy(new_pf);
            pframe_pin(pf);
            pframe_pin(new_pf);

            // Map the virtual address to the physical address of the new page frame
            pt_map(curproc->p_pagedir, (uintptr_t)PAGE_ALIGN_DOWN(vaddr), pt_virt_to_phys((uintptr_t)new_pf->pf_addr), PD_PRESENT | PD_WRITE, PT_PRESENT | PT_WRITE);

            pframe_unpin(pf);
            pframe_unpin(new_pf);
        }
    }
    */
}
