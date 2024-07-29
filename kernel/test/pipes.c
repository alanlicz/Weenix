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

#include "errno.h"
#include "globals.h"

#include "fs/file.h"
#include "fs/pipe.h"
#include "fs/vfs_syscall.h"

#include "proc/kmutex.h"
#include "proc/kthread.h"
#include "proc/proc.h"
#include "proc/sched.h"

#include "test/kshell/kshell.h"
#include "test/kshell/io.h"

#include "util/debug.h"
#include "util/init.h"

#define IMAX 256
#define JMAX 16
#define KMAX 16
#define ISTEP (JMAX*KMAX)

static kthread_t *
make_proc_and_thread(char *name, kthread_func_t func, int arg1, void *arg2)
{
        proc_t *proc = proc_create(name);
        if (!proc) {
                return NULL;
        }

        int i;
        for (i = 0; i < NFILES; ++i) {
                proc->p_files[i] = curproc->p_files[i];
                if (proc->p_files[i]) fref(proc->p_files[i]);
        }
        return kthread_create(proc, func, arg1, arg2);
}

static void *
producer(int arg1, void *arg2)
{
        int fd = arg1;
        kshell_t *ksh = (kshell_t *)arg2;

        kprintf(ksh, "Producing bytes...\n");

        unsigned char buf[KMAX];
        int i, j, k;
        for (i = 0; i < IMAX; ++i) {
                for (j = 0; j < JMAX; ++j) {
                        for (k = 0; k < KMAX; ++k) {
                                buf[k] = i ^ (j*KMAX+k);
                        }
                        kprintf(ksh, "Writing bytes %d to %d\n", i*ISTEP + j*KMAX, i*ISTEP + (j+1)*KMAX);
                        if (do_write(fd, buf, KMAX) == -EPIPE) {
                                kprintf(ksh, "Got EPIPE\n");
                                goto out;
                        }
                }
                kprintf(ksh, "Wrote %d bytes\n", (i+1)*ISTEP);
        }
out:
        return NULL;
}

static void *
consumer(int arg1, void *arg2)
{
        int fd = arg1;
        kshell_t *ksh = (kshell_t *)arg2;

        kprintf(ksh, "Consuming bytes...\n");
        unsigned char buf[KMAX];
        int i, j, k;
        for (i = 0; i < IMAX; ++i) {
                for (j = 0; j < JMAX; ++j) {
                        kprintf(ksh, "Reading bytes %d to %d\n", i*ISTEP + j*KMAX, i*ISTEP + (j+1)*KMAX);
                        if (do_read(fd, buf, KMAX) == 0) {
                                kprintf(ksh, "End of pipe\n");
                                goto out;
                        }
                        for (k = 0; k < KMAX; ++k) {
                                if (buf[k] != (i ^ (j*KMAX+k))) {
                                        kprintf(ksh, "Byte %d incorrect (expected %2x, got %2x)\n",
                                                i*ISTEP + j*KMAX + k, (i ^ (j*KMAX+k)), buf[k]);
                                }
                        }
                }
                kprintf(ksh, "Read %d bytes\n", (i+1)*ISTEP);
        }
out:
        return NULL;
}

static int
test_pipes(kshell_t *ksh, int argc, char **argv)
{
        int pfds[2];
        int err = do_pipe(pfds);
        if (err < 0) {
                kprintf(ksh, "Failed to create pipe\n");
        }
        kprintf(ksh, "Created pipe with read fd %d and write fd %d\n", pfds[0], pfds[1]);

        sched_make_runnable(make_proc_and_thread("producer", producer, pfds[1], ksh));
        kprintf(ksh, "Created producer process\n");
        sched_make_runnable(make_proc_and_thread("consumer", consumer, pfds[0], ksh));
        kprintf(ksh, "Created consumer process\n");

        do_waitpid(-1, 0, 0);
        do_waitpid(-1, 0, 0);
        return 0;
}

#ifdef __PIPES__
static __attribute__((unused)) void
test_pipes_init()
{
        kshell_add_command("test_pipes", test_pipes, "run pipe tests");
}
init_func(test_pipes_init);
init_depends(kshell_init);
#endif /* __PIPES__ */

