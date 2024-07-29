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

#include "proc/kthread.h"

#include "mm/pagetable.h"

#include "vm/vmmap.h"

#include "config.h"

#define PROC_MAX_COUNT  65536
#define PROC_NAME_LEN   256

struct regs;

/* Process states. */
typedef enum
{
        PROC_RUNNING,   /* has running threads */
        PROC_DEAD       /* has already exited, hasn't been wait'ed */
} proc_state_t;

typedef struct proc {
        pid_t           p_pid;                 /* our pid */
        char            p_comm[PROC_NAME_LEN]; /* process name */

        list_t          p_threads;       /* the process's thread list */
        list_t          p_children;      /* the process's children list */
        struct proc    *p_pproc;         /* our parent process */

        int             p_status;        /* exit status */
        proc_state_t    p_state;         /* running/sleeping/etc. */


        /*
         * This is the queue a process puts itself on when it wants to wait on
         * one of its children. When the child process terminates
         * it will broadcast on this queue, waking the waiting process.
         * See do_waitpid in proc.c for more details.
        */
        ktqueue_t       p_wait;          /* queue for wait(2) */

        pagedir_t      *p_pagedir;

        list_link_t     p_list_link;     /* link on the list of all processes */
        list_link_t     p_child_link;    /* link on parent process' p_children list */

        /* VFS-related: */
        struct file    *p_files[NFILES]; /* open files */
        struct vnode   *p_cwd;           /* current working dir */

        /* VM */
        void           *p_brk;           /* process break; see brk(2) */
        void           *p_start_brk;     /* initial value of process break */
        struct vmmap   *p_vmmap;         /* list of areas mapped into
                                          * process' user address
                                          * space */
} proc_t;

/* Special PIDs for Kernel Deamons */
#define PID_IDLE     0
#define PID_INIT     1

void proc_init(void);

/**
 * This function allocates and initializes a new process.
 *
 * @param name the name to give the newly created process
 * @return the newly created process
 */
proc_t *proc_create(char *name);

/**
 * Finds the process with the specified PID.
 *
 * @param pid the PID of the process to find
 * @return a pointer to the process with PID pid, or NULL if there is
 * no such process
 */
proc_t *proc_lookup(int pid);

/**
 * Returns the list of running processes.
 *
 * @return the list of running processes
 */
list_t *proc_list(void);

/**
 * Stops another process from running again by cancelling all its
 * threads.
 *
 * @param p the process to kill
 * @param status the status the process should exit with
 */
void proc_kill(proc_t *p, int status);

/**
 * Kill every process except for the idle process and direct children
 * of the idle process.
 */
void proc_kill_all(void);

/**
 * Alerts the process that the currently executing thread has just
 * exited.
 *
 * @param retval the return value for the current thread
 */
void proc_thread_exited(void *retval);

/**
 * This function implements the _exit(2) system call.
 *
 * @param status the exit status of the process
 */
void do_exit(int status);

/**
 * This function implements the waitpid(2) system call.
 *
 * @param pid see waitpid man page, only -1 or positive numbers are supported
 * @param options see waitpid man page, only 0 is supported
 * @param status used to return the exit status of the child
 *
 * @return the pid of the child process which was cleaned up, or
 * -ECHILD if there are no children of this process
 */
pid_t do_waitpid(pid_t pid, int options, int *status);

/**
 * This function implements the fork(2) system call.
 *
 * @param regs the register state at the time of the system call
 */
int do_fork(struct regs *regs);

/**
 * Provides detailed debug information about a given process.
 *
 * @param arg a pointer to the process
 * @param buf buffer to write to
 * @param osize size of the buffer
 * @return the remaining size of the buffer
 */
size_t proc_info(const void *arg, char *buf, size_t osize);

/**
 * Provides debug information overview of all processes.
 *
 * @param arg must be NULL
 * @param buf buffer to write to
 * @param osize size of the buffer
 * @return the remaining size of the buffer
 */
size_t proc_list_info(const void *arg, char *buf, size_t osize);
