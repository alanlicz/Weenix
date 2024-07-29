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

#define NULL 0

typedef signed char        int8_t;
typedef unsigned char      uint8_t;
typedef signed short       int16_t;
typedef unsigned short     uint16_t;
typedef signed int         int32_t;
typedef unsigned int       uint32_t;
#if defined(__i386__)
typedef signed long long   int64_t;
typedef unsigned long long uint64_t;
typedef signed int         intptr_t;
typedef unsigned int       uintptr_t;
#elif defined(__x86_64__) || defined(__ia64__)
typedef signed long        int64_t;
typedef unsigned long      uint64_t;
typedef signed long        intptr_t;
typedef unsigned long      uintptr_t;
#endif

typedef uint32_t           size_t;
typedef int32_t            ssize_t;
typedef int32_t            off_t;
typedef int64_t            off64_t;
typedef int32_t            pid_t;
typedef uint16_t           mode_t;
typedef uint32_t           blocknum_t;
typedef uint32_t           ino_t;
typedef uint32_t           devid_t;
