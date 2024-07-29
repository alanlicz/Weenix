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

#include "util/list.h"

struct pframe;
typedef struct mmobj_ops mmobj_ops_t;

typedef struct mmobj {
        mmobj_ops_t        *mmo_ops;
        int                 mmo_refcount;   /* mmo_refcount >= mmo_nrespages >= 0 */

        /*
         * Members maintained by the pframe module; only the pframe module may
         * modify these, but others may read/access them:
         */
        int                 mmo_nrespages;
        list_t              mmo_respages;
        /*
         * For shadow objects, the mmo_bottom_obj member of the union should point
         * to the bottommost object in the shadow chain. For non-shadow objects, the
         * mmo_vmas member of the union, should be a list of all vm_areas that
         * have this object at the bottom of their tree of mmobjs.
         */
        union {
                list_t            mmo_vmas;
                struct mmobj     *mmo_bottom_obj;
        }                   mmo_un;

        /*
         * Note to self: field not used by mmobj code at all.. used
         * externally by vm code to stack anonymous objects on top of other
         * objects.
         */
        /* Members relevant only to shadow objects: */
        struct mmobj       *mmo_shadowed;   /* the object that we shadow */
} mmobj_t;

struct mmobj_ops {

        /* Add a reference to 'o'.
         * This may not block. */
        void (*ref)(mmobj_t *o);

        /* Drop a reference to 'o'.
         * This may block. */
        void (*put)(mmobj_t *o);

        /* Finds the correct page frame from a high-level perspective
         * for performing the given operation on an area backed by
         * the given pagenum of the given object. If "forwrite" is
         * specified then the pframe should be suitable for writing;
         * otherwise, it is permitted not to support writes. In
         * either case, it must correctly support reads.
         *
         * Most objects will simply return a page from their
         * own list of pages, but objects such as shadow objects
         * may need to perform more complicated operations to find
         * the appropriate page.
         * This may block.
         * Return 0 on success and -errno otherwise. */
        int (*lookuppage)(mmobj_t *o, uint32_t pagenum, int forwrite, struct pframe **pf);

        /* Fill the page frame starting at address pf->pf_addr with the
         * contents of the page identified by pf->pf_obj and pf->pf_pagenum.
         * This may block.
         * Return 0 on success and -errno otherwise.
         */
        int (*fillpage)(mmobj_t *o, struct pframe *pf);

        /* A hook; called when a request is made to dirty a non-dirty page.
         * Perform any necessary actions that must take place in order for it
         * to be possible to dirty (write to) the provided page. (For example,
         * if this page corresponds to a sparse block of a file that belongs to
         * an S5 filesystem, it would be necessary/desirable to allocate a
         * block in the fs before allowing a write to the block to proceed).
         * This may block.
         * Return 0 on success and -errno otherwise.
         */
        int (*dirtypage)(mmobj_t *o, struct pframe *pf);

        /*
         * Write the contents of the page frame starting at address
         * pf->pf_paddr to the page identified by pf->pf_obj and
         * pf->pf_pagenum.
         * This may block.
         * Return 0 on success and -errno otherwise.
         */
        int (*cleanpage)(mmobj_t *o, struct pframe *pf);
};


/*
 * Since by default the object is initialized as not a shadow object,
 * we intialize the mmo_vmas member of its union here
 */
static inline void mmobj_init(mmobj_t *o, mmobj_ops_t *ops)
{
        (o)->mmo_ops = (ops);
        (o)->mmo_refcount = 0;
        (o)->mmo_nrespages = 0;
        list_init(&(o)->mmo_respages);
        list_init(&(o)->mmo_un.mmo_vmas);
        (o)->mmo_shadowed = NULL;
}

#define mmobj_bottom_obj(o) \
        ((mmobj_t*) (NULL == (o)->mmo_shadowed)? \
         (o):((o)->mmo_un.mmo_bottom_obj))

#define mmobj_bottom_vmas(o) \
        ((list_t *)(&(mmobj_bottom_obj(o))->mmo_un.mmo_vmas))

