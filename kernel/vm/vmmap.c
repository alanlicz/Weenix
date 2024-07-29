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

#include "kernel.h"
#include "errno.h"
#include "globals.h"

#include "vm/vmmap.h"
#include "vm/shadow.h"
#include "vm/anon.h"

#include "proc/proc.h"

#include "util/debug.h"
#include "util/list.h"
#include "util/string.h"
#include "util/printf.h"

#include "fs/vnode.h"
#include "fs/file.h"
#include "fs/fcntl.h"
#include "fs/vfs_syscall.h"

#include "mm/slab.h"
#include "mm/page.h"
#include "mm/mm.h"
#include "mm/mman.h"
#include "mm/mmobj.h"

static slab_allocator_t *vmmap_allocator;
static slab_allocator_t *vmarea_allocator;

void
vmmap_init(void)
{
        vmmap_allocator = slab_allocator_create("vmmap", sizeof(vmmap_t));
        KASSERT(NULL != vmmap_allocator && "failed to create vmmap allocator!");
        vmarea_allocator = slab_allocator_create("vmarea", sizeof(vmarea_t));
        KASSERT(NULL != vmarea_allocator && "failed to create vmarea allocator!");
}

vmarea_t *
vmarea_alloc(void)
{
        vmarea_t *newvma = (vmarea_t *) slab_obj_alloc(vmarea_allocator);
        if (newvma) {
                newvma->vma_vmmap = NULL;
        }
        return newvma;
}

void
vmarea_free(vmarea_t *vma)
{
        KASSERT(NULL != vma);
        slab_obj_free(vmarea_allocator, vma);
}

/* a debugging routine: dumps the mappings of the given address space. */
size_t
vmmap_mapping_info(const void *vmmap, char *buf, size_t osize)
{
        KASSERT(0 < osize);
        KASSERT(NULL != buf);
        KASSERT(NULL != vmmap);

        vmmap_t *map = (vmmap_t *)vmmap;
        vmarea_t *vma;
        ssize_t size = (ssize_t)osize;

        int len = snprintf(buf, size, "%21s %5s %7s %8s %10s %12s\n",
                           "VADDR RANGE", "PROT", "FLAGS", "MMOBJ", "OFFSET",
                           "VFN RANGE");

        list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink) {
                size -= len;
                buf += len;
                if (0 >= size) {
                        goto end;
                }

                len = snprintf(buf, size,
                               "%#.8x-%#.8x  %c%c%c  %7s 0x%p %#.5x %#.5x-%#.5x\n",
                               vma->vma_start << PAGE_SHIFT,
                               vma->vma_end << PAGE_SHIFT,
                               (vma->vma_prot & PROT_READ ? 'r' : '-'),
                               (vma->vma_prot & PROT_WRITE ? 'w' : '-'),
                               (vma->vma_prot & PROT_EXEC ? 'x' : '-'),
                               (vma->vma_flags & MAP_SHARED ? " SHARED" : "PRIVATE"),
                               vma->vma_obj, vma->vma_off, vma->vma_start, vma->vma_end);
        } list_iterate_end();

end:
        if (size <= 0) {
                size = osize;
                buf[osize - 1] = '\0';
        }
        /*
        KASSERT(0 <= size);
        if (0 == size) {
                size++;
                buf--;
                buf[0] = '\0';
        }
        */
        return osize - size;
}

/* Create a new vmmap, which has no vmareas and does
 * not refer to a process. */
vmmap_t *
vmmap_create(void)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_create");

        //Allocate the memory for the vmmap
        vmmap_t *newMap = slab_obj_alloc(vmmap_allocator);

        //Set the values for the vmmap data structure
        newMap->vmm_proc = NULL;
        list_init(&(newMap->vmm_list));
        dbg(DBG_PRINT, "(GRADING3A)\n");
        return newMap;
}

/* Removes all vmareas from the address space and frees the
 * vmmap struct. */
void
vmmap_destroy(vmmap_t *map)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_destroy");
        KASSERT(NULL != map);
        dbg(DBG_PRINT, "(GRADING3A 3.a)\n");
        vmarea_t* vmareaToDestroy=NULL;
        list_iterate_begin(&(map->vmm_list),vmareaToDestroy,vmarea_t,vma_plink)
        {
            list_remove(&(vmareaToDestroy->vma_plink));
            list_remove(&(vmareaToDestroy->vma_olink));

            vmareaToDestroy->vma_obj->mmo_ops->put(vmareaToDestroy->vma_obj);
            vmarea_free(vmareaToDestroy);

        }list_iterate_end();

        slab_obj_free(vmmap_allocator, map);
        dbg(DBG_PRINT, "(GRADING3A)\n");


}

/* Add a vmarea to an address space. Assumes (i.e. asserts to some extent)
 * the vmarea is valid.  This involves finding where to put it in the list
 * of VM areas, and adding it. Don't forget to set the vma_vmmap for the
 * area. */
void
vmmap_insert(vmmap_t *map, vmarea_t *newvma)
{
    //NOT_YET_IMPLEMENTED("VM: vmmap_insert");
    //Find a space big enough to fit it.
    //int pageStart = vmmap_find_range(map, newvma->vma_end - newvma->vma_start, VMMAP_DIR_LOHI);
    KASSERT(NULL != map && NULL != newvma); 
    dbg(DBG_PRINT, "(GRADING3A 3.b)\n");
    KASSERT(NULL == newvma->vma_vmmap);
    dbg(DBG_PRINT, "(GRADING3A 3.b)\n");
    KASSERT(newvma->vma_start < newvma->vma_end);
    dbg(DBG_PRINT, "(GRADING3A 3.b)\n");
    KASSERT(ADDR_TO_PN(USER_MEM_LOW) <= newvma->vma_start && ADDR_TO_PN(USER_MEM_HIGH) >= newvma->vma_end);
    dbg(DBG_PRINT, "(GRADING3A 3.b)\n");
    int inserted = 0;
    vmarea_t *oldvma;
    KASSERT(newvma != NULL);

    //Iterate over the list of vmareas, find the place where it belongs, and insert it.
    if(list_empty(&(map->vmm_list))) {
        list_insert_tail(&(map->vmm_list), &(newvma->vma_plink));
        inserted = 1;
        dbg(DBG_PRINT, "(GRADING3A)\n");
    }
    else {
        list_iterate_begin(&(map->vmm_list), oldvma, vmarea_t, vma_plink) {
            if(inserted == 0 && oldvma->vma_start > newvma->vma_start) {
                list_insert_before(&(oldvma->vma_plink), &(newvma->vma_plink));
                inserted = 1;
                dbg(DBG_PRINT, "(GRADING3A)\n");
            }
        }
        list_iterate_end();
    }
    if(inserted == 0) {
        list_insert_tail(&(map->vmm_list), &(newvma->vma_plink));
        dbg(DBG_PRINT, "(GRADING3A)\n");
    }


    //Setting the vma_vmmap for the area.
    newvma->vma_vmmap = map;
    dbg(DBG_PRINT, "(GRADING3A)\n");    
}

/* Find a contiguous range of free virtual pages of length npages in
 * the given address space. Returns starting vfn for the range,
 * without altering the map. Returns -1 if no such range exists.
 *
 * Your algorithm should be first fit. If dir is VMMAP_DIR_HILO, you
 * should find a gap as high in the address space as possible; if dir
 * is VMMAP_DIR_LOHI, the gap should be as low as possible. */
int
vmmap_find_range(vmmap_t *map, uint32_t npages, int dir)
{
    //NOT_YET_IMPLEMENTED("VM: vmmap_find_range");
    dbg(DBG_PRINT, "vmmap_find_range\n");
    vmarea_t *currentvma;
    vmarea_t *startvma = NULL;
    uint32_t lowestStart = 0;
    //int found = 0;
    int result = -1;
/*
    //For LOHI, iterate over the list of vmareas, check the gaps between them, find the first one that is big enough, and save the result.
    if(dir == VMMAP_DIR_LOHI) {
        list_iterate_begin(&(map->vmm_list), currentvma, vmarea_t, vma_plink) {
            if((prevvma != NULL) && (found == 0) && (prevvma->vma_end - currentvma->vma_start >= npages)) {
                result = prevvma->vma_end;
                found = 1;
            }
            prevvma = currentvma;
        }
        list_iterate_end();
    }
*/

    //For HI, iterate over the list of vmareas in reverse, check the gaps between them, find the first one that is big enough, and save the result.
    if(dir == VMMAP_DIR_HILO) {

        //Checking if the bottom is empty
        if(vmmap_is_range_empty(map, ADDR_TO_PN(USER_MEM_HIGH) - npages, npages)) {
            dbg(DBG_PRINT, "(GRADING3A)\n");
            return ADDR_TO_PN(USER_MEM_HIGH) - npages;
        }
        //If it's not empty, we check the gaps between the vmareas
        list_iterate_reverse(&(map->vmm_list), currentvma, vmarea_t, vma_plink) {
            //We need to get the first vmarea to compare with the rest.
            if(startvma != NULL) 
            {   
                //If the range is empty, we're found it
                if(vmmap_is_range_empty(map, startvma->vma_start - npages, npages))
                {
                    result = startvma->vma_start - npages;
                    dbg(DBG_PRINT, "(GRADING3A)\n");
                    break;
                }
                dbg(DBG_PRINT, "(GRADING3A)\n");
            }

            startvma=currentvma;
            lowestStart = currentvma->vma_start;
            dbg(DBG_PRINT, "(GRADING3A)\n");
        }list_iterate_end();
        if(result == -1) {
            if(vmmap_is_range_empty(map, lowestStart - npages, npages)) {
                result = lowestStart - npages;
                dbg(DBG_PRINT, "(GRADING3A)\n");
            }
        }
    }
    //if(lowestStart - npages >= ADDR_TO_PN(USER_MEM_LOW)) {result = -1;}
    dbg(DBG_PRINT, "(GRADING3A)\n");
    return result;

}

/* Find the vm_area that vfn lies in. Simply scan the address space
 * looking for a vma whose range covers vfn. If the page is unmapped,
 * return NULL. */
vmarea_t *
vmmap_lookup(vmmap_t *map, uint32_t vfn)
{
    //NOT_YET_IMPLEMENTED("VM: vmmap_lookup")
    KASSERT(NULL != map);
    dbg(DBG_PRINT, "(GRADING3A 3.c)\n");
    vmarea_t *vma;
    vmarea_t *resultvma = NULL;

    //Iterate over the list of vmareas, find the one that the vfn is in, and save the result
    list_iterate_begin(&(map->vmm_list), vma, vmarea_t, vma_plink) {
        if((vfn >= vma->vma_start) && (vfn < vma->vma_end)) {
            resultvma = vma;
            dbg(DBG_PRINT, "(GRADING3A)\n");
        }
    }
    list_iterate_end();
    dbg(DBG_PRINT, "(GRADING3A)\n");
    return resultvma;
}

/* Allocates a new vmmap containing a new vmarea for each area in the
 * given map. The areas should have no mmobjs set yet. Returns pointer
 * to the new vmmap on success, NULL on failure. This function is
 * called when implementing fork(2). */
vmmap_t *
vmmap_clone(vmmap_t *map)
{
    //NOT_YET_IMPLEMENTED("VM: vmmap_clone");
    vmmap_t *newMap = vmmap_create();
    if(newMap == NULL) {
        dbg(DBG_PRINT, "(GRADING3A)\n");
        return NULL;
    }
    vmarea_t *newvma;
    vmarea_t *vma;
    
    //Iterate over the list of vmareas. For each vmarea
    list_iterate_begin(&(map->vmm_list), vma, vmarea_t, vma_plink) {

        //Allocate memory for the copy of the vmarea
        newvma = vmarea_alloc();
        if(newvma == NULL) {
            dbg(DBG_PRINT, "(GRADING3A)\n");
            return NULL;
        }

        //Copy all the values for the data structure
        newvma->vma_start = vma->vma_start;
        newvma->vma_end = vma->vma_end;
        newvma->vma_off = vma->vma_off;
        newvma->vma_prot = vma->vma_prot;
        newvma->vma_flags = vma->vma_flags;

        //The vmmap needs to be the new map, and there shouldn't be any mmobj set.
        newvma->vma_obj = NULL;

        //Initialize the links
        list_link_init(&(newvma->vma_plink));
        list_link_init(&(newvma->vma_olink));

        //Insert it into the new map's list of vmareas
        vmmap_insert(newMap, newvma);
    }
    list_iterate_end();

    //When should we return NULL? In what instances does this fail?
    dbg(DBG_PRINT, "(GRADING3A)\n");
    return newMap;
}

/* Insert a mapping into the map starting at lopage for npages pages.
 * If lopage is zero, we will find a range of virtual addresses in the
 * process that is big enough, by using vmmap_find_range with the same
 * dir argument.  If lopage is non-zero and the specified region
 * contains another mapping that mapping should be unmapped.
 *
 * If file is NULL an anon mmobj will be used to create a mapping
 * of 0's.  If file is non-null that vnode's file will be mapped in
 * for the given range.  Use the vnode's mmap operation to get the
 * mmobj for the file; do not assume it is file->vn_obj. Make sure all
 * of the area's fields except for vma_obj have been set before
 * calling mmap.
 *
 * If MAP_PRIVATE is specified set up a shadow object for the mmobj.
 *
 * All of the input to this function should be valid (KASSERT!).
 * See mmap(2) for for description of legal input.
 * Note that off should be page aligned.
 *
 * Be very careful about the order operations are performed in here. Some
 * operation are impossible to undo and should be saved until there
 * is no chance of failure.
 *
 * If 'new' is non-NULL a pointer to the new vmarea_t should be stored in it.
 */
int
vmmap_map(vmmap_t *map, vnode_t *file, uint32_t lopage, uint32_t npages,
          int prot, int flags, off_t off, int dir, vmarea_t **new)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_map");

        KASSERT(NULL != map);
        dbg(DBG_PRINT, "(GRADING3A 3.d)\n");
        KASSERT(0 < npages);
        dbg(DBG_PRINT, "(GRADING3A 3.d)\n");
        KASSERT((MAP_SHARED & flags) || (MAP_PRIVATE & flags));
        dbg(DBG_PRINT, "(GRADING3A 3.d)\n");
        KASSERT((0 == lopage) || (ADDR_TO_PN(USER_MEM_LOW) <= lopage));
        dbg(DBG_PRINT, "(GRADING3A 3.d)\n");
        KASSERT((0 == lopage) || (ADDR_TO_PN(USER_MEM_HIGH) >= (lopage + npages)));
        dbg(DBG_PRINT, "(GRADING3A 3.d)\n");
        KASSERT(PAGE_ALIGNED(off));
        dbg(DBG_PRINT, "(GRADING3A 3.d)\n");

        int result = 0;
        int foundRange = 0;
        uint32_t myLopage = lopage; 
        mmobj_t* newmmobj;

        

        //If we are not given a start page, we need to find one where it will fit.
         if(lopage == 0) {
            foundRange = vmmap_find_range(map, npages, dir);
            if (foundRange == -1) {myLopage = ADDR_TO_PN(USER_MEM_HIGH) - npages;}
            else {myLopage = (uint32_t)foundRange;}

            if(myLopage < ADDR_TO_PN(USER_MEM_LOW)) {
                dbg(DBG_PRINT, "(GRADING3D 2)\n");
                return - 1;
            }
            dbg(DBG_PRINT, "(GRADING3A)\n");
        }

        //If the start page already exist, we need to remove it.
        if(!vmmap_is_range_empty(map, myLopage, npages)) {
            vmmap_remove(map, myLopage, npages);
            dbg(DBG_PRINT, "(GRADING3D 2)\n");
        }

        //Allocate memory for the new vmarea, and populate the fields
        vmarea_t *newvma = vmarea_alloc();
        newvma->vma_start = myLopage;
        newvma->vma_end = myLopage + npages;
        newvma->vma_off = ADDR_TO_PN(off);
        newvma->vma_prot = prot;
        newvma->vma_flags = flags;
        list_link_init(&(newvma->vma_plink));
        list_link_init(&(newvma->vma_olink));
        //newvma->vma_vmmap = NULL;
        
        

        //The mmobj depends on the file permissions. Figure out which one to use, and set it.
        if (file == NULL) {
            newmmobj = anon_create();
            dbg(DBG_PRINT, "(GRADING3A)\n");}
        else
        {
            //This increments the vnode ref, and is decremented when the object is destroyed
            result = file->vn_ops->mmap(file, newvma, &newmmobj);
            dbg(DBG_PRINT, "(GRADING3A)\n");
            //vput(file);
        }
        
        
        if(flags&MAP_PRIVATE)
        {
            mmobj_t *createdShadowObj=shadow_create();
            createdShadowObj->mmo_shadowed=newmmobj;
            createdShadowObj->mmo_un.mmo_bottom_obj=newmmobj;
            list_insert_head(&(createdShadowObj->mmo_un.mmo_bottom_obj->mmo_un.mmo_vmas),&(newvma->vma_olink));
            newmmobj = createdShadowObj;
            newvma->vma_obj=newmmobj;
            dbg(DBG_PRINT, "(GRADING3A)\n");

        }
        

        else {
            newvma->vma_obj=newmmobj;
            list_insert_head(&(newmmobj->mmo_un.mmo_vmas),&(newvma->vma_olink));
            dbg(DBG_PRINT, "(GRADING3A)\n");
        }

        //Check if everything went well. If it has, insert the vmarea.
        if (result != 0) {
            return result;
            dbg(DBG_PRINT, "(GRADING3D 2)\n");
        }
        vmmap_insert(map, newvma);
        if(new)
        {
            *new=newvma;
        }
        return 0;
}

/*
 * We have no guarantee that the region of the address space being
 * unmapped will play nicely with our list of vmareas.
 *
 * You must iterate over each vmarea that is partially or wholly covered
 * by the address range [addr ... addr+len). The vm-area will fall into one
 * of four cases, as illustrated below:
 *
 * key:
 *          [             ]   Existing VM Area
 *        *******             Region to be unmapped
 *
 * Case 1:  [   ******    ]
 * The region to be unmapped lies completely inside the vmarea. We need to
 * split the old vmarea into two vmareas. be sure to increment the
 * reference count to the file associated with the vmarea.
 *
 * Case 2:  [      *******]**
 * The region overlaps the end of the vmarea. Just shorten the length of
 * the mapping.
 *
 * Case 3: *[*****        ]
 * The region overlaps the beginning of the vmarea. Move the beginning of
 * the mapping (remember to update vma_off), and shorten its length.
 *
 * Case 4: *[*************]**
 * The region completely contains the vmarea. Remove the vmarea from the
 * list.
 */
int
vmmap_remove(vmmap_t *map, uint32_t lopage, uint32_t npages)
{
    //NOT_YET_IMPLEMENTED("VM: vmmap_remove");
    vmarea_t *vma, *insertvma;
    uint32_t hipage = lopage + npages;
    int insertion = 0;

    //Iterate over the vmareas, finding if there is overlap.
    list_iterate_begin(&(map->vmm_list), vma, vmarea_t, vma_plink) {

        //Case 1  [   ******    ]
        if((lopage > vma->vma_start) && (hipage < vma->vma_end)) {
            //Insert a new vmarea 
            vmarea_t *newvma = vmarea_alloc();
            newvma->vma_start = hipage;
            newvma->vma_end = vma->vma_end;
            newvma->vma_off = vma->vma_off + hipage - vma->vma_start;
            newvma->vma_prot = vma->vma_prot;
            newvma->vma_flags = vma->vma_flags;
            //newvma->vma_vmmap = vma->vma_vmmap;
            newvma->vma_obj = vma->vma_obj;
            newvma->vma_obj->mmo_ops->ref(newvma->vma_obj);
            list_link_init(&(newvma->vma_plink));
            list_link_init(&(newvma->vma_olink));
            if(vma->vma_obj->mmo_shadowed) {
                list_insert_head(&(vma->vma_obj->mmo_un.mmo_bottom_obj->mmo_un.mmo_vmas),&(newvma->vma_olink));
            }
            

            vma->vma_end = lopage;
            insertvma = newvma;
            insertion++;

            //Need to figure out how to increment the file reference count.

            //Adjust the orignal vmarea
            vma->vma_end = lopage;
            //vma->vma_obj->mmo_ops->put(vma->vma_obj);

        }

        //Case 2 [      *******]**
        else if((lopage > vma->vma_start) && (vma->vma_end > lopage) && (hipage >= vma->vma_end)) {
            vma->vma_end = lopage;
            //vma->vma_obj->mmo_ops->put(vma->vma_obj);
        }

        //Case 3 *[*****        ]
        else if((lopage <= vma->vma_start) && (hipage > vma->vma_start) && (hipage < vma->vma_end)) {
            vma->vma_off += hipage - vma->vma_start;
            vma->vma_start = hipage;
            //vma->vma_obj->mmo_ops->put(vma->vma_obj);
        }

        //Case 4 *[*************]**
        else if((vma->vma_start >= lopage) && (vma->vma_end <= hipage)) {
            vma->vma_obj->mmo_ops->put(vma->vma_obj);
            list_remove(&(vma->vma_plink));
            list_remove(&(vma->vma_olink));
            slab_obj_free(vmarea_allocator, vma);
        }
    }
    list_iterate_end();
        if(insertion != 0) {vmmap_insert(map, insertvma);}
        return 0;
}

/*
 * Returns 1 if the given address space has no mappings for the
 * given range, 0 otherwise.
 */
int
vmmap_is_range_empty(vmmap_t *map, uint32_t startvfn, uint32_t npages)
{
    uint32_t endvfn = startvfn+npages;
    KASSERT((startvfn < endvfn) && (ADDR_TO_PN(USER_MEM_LOW) <= startvfn) && (ADDR_TO_PN(USER_MEM_HIGH) >= endvfn));
    dbg(DBG_PRINT, "(GRADING3A 3.e)\n");

    //NOT_YET_IMPLEMENTED("VM: vmmap_is_range_empty");
    vmarea_t *vma;
    int result = 1;
    //uint32_t endvfn = startvfn + npages;
    int case1, case2, case3, case4, case5,case6 = 0;

    //Iterate over the vmareas, checking for overlaps.
    list_iterate_begin(&(map->vmm_list), vma, vmarea_t, vma_plink) {
        case1 = ((startvfn > vma->vma_start) && (endvfn < vma->vma_end));
        case2 = ((startvfn > vma->vma_start) && (startvfn < vma->vma_end) && (endvfn >= vma->vma_end));
        case3 = ((startvfn <= vma->vma_start) && (endvfn > vma->vma_start) && (endvfn < vma->vma_end));
        case4 = ((vma->vma_start <= startvfn) && (vma->vma_end >= endvfn));
        case5 = ((endvfn == vma->vma_end));
        case6 =((vma->vma_start<startvfn+npages)&&(vma->vma_end>startvfn));


/*        if(((startvfn > vma->vma_start) && (endvfn < vma->vma_end)) || //Case 1
            ((startvfn > vma->vma_start) && (vma->vma_end < startvfn) && (endvfn > vma->vma_end)) || //Case 2
            ((startvfn < vma->vma_start) && (endvfn > vma->vma_start) && (endvfn < vma->vma_end)) || //Case 3
            ((vma->vma_start < startvfn) && (vma->vma_end > endvfn))) {//Case 4
*/
        if(case1 || case2 || case3|| case4 || case5||case6) {
            result = 0;
        }
    }
    list_iterate_end();

        return result;
}

/* Read into 'buf' from the virtual address space of 'map' starting at
 * 'vaddr' for size 'count'. To do so, you will want to find the vmareas
 * to read from, then find the pframes within those vmareas corresponding
 * to the virtual addresses you want to read, and then read from the
 * physical memory that pframe points to. You should not check permissions
 * of the areas. Assume (KASSERT) that all the areas you are accessing exist.
 * Returns 0 on success, -errno on error.
 */

int vmmap_read(vmmap_t *map, const void *vaddr, void *buf, size_t count)
{

    dbg(DBG_PRINT, "vmmap_read\n");
    size_t bytes_to_copy, bytes_copied = 0;
    pframe_t *pframe;
    vmarea_t *vmarea;
    uintptr_t paddr;
    size_t vaddrnum = (size_t)vaddr;
    //int i = 0;
    int vfn=0;

    uintptr_t offset = PAGE_OFFSET(vaddr);

    //Clean the buffer before we copy
    memset(buf, '\0', count);

    // Loop until all bytes are read
    while (bytes_copied < count) {
        // Find the vmarea that the virtual address belongs to
        vmarea = vmmap_lookup(map, ADDR_TO_PN(vaddrnum + bytes_copied));
        if (vmarea == NULL) {
            return -EFAULT;
        }

        // Find the page frame whose data we need
        //if (pframe_lookup(vmarea->vma_obj, ADDR_TO_PN(vaddrnum + bytes_copied), 0, &pframe) < 0) {
        vfn= ADDR_TO_PN(vaddrnum + bytes_copied);
        if (pframe_lookup(vmarea->vma_obj, (vfn-vmarea->vma_start)+vmarea->vma_off, 0, &pframe) < 0) {
            return -EFAULT;
        }
/*
        // Calculate the physical address
        paddr = pt_virt_to_phys((uintptr_t)vaddrnum + bytes_copied);

        // Calculate the offset within the page
        offset = PAGE_OFFSET(paddr);
*/


        // Calculate the number of bytes to copy

        bytes_to_copy = MIN(count - bytes_copied, PAGE_SIZE - offset);

        // Copy the data from the physical memory to the buffer
        memcpy((char *)((size_t)buf + bytes_copied), (char *)((uintptr_t)(pframe->pf_addr) + offset), bytes_to_copy);

        // Update the number of bytes copied
        bytes_copied += bytes_to_copy;
        offset = 0;

    }

    return 0;
}

/*
int vmmap_read(vmmap_t *map, const void *vaddr, void *buf, size_t count)
{
    int vfnToReadFrom=ADDR_TO_PN(vaddr);
    int vfnToReadUpto=ADDR_TO_PN((size_t)vaddr+count-1);
    int startPageOffset=PAGE_OFFSET(vaddr);
    int endPageTillwhere=PAGE_OFFSET((size_t)vaddr+count-1);
    int whereToCopy;
    
    int vfn=vfnToReadFrom;
    while(vfn<=vfnToReadUpto){
    vmarea_t* vmareaToread=vmmap_lookup(map,vfn);
    pframe_t* pfToWriteFrom;
    int err=pframe_lookup(vmareaToread->vma_obj,vfn-vmareaToread->vma_start+vmareaToread->vma_off,1,&pfToWriteFrom);

    
    if(vfn==vfnToReadFrom)
    {
        memcpy(buf,(char*)pfToWriteFrom->pf_addr+startPageOffset,PAGE_SIZE-startPageOffset);
        whereToCopy=PAGE_SIZE-startPageOffset;
        buf=(char*)buf+whereToCopy;
        
    }
    else
    {
        if(vfn==vfnToReadUpto)
        {
            memcpy(buf,pfToWriteFrom->pf_addr,endPageTillwhere);
            buf=(char*)buf+endPageTillwhere;
        }
        memcpy(buf,pfToWriteFrom->pf_addr,PAGE_SIZE);
        buf=(char*)buf+PAGE_SIZE;
    }
    vfn++;

    }

    return 0;



  
}*/

/* Write from 'buf' into the virtual address space of 'map' starting at
 * 'vaddr' for size 'count'. To do this, you will need to find the correct
 * vmareas to write into, then find the correct pframes within those vmareas,
 * and finally write into the physical addresses that those pframes correspond
 * to. You should not check permissions of the areas you use. Assume (KASSERT)
 * that all the areas you are accessing exist. Remember to dirty pages!
 * Returns 0 on success, -errno on error.
 */
int vmmap_write(vmmap_t *map, void *vaddr, const void *buf, size_t count)
{
    dbg(DBG_PRINT, "vmmap_write\n");
    size_t bytes_to_copy, bytes_copied = 0;
    pframe_t *pframe;
    vmarea_t *vmarea;
    uintptr_t paddr;
    uintptr_t offset = PAGE_OFFSET(vaddr);
    int i = 0;
    int vfn=0;

    // Loop until all bytes are written
    while (bytes_copied < count) {
        // Find the vmarea that the virtual address belongs to
        vmarea = vmmap_lookup(map, ADDR_TO_PN((size_t)vaddr + bytes_copied));
        if (vmarea == NULL) {
            return -EFAULT;
        }

        vfn= ADDR_TO_PN((size_t)vaddr + bytes_copied);

        // Find the page frame whose data we need
        if (pframe_lookup(vmarea->vma_obj, (vfn-vmarea->vma_start)+vmarea->vma_off, 1, &pframe) < 0) {
            return -EFAULT;
        }
/*
        // Calculate the physical address
        paddr = pt_virt_to_phys((uintptr_t)vaddr + bytes_copied);

        // Calculate the offset within the page
        offset = PAGE_OFFSET(paddr);
*/
        // Calculate the number of bytes to copy
        bytes_to_copy = MIN(count - bytes_copied, PAGE_SIZE - offset);

        // Mark the page as dirty
        pframe_dirty(pframe);

        // Copy the data from the buffer to the physical memory
        memcpy((char*)((uintptr_t)(pframe->pf_addr) + offset), (void *)((size_t)buf + bytes_copied), bytes_to_copy);


        // Update the number of bytes copied
        bytes_copied += bytes_to_copy;
        offset = 0;
    }

    return 0;
}
