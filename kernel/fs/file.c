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

/*
 *  FILE: file.c
 *  AUTH: mcc | mahrens
 *  DESC:
 *  DATE: Fri Apr  3 20:38:30 1998
 */

#include "kernel.h"
#include "util/init.h"
#include "util/debug.h"
#include "util/string.h"
#include "util/printf.h"
#include "globals.h"
#include "util/list.h"
#include "fs/file.h"
#include "fs/vfs.h"
#include "fs/vnode.h"
#include "proc/proc.h"
#include "mm/slab.h"
#include "config.h"

static slab_allocator_t *file_allocator;

static __attribute__((unused)) void
file_init(void)
{
        file_allocator = slab_allocator_create("file", sizeof(file_t));
}
init_func(file_init);

void
fref(file_t *f)
{
        KASSERT(f->f_mode >= 0 && f->f_mode < 8);
        KASSERT(f->f_pos >= -1);
        KASSERT(f->f_refcount >= 0);
        if (f->f_refcount != 0) KASSERT(f->f_vnode);

        f->f_refcount++;

        if (f->f_vnode) {
                dbg(DBG_FREF, "fref: 0x%p, 0x%p ino %lu, refcount(f) up to %d, refcount(vnode) at %d\n",
                    f, f->f_vnode->vn_fs, (unsigned long) f->f_vnode->vn_vno,
                    f->f_refcount, f->f_vnode->vn_refcount);
        } else {
                dbg(DBG_FREF, "fref: 0x%p up to %d\n", f, f->f_refcount);
        }
}

/* Add vnode to file, and call acquire if available. */
void
facq(file_t *f, vnode_t *vn)
{
        KASSERT(f);
        KASSERT(f->f_vnode == NULL);
        KASSERT(vn);

        f->f_vnode = vn;
        if (vn->vn_ops->acquire) {
                vn->vn_ops->acquire(vn, f);
        }
}

/* Look in process fd table and return the file*. */
file_t *
fget(int fd)
{
        file_t *f;

        if (fd == -1) {
                f = slab_obj_alloc(file_allocator);
                if (f) memset(f, 0, sizeof(file_t));
        } else {
                if (fd < 0 || fd >= NFILES)
                        return NULL;
                f = curproc->p_files[fd];
        }
        if (f) fref(f);

        return f;
}

/* - Decrement f_count.
 * - If f_count == 0, call release (if available), vput() and free it. */
void
fput(file_t *f)
{
        KASSERT(f);
        KASSERT(f->f_mode >= 0 && f->f_mode < 8);
        KASSERT(f->f_pos >= -1);
        KASSERT(f->f_refcount > 0);
        if (f->f_refcount != 1) KASSERT(f->f_vnode);

        f->f_refcount--;

        if (f->f_vnode) {
                dbg(DBG_FREF, "fput: 0x%p, 0x%p ino %lu, refcount(f) down to %d, refcount(vnode) at %d\n",
                    f, f->f_vnode->vn_fs, (unsigned long) f->f_vnode->vn_vno,
                    f->f_refcount, f->f_vnode->vn_refcount);
        } else {
                dbg(DBG_FREF, "fput: 0x%p down to %d\n", f, f->f_refcount);
        }

        if (f->f_refcount == 0) {
                vnode_t *vn = f->f_vnode;
                if (vn) {
                        if (vn->vn_ops->release) {
                                vn->vn_ops->release(vn, f);
                        }
                        vput(vn);
                }
                slab_obj_free(file_allocator, f);
        }
}
