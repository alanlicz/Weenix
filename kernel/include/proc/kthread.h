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
 *   FILE: kthread.h
 * AUTHOR: kma
 *  DESCR: a kthread structure
 */
#pragma once

#include "util/list.h"

#include "proc/sched.h"
#include "proc/context.h"

typedef context_func_t kthread_func_t;

/* thread states */
typedef enum
{
        KT_NO_STATE,           /* illegal state */
        KT_RUN,                /* currently running, or on runq */
        KT_SLEEP,              /* blocked for an indefinite amount of time */
        KT_SLEEP_CANCELLABLE,  /* blocked, but this sleep can be cancelled */
        KT_EXITED              /* has exited, waiting to be joined */
} kthread_state_t;

struct proc;
typedef struct kthread {
        context_t       kt_ctx;         /* this thread's context */
        char           *kt_kstack;      /* the kernel stack */
        void           *kt_retval;      /* this thread's return value */
        int             kt_errno;       /* error no. of most recent syscall */
        struct proc    *kt_proc;        /* the thread's process */

        int             kt_cancelled;   /* 1 if this thread has been cancelled */
        ktqueue_t      *kt_wchan;       /* The queue that this thread is blocked on */
        kthread_state_t kt_state;       /* this thread's state */

        /*
         * This is the thread's link on a queue. Every thread must
         * either be on a queue, or running, or else the thread will be lost
         * forever.
         */
        list_link_t     kt_qlink;       /* link on ktqueue */
        list_link_t     kt_plink;       /* link on proc thread list, p_threads */
#ifdef __MTP__
        int             kt_detached;    /* if the thread has been detached */
        ktqueue_t       kt_joinq;       /* thread waiting to join with this thread */
#endif
} kthread_t;

void kthread_init(void);

/**
 * Allocates and initializes a kernel thread.
 *
 * @param p the process in which the thread will run
 * @param func the function that will be called when the newly created
 * thread starts executing
 * @param arg1 the first argument to func
 * @param arg2 the second argument to func
 * @return the newly created thread
 */
kthread_t *kthread_create(struct proc *p, kthread_func_t func, long arg1, void *arg2);

/**
 * Free resources associated with a thread.
 *
 * @param t the thread to free
 */
void kthread_destroy(kthread_t *t);

/**
 * Cancel a thread.
 *
 * @param kthr the thread to be cancelled
 * @param retval the return value for the thread
 */
void kthread_cancel(kthread_t *kthr, void *retval);

/**
 * Exits the current thread.
 *
 * @param retval the return value for the thread
 */
void kthread_exit(void *retval);

/**
 * Allocates a new thread that is a copy of a specified thread.
 *
 * @param thr the thread to clone
 * @return a cloned version of thr
 */
kthread_t *kthread_clone(kthread_t *thr);

#ifdef __MTP__
/**
 * Shuts down the reaper daemon.
 */
void kthread_reapd_shutdown(void);

/**
 * Put a thread in the detached state.
 *
 * @param kthr the thread to put in the detached state
 * @return 0 on sucess and <0 on error
 */
int kthread_detach(kthread_t *kthr);

/**
 * Wait for the termination of another thread.
 *
 * @param kthr the thread to wait for
 * @param retval if retval is not NULL, the return value for kthr is
 * stored in the location pointed to by retval
 * @return 0 on sucess and <0 on error
 */
int kthread_join(kthread_t *kthr, void **retval);
#endif
