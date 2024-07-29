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

#define FMODE_READ    1
#define FMODE_WRITE   2
#define FMODE_APPEND  4 

struct vnode;

typedef struct file {
        /*
         * The current position in the file. Can be modified by system calls
         * like lseek(2), read(2), and write(2) (and possibly others) as
         * described in the man pages of those calls.
         */
        off_t                   f_pos;

        /*
         * The mode in which this file was opened. This is a mask of the flags
         * FMODE_READ, FMODE_WRITE, and FMODE_APPEND. It is set when the file
         * is first opened, and use to restrict the operations that can be
         * performed on the underlying vnode.
         */
        int                     f_mode;

        /*
         * The number of references to this struct. This is nearly the same as
         * the vnode's vn_refcount member.
         */
        int                     f_refcount;

        /*
         * The vnode which corresponds to this file.
         */
        struct vnode            *f_vnode;
} file_t;

/*
 * Returns the file_t assiciated with the given file descriptor for the
 * current process. If there is no associated file_t, returns NULL.
 *
 * If the passed fd == -1, a new file_t, not associated with any process
 * or file descriptor, is created and returned with its refcount set to
 * 1.
 */
struct file *fget(int fd);

/*
 * Places the vnode vn inside of the given file, possibly calling the
 * acquire vnode operation if one exists.
 */
void facq(file_t *f, struct vnode *vn);

/*
 * fref() increments the reference count on the given file.
 */
void fref(file_t *f);

/*
 * fput() decrements the reference count on the given file.
 *
 * If the refcount reaches 0, the storage for the given file_t will be
 * released (f won't point to a valid memory address anymore), and the
 * refcount on the associated vnode (if any) will be decremented.
 * The vnode release operation will also be called if it exists.
 */
void fput(file_t *f);
