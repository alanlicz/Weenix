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
 *   FILE: config.h
 * AUTHOR: kma
 *  DESCR: tunable kernel parameters
 */

#pragma once

/* Kernel and user header (via symlink) */

/*
 * kernel configuration parameters
 */
#define DEFAULT_STACK_SIZE      (56*1024) /* size of stacks */
#define TICK_MSECS              10        /* msecs between clock interrupts */

/*
 * Memory-management-related:
 */

/*
 *     finds fraction of available page frames that will be dedicated to kmem
 *     the rest are given to the vm system
 */
#define KMEM_FRAC(x)               (((x)>>2)+((x)>>3)) /* 37.5%-ish */

/*     pframe/mmobj-system-related: */
#define PF_HASH_SIZE                  17 /* Number of buckets in pn/mmobj->pframe hash */
/*         Pageout-related: */
#define PAGEOUTD_FREE_TARGET_SHIFT     5 /* 3.125% */
#define PAGEOUTD_FREE_MIN_SHIFT        4 /* 6.25% */


/*
 * filesystem/vfs configuration parameters
 */

#define MAXPATHLEN              1024    /* maximum size of a pathname */
#define MAX_FILES               1024    /* max number of files */
#define MAX_VFS                 8       /* max # of vfses */
#define MAX_VNODES              1024    /* max number of in-core vnodes */
#define NAME_LEN                28      /* maximum directory entry length */
#define NFILES                  32      /* maximum number of open files */

/* Note: if rootfs is ramfs, this is completely ignored */
#define VFS_ROOTFS_DEV  "disk0" /* device containing root filesystem */

#ifdef __S5FS__
/* root filesystem type - either "ramfs" or "s5fs" */
#    define VFS_ROOTFS_TYPE "s5fs"
#else
#    define VFS_ROOTFS_TYPE "ramfs"
#endif
