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

#include "util/list.h"

#define dprintf(x, args...) dbg(DBG_TEST, x, ## args)

#define KSH_BUF_SIZE 1024 /* This really just needs to be as large as
* the line discipline buffer */
#define KSH_CMD_NAME_LEN 16
#define KSH_MAX_ARGS 128
#define KSH_DESC_LEN 64

struct bytedev;
struct kshell_command;

struct kshell {
        /* If we have a filesystem, we can write to the file
         * descriptor. Otherwise, we need to write to a byte device */
#ifdef __VFS__
        int ksh_fd;

        /* Used for redirection */
        int ksh_out_fd;
        int ksh_in_fd;
#else
        struct bytedev *ksh_bd;
#endif
};

list_t kshell_commands_list;

/**
 * Searches for a shell command with a specified name.
 *
 * @param name name of the command to search for
 * @param namelen length of name
 * @return the command, if it exists, or NULL
 */
struct kshell_command *kshell_lookup_command(const char *name, size_t namelen);
