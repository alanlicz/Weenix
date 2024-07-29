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

#include "globals.h"
#include "errno.h"
#include "util/debug.h"

#include "mm/mm.h"
#include "mm/page.h"
#include "mm/mman.h"

#include "vm/mmap.h"
#include "vm/vmmap.h"

#include "proc/proc.h"

/*
 * This function implements the brk(2) system call.
 *
 * This routine manages the calling process's "break" -- the ending address
 * of the process's "dynamic" region (often also referred to as the "heap").
 * The current value of a process's break is maintained in the 'p_brk' member
 * of the proc_t structure that represents the process in question.
 *
 * The 'p_brk' and 'p_start_brk' members of a proc_t struct are initialized
 * by the loader. 'p_start_brk' is subsequently never modified; it always
 * holds the initial value of the break. Note that the starting break is
 * not necessarily page aligned!
 *
 * 'p_start_brk' is the lower limit of 'p_brk' (that is, setting the break
 * to any value less than 'p_start_brk' should be disallowed).
 *
 * The upper limit of 'p_brk' is defined by the minimum of (1) the
 * starting address of the next occuring mapping or (2) USER_MEM_HIGH.
 * That is, growth of the process break is limited only in that it cannot
 * overlap with/expand into an existing mapping or beyond the region of
 * the address space allocated for use by userland. (note the presence of
 * the 'vmmap_is_range_empty' function).
 *
 * The dynamic region should always be represented by at most ONE vmarea.
 * Note that vmareas only have page granularity, you will need to take this
 * into account when deciding how to set the mappings if p_brk or p_start_brk
 * is not page aligned.
 *
 * You are guaranteed that the process data/bss region is non-empty.
 * That is, if the starting brk is not page-aligned, its page has
 * read/write permissions.
 *
 * If addr is NULL, you should "return" the current break. We use this to
 * implement sbrk(0) without writing a separate syscall. Look in
 * user/libc/syscall.c if you're curious.
 *
 * You should support combined use of brk and mmap in the same process.
 *
 * Note that this function "returns" the new break through the "ret" argument.
 * Return 0 on success, -errno on failure.
 */
int
do_brk(void *addr, void **ret)
{
        int heapExists = 0;
        int free = 0;
        int bonus = 0;
        vmarea_t *heapvma = NULL;
        //Check if the address is null.
        if (addr == NULL) {
                *ret = curproc->p_brk;
                return 0;
        }
        else if((uint32_t)addr > USER_MEM_HIGH || ((uint32_t)addr < (uint32_t)curproc->p_start_brk)) {
               return -ENOMEM; 
        }

        //vmarea_t *heapvma = vmmap_lookup(curproc->p_vmmap, ADDR_TO_PN(curproc->p_start_brk)+1);
        if(curproc->p_brk > PAGE_ALIGN_UP(curproc->p_start_brk)) {heapExists++;}
        

        //If address higher than the break, and less than the max
        if(addr > PAGE_ALIGN_UP(curproc->p_brk)  && (uint32_t)addr < USER_MEM_HIGH) {
                //Check if the area expanding into is unitialized
                if(heapExists) {
                        free = vmmap_is_range_empty(curproc->p_vmmap, (uint32_t)ADDR_TO_PN(PAGE_ALIGN_UP(curproc->p_brk)), ((uint32_t)PAGE_ALIGN_UP(addr) - (uint32_t)PAGE_ALIGN_UP(curproc->p_brk)) / PAGE_SIZE);
                }
                else {
                        free = vmmap_is_range_empty(curproc->p_vmmap, (uint32_t)ADDR_TO_PN(PAGE_ALIGN_UP(curproc->p_start_brk)), ((uint32_t)PAGE_ALIGN_UP(addr) - (uint32_t)PAGE_ALIGN_UP(curproc->p_start_brk)) / PAGE_SIZE);
                }
                
                //If the heap is uninitialized, and has space, then initialize it
                if(!heapExists && free) {
                        uint32_t bytes = (uint32_t)PAGE_ALIGN_UP(addr) - (uint32_t)PAGE_ALIGN_UP(curproc->p_start_brk);
                        uint32_t pages = bytes/PAGE_SIZE;
                        uint32_t lopage = (uint32_t)ADDR_TO_PN(curproc->p_start_brk);
                        if(!PAGE_ALIGNED(curproc->p_start_brk)) {lopage ++;}
                        vmmap_map(curproc->p_vmmap, NULL, lopage, pages, PROT_READ | PROT_WRITE, MAP_PRIVATE, 0, VMMAP_DIR_HILO, &heapvma);
                }
                //If heap is initialized, and has space all we need to do is extend it
                else if (heapExists && free){
                        heapvma = vmmap_lookup(curproc->p_vmmap, ADDR_TO_PN(curproc->p_start_brk)+1);
                        heapvma->vma_end = ADDR_TO_PN(addr);
                        if(!PAGE_ALIGNED(addr)) {heapvma->vma_end++;}
                }
                //If the heap is unitialized, but we're not moving out the data/bss, then just change the brk
                else if (!heapExists && addr <= (PAGE_ALIGN_UP(curproc->p_start_brk))) {
                        curproc->p_brk = addr;
                        *ret = curproc->p_brk;
                        return 0;
                }
                //Otherwise we are blocked
                else {
                        *ret = curproc->p_brk;
                        return -1;
                }
        }

        //If address is lower than the break
        if(addr < curproc->p_brk) {

                //If the address is exactly the break, that means we delete our heap.
                if(addr <= PAGE_ALIGN_UP(curproc->p_start_brk) && (heapExists)) {
                        heapvma = vmmap_lookup(curproc->p_vmmap, ADDR_TO_PN(curproc->p_start_brk)+1);
                //if(addr >= curproc->p_start_brk) {

                        //We neeed to unmmap the existing heap
                        if((uint32_t)addr < (uint32_t)PAGE_ALIGN_UP(curproc->p_start_brk)) {
                                do_munmap(PAGE_ALIGN_UP(addr), ADDR_TO_PN(curproc->p_brk) - (ADDR_TO_PN(curproc->p_start_brk) + 1));
                        }
                        //vmmap_remove(curproc->p_vmmap, ADDR_TO_PN(curproc->p_brk) + 1, (ADDR_TO_PN(addr) - ADDR_TO_PN(curproc->p_brk) -1));
                        else {
                                do_munmap(addr, ADDR_TO_PN(curproc->p_brk) + 1 - (ADDR_TO_PN(curproc->p_start_brk) + 1));
                        }
                }
                //If the address is in data/bss, and the heap doesn't exist, we don't do anything.
                else if (addr <= PAGE_ALIGN_UP(curproc->p_start_brk) && (!heapExists)) {
                        curproc->p_brk = addr;
                        *ret = curproc->p_brk;
                        return 0;
                }

                //If it isn't, we need to shrink it
                else if (heapExists) {
                        heapvma = vmmap_lookup(curproc->p_vmmap, ADDR_TO_PN(curproc->p_start_brk)+1);
                        heapvma->vma_end = ADDR_TO_PN(addr);
                        if(!PAGE_ALIGNED(addr)) {heapvma->vma_end++;}
                }
                
                //Set the new break in the PCB
                curproc->p_brk = addr;
                *ret = curproc->p_brk;
                return 0;
        }
        
        //If we're here, then addr == p_brk.
        curproc->p_brk = addr;
        *ret = curproc->p_brk;
        return 0;

}
