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

#include "errno.h"
#include "fs/vnode.h"
#include "util/debug.h"
/*
 * Related to implementation of vnode vm_object entry points:
 */

#define mmobj_to_vnode(o) \
        (CONTAINER_OF((o), vnode_t, vn_mmobj))

void
vo_vref(mmobj_t *o)
{
        KASSERT(o);
        vref(mmobj_to_vnode(o));
}

void
vo_vput(mmobj_t *o)
{
        KASSERT(o);
        vput(mmobj_to_vnode(o));
}

int
vlookuppage(mmobj_t *o, uint32_t pagenum, int forwrite, pframe_t **pf)
{
        KASSERT(NULL != pf);
        KASSERT(NULL != o);

        if ((uint32_t) mmobj_to_vnode(o)->vn_len <= pagenum * PAGE_SIZE) {
                return -EINVAL;
        }

        return pframe_get(o, pagenum, pf);
}

int
vreadpage(mmobj_t *o, pframe_t *pf)
{
        KASSERT(NULL != pf);
        KASSERT(NULL != o);

        vnode_t *v = mmobj_to_vnode(o);
        return v->vn_ops->fillpage(v, (int)PN_TO_ADDR(pf->pf_pagenum), pf->pf_addr);
}

int
vdirtypage(mmobj_t *o, pframe_t *pf)
{
        KASSERT(NULL != pf);
        KASSERT(NULL != o);

        vnode_t *v = mmobj_to_vnode(o);
        if (!pframe_is_dirty(pf)) {
                return v->vn_ops->dirtypage(v, (int) PN_TO_ADDR(pf->pf_pagenum));
        } else {
                return 0;
        }
}

int
vcleanpage(mmobj_t *o, pframe_t *pf)
{
        KASSERT(NULL != pf);
        KASSERT(NULL != o);

        vnode_t *v = mmobj_to_vnode(o);
        return v->vn_ops->cleanpage(v, (int) PN_TO_ADDR(pf->pf_pagenum), pf->pf_addr);
}