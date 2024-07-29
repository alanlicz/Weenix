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

/* Kernel and user header (via symlink) */

/* Page protection flags.
*/
#define PROT_NONE       0x0     /* No access. */
#define PROT_READ       0x1     /* Pages can be read. */
#define PROT_WRITE      0x2     /* Pages can be written. */
#define PROT_EXEC       0x4     /* Pages can be executed. */

/* Return value for mmap() on failure.
*/
#define MAP_FAILED      ((void*)-1)

/* Mapping type - shared or private.
*/
#define MAP_SHARED      1
#define MAP_PRIVATE     2
#define MAP_TYPE        3     /* mask for above types */

/* Mapping flags.
*/
#define MAP_FIXED       4
#define MAP_ANON        8
