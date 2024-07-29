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

typedef struct kshell kshell_t;
typedef int (*kshell_cmd_func_t)(kshell_t *, int argc, char **argv);

/**
 * Process init function for a new kshell.
 */
void *kshell_proc_run(int tty, void *arg2);

/**
 * Adds a command to the global command table for kernel shells.
 *
 * Note: When writing commands for the kernel shell, you _MUST_ use
 * the I/O functions from kshell_io.h instead of normal I/O
 * functions. See comment in kshell_io.h for more information.
 *
 * @param name the name of the command. Typing this name into the
 * shell will execute the command.
 * @param command the command to add to the shell
 * @param desc a description of the command. This is what will be
 * printed by the command 'help <command>'
 */
void kshell_add_command(const char *name, kshell_cmd_func_t command,
                        const char *desc);

/**
 * Allocates and initializes a kshell.
 *
 * @param bd the byte device the kshell will read from and write to
 * @return a kshell
 */
kshell_t *kshell_create(uint8_t ttyid);

/**
 * Destroys a kshell.
 *
 * @param ksh the kshell to destroy
 */
void kshell_destroy(kshell_t *ksh);

/**
 * Reads from the kshell's byte device and attempts to execute a
 * command.
 *
 * @param ksh the kshell to execute commands with
 * @return the number of bytes read
 */
int kshell_execute_next(kshell_t *ksh);
