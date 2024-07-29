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

#include "test/kshell/kshell.h"

/*
 * When writing a kernel shell command, make sure to use the following
 * I/O functions.
 *
 * Before VFS is not enabled, the kernel shell will use functions from
 * bytedev.h to get a pointer the the bytedev_t struct for the TTY.
 *
 * When VFS is enabled, the kernel shell will use the functions from
 * vfs_syscall.h to open and close the TTY and perform I/O operations
 * on the TTY.
 *
 * If you use the functions below, this process will be completely
 * transparent.
 */

/**
 * Replacement for do_write.
 *
 * @param ksh the kshell to write to
 * @param buf the buffer to write out to the kshell
 * @param nbytes the maximum number of bytes to write
 * @return number of bytes written on sucess and <0 on error
 */
int kshell_write(kshell_t *ksh, const void *buf, size_t nbytes);

/**
 * Replacement for do_read.
 *
 * @param ksh the kshell to read from
 * @param buf the buffer to store data read from the kshell
 * @param nbytes the maximum number of bytes to read
 * @param number of bytes read on success and <0 on error
 */
int kshell_read(kshell_t *ksh, void *buf, size_t nbytes);

/* Unless an error occurs, guarantees that all of buf will be
 * written */
/**
 * Writes a specified number of bytes from a buffer to the
 * kshell. Unlike kshell_write, this function guarantees it will write
 * out the desired number of bytes.
 *
 * @param ksh the kshell to write to
 * @param buf the buffer to write out to the kshell
 * @param nbytes the number of bytes to write
 * @return number of bytes written on success and <0 on error
 */
int kshell_write_all(kshell_t *ksh, void *buf, size_t nbytes);

/* Replacement for printf */
/**
 * Write output to a kshell according to a format string.
 *
 * @param ksh the kshell to write to
 * @param fmt the format string
 */
void kprintf(kshell_t *ksh, const char *fmt, ...);
