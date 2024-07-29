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
 *  FILE: stat.h
 *  AUTH: mcc
 *  DESC:
 *  DATE: Fri Mar 13 23:10:46 1998
 */

#pragma once

/* Kernel and user header (via symlink) */

struct stat {
        int st_mode;
        int st_ino;
        int st_dev;
        int st_rdev;
        int st_nlink;
        int st_uid;
        int st_gid;
        int st_size;
        int st_atime;
        int st_mtime;
        int st_ctime;
        int st_blksize;
        int st_blocks;
};

/* vnode vn_mode masks */

#define S_IFCHR         0x0100 /* character special */
#define S_IFDIR         0x0200 /* directory */
#define S_IFBLK         0x0400 /* block special */
#define S_IFREG         0x0800 /* regular */
#define S_IFLNK         0x1000 /* symlink */
#define S_IFIFO         0x2000 /* fifo/pipe */

#define _S_TYPE(m)      ((m) & 0xFF00)
#define S_ISCHR(m)      (_S_TYPE(m) == S_IFCHR)
#define S_ISDIR(m)      (_S_TYPE(m) == S_IFDIR)
#define S_ISBLK(m)      (_S_TYPE(m) == S_IFBLK)
#define S_ISREG(m)      (_S_TYPE(m) == S_IFREG)
#define S_ISLNK(m)      (_S_TYPE(m) == S_IFLNK)
#define S_ISFIFO(m)     (_S_TYPE(m) == S_IFIFO)
