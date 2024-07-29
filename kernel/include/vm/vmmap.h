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

#pragma once

#include "types.h"

#include "util/list.h"

#define VMMAP_DIR_LOHI 1
#define VMMAP_DIR_HILO 2

struct mmobj;
struct proc;
struct vnode;

typedef struct vmmap {
        list_t       vmm_list;
        struct proc *vmm_proc;
} vmmap_t;

/* make sure you understand why mapping boundaries are in terms of frame
 * numbers and not addresses */
typedef struct vmarea {
        uint32_t       vma_start;    /* [starting vfn, */
        uint32_t       vma_end;      /*  ending vfn) */
        uint32_t       vma_off;      /* offset from beginning of vma_obj in pages */

        int            vma_prot;     /* permissions on mapping */
        int            vma_flags;    /* either MAP_SHARED or MAP_PRIVATE */

        struct vmmap  *vma_vmmap;    /* address space that this area belongs to */
        struct mmobj  *vma_obj;      /* the vm object to read pages from */
        list_link_t    vma_plink;    /* link on process vmmap maps list */
        list_link_t    vma_olink;    /* link on the list of all vm_areas
                                      * having the same vm_object at the
                                      * bottom of their chain */
} vmarea_t;

void vmmap_init(void);

vmmap_t *vmmap_create(void);
void vmmap_destroy(vmmap_t *map);

vmarea_t *vmmap_lookup(vmmap_t *map, uint32_t vfn);
int vmmap_map(vmmap_t *map, struct vnode *file, uint32_t lopage, uint32_t npages, int prot, int flags, off_t off, int dir, vmarea_t **new);
int vmmap_remove(vmmap_t *map, uint32_t lopage, uint32_t npages);
int vmmap_is_range_empty(vmmap_t *map, uint32_t startvfn, uint32_t npages);
int vmmap_find_range(vmmap_t *map, uint32_t npages, int dir);

int vmmap_read(vmmap_t *map, const void *vaddr, void *buf, size_t count);
int vmmap_write(vmmap_t *map, void *vaddr, const void *buf, size_t count);

vmmap_t *vmmap_clone(vmmap_t *map);

size_t vmmap_mapping_info(const void *map, char *buf, size_t size);
