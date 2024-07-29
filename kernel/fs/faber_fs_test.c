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
 * BC: You must NOT change this file.  If you submit a modified version
 * of this file, it will be deleted from your submission.
 */
#include "errno.h"
#include "globals.h"

#include "proc/proc.h"
#include "proc/kthread.h"

#ifdef __VFS__
#include "fs/fcntl.h"
#include "fs/vfs_syscall.h"
#include "fs/lseek.h"
#include "fs/vnode.h"
#include "fs/s5fs/s5fs.h"
#endif

#include "test/kshell/io.h"
#include "test/kshell/kshell.h"

#include "util/debug.h"
#include "util/string.h"
#include "util/printf.h"

#define FILE_CONTENT "look!\n"
#define CONTENT_LEN 6
#define TESTBUFLEN 256

#ifdef __VFS__
#ifdef __VM__
/* Write a sparse file, specifically one that has FILE_CONTENT starting at byte
 * 50000 and no other data.  The size will be 50000+CONTENT_LEN, but only one
 * block is allocated to the file.
 */
int faber_sparse_test(kshell_t *ksh, int argc, char **argv) {
        KASSERT(NULL != ksh);
        KASSERT(NULL != argv);

	int f = -1;	/* file descriptor */
	int rv = 0;	/* Return value */

	/* Open the file, and create it if not present */
	if ( (f = do_open("/sparse", O_WRONLY | O_CREAT)) < 0) {
	    kprintf(ksh, "Couldn't open /sparse\n");
	    return -1;
	}

	/* Seek out 50000 bytes (the seek pointer is in the VFS layer, so the
	 * s5fs layer will just see a write at byte 50000 later) */
	if ( (rv = do_lseek(f, 50000, SEEK_END)) != 50000 ) {
	    do_close(f);
	    kprintf(ksh, "seek failed %d\n", rv);
	    return -1;
	}

	/* Write the visible bytes.  Here's where the first memory/disk block
	 * is allocated. */
	if ( do_write(f, FILE_CONTENT, CONTENT_LEN) != CONTENT_LEN) {
	    do_close(f);
	    kprintf(ksh, "File write failed?\n");
	    return -1;
	}

	/* Close up and go home */
	do_close(f);
	kprintf(ksh, "Created sparse file \"/sparse\"\n");
	return 0;
}
#endif /* __VM__ */

static char block[S5_BLOCK_SIZE];

/* Create as large a file as the file system structures will allow.  The disk
 * that comes with weenix will not support a file this size, so it will fail in
 * the do_write calls.
 */
int faber_space_test(kshell_t *ksh, int argc, char **argv) {
        KASSERT(NULL != ksh);
	int f = -1;	/* File descriptor */
	int rv = 0;	/* Return value */
	int i = 0;	/* Scratch */

	kprintf(ksh, "\n>>> Running faber_space_test()... ");
	/* Create the file */
	if ( (f = do_open("/space", O_WRONLY | O_CREAT)) < 0) {
	    kprintf(ksh, "Couldn't open /space (%d) %s\n", f, strerror(-f));
	    return -1;
	}
	/* Write data until the either the max size file is written or the
	 * filesystem fills.  The filesystem should fill.
	 */
	for ( i = 0; i < (int) S5_MAX_FILE_BLOCKS; i++ ) {
	    if ( (rv = do_write(f, block, S5_BLOCK_SIZE)) < 0 ) {
		/* Close the file or we keep it forever... */
		do_close(f);
		kprintf(ksh, "Error writing block %d of /space (%d) %s\n", 
			i, rv, strerror(-rv));
		return 0;
	    }
	}
	rv = 0;
	if (rv == 0) kprintf(ksh, "Done.\n");
	return 0;
}

/* 
 * A function executed by a thread that creates a directory called /dir00n
 * (where n is arg1) and writes 21 files into it called /dir00n/test000 through
 * /dir00n/test019.  If any fail, exit with their return code.  Threads running
 * this are created by both faber_fs_thread_test and faber_directory_test.
 */
static void *make_dir_thread(int arg1, void *arg2) {
	char dir[TESTBUFLEN];	/* A buffer for the directory name */
	char file[TESTBUFLEN];	/* A buffer for the full file pathname */
	int rv = 0;		/* return values */
	int i = 0;		/* Scratch */

	/* Make the directory name and the directory.  Snprintf is safe - it
	 * always zero-terminates and never overflows the buffer. */
	snprintf(dir, TESTBUFLEN, "/dir%03d", arg1);
	do_mkdir(dir);
	for (i = 0; i < 21 ; i++ ) {
	    int f= 0;	/* File descriptor */

	    snprintf(file, TESTBUFLEN, "%s/test%03d", dir, i);
	    /* Open a file (creating it if it's not there) */
	    if ( (f = do_open(file, O_WRONLY | O_CREAT)) < 0 ) {
		rv = f;
		goto fail;
	    }
	    /* Write the same content to every file. */
	    if ( (rv = do_write(f, FILE_CONTENT, CONTENT_LEN)) != CONTENT_LEN) {
		do_close(f);
		goto fail;
	    }
	    do_close(f);
	}
	rv = 0;
fail:
	do_exit(rv);
	return NULL;
}

/* 
 * A function executed by a thread that creates a directory called /dir00n
 * (where n is arg1) and unlinks 21 files from it called /dir00n/test000 through
 * /dir00n/test019.  Ignore the return codes (files may not be there yet).
 * Threads running this are created by faber_directory_test.  Structurally
 * similar to make_dir_thread. 
 */
static void *rm_dir_thread(int arg1, void *arg2) {
	char dir[TESTBUFLEN];	/* Directory pathname */
	char file[TESTBUFLEN];	/* Each file's pathname */
	int rv = 0;		/* Return value */
	int i = 0;		/* Scratch */

	/* Make the directory */
	snprintf(dir, TESTBUFLEN, "/dir%03d", arg1);
	do_mkdir(dir);

	/* Unlink the files */
	for (i = 0; i < 21 ; i++ ) {
	    snprintf(file, TESTBUFLEN, "%s/test%03d", dir, i);
	    do_unlink(file);
	}
	do_exit(rv);
	return NULL;
}

/* 
 * A function executed by a thread that deletes all files
 *     under a directory called /dir00n (where n is arg1).
 * Arg2 == 0 means directory should exist.
 * Arg2 == 1 means if directory does not exist, don't treat it as error.
 * Threads running this are created by faber_fs_thread_test.
 */
static void *clean_dir_thread(int arg1, void *arg2) {
	struct dirent d;	/* The current directory entry */
	char dir[TESTBUFLEN];	/* Directory pathname */
	char file[TESTBUFLEN];	/* Each file's pathname */
	int rv = 0;		/* Return value */
	int i = 0;		/* Scratch */
	int f = -1;		/* File descriptor (dirs must be opened) */
	int got_one = 1;	/* True if this iteration deleted a file */

	snprintf(dir, TESTBUFLEN, "/dir%03d", arg1);

	while ( got_one ) {
	    got_one = 0;
	    /* Open up the directory */
	    if ( (f = do_open(dir, O_RDONLY)) < 0 ) {
		if (arg2) {
		    do_exit(0);
		}
		do_exit(f);
	    }
	    while ( ( rv = do_getdent(f, &d)) > 0 ) {
		/* Keep looking if d contains . or .. */
		if ( strncmp(".", d.d_name, NAME_LEN) == 0 || strncmp("..", d.d_name, NAME_LEN) == 0 )
		    continue;
		/* Found a name to delete.  Construct the path and delete it */
		snprintf(file, TESTBUFLEN, "%s/%s", dir, d.d_name);
		if ( (rv = do_unlink(file)) < 0 ) {
		    /* Something went wrong- d probably points to a directory.
		     * Report the error, close f, and terminate the command. */
		    dbg(DBG_TEST, "Unlink failed on %s: %d %s\n", file, rv, strerror(-rv));
		    do_close(f);
		    do_exit(rv);
		}
		got_one = 1;
		/* CLose the directory and restart (because it set got_one) */
		break;
	    }
	    do_close(f);
	    if (rv) {
		do_exit(rv);
	    }
	}
	return NULL;
}

/*
 * Run multiple threads, each running make_dir_thread with a different
 * parameter.  The calling format (from the kshell) is thread_test <num>, where
 * num is an integer.  The number is parsed into an int and threads with
 * parameter 0..num are created.  This code then waits for them and prints each
 * exit value.  Fewer than 4 copies should exit safely, but more than that will
 * run out of inodes.
 */
int faber_fs_thread_test(kshell_t *ksh, int argc, char **argv) {
        KASSERT(NULL != ksh);

        proc_t *p = NULL;	    /* A process to run in */
        kthread_t *thr = NULL;	    /* A thread to run in the process */
	char tname[TESTBUFLEN];	    /* The thread name */
	int pid = 0;		    /* Process ID returned by do_waitpid */
	int lim = 1;		    /* Number of processes to start */
	int rv = 0;		    /* Return value */
	int i = 0;		    /* Scratch */
	int passed = 1;		    /* Passed all tests */

        KASSERT(NULL != ksh);
	kprintf(ksh, "\n>>> Running faber_fs_thread_test()... ");
	if ( argc == 1 ) {
	    kprintf(ksh, "\nError: faber_fs_thread_test() cannot run without a commandline argument.");
	    kprintf(ksh, "\nUsage: %s n\n", argv[0]);
	    return 1;
	}
	if ( argc > 1) {
	    /* Oh, barf, sscanf makes me ill.*/
	    if ( sscanf(argv[1], "%d", &lim) != 1)
		lim = 1;
	    /* A little bounds checking */
	    if ( lim < 1 || lim > 255 )
		lim = 1;
	}
	/* Start the children */
	for ( i = 0; i< lim; i++) {
	    snprintf(tname, TESTBUFLEN, "thread%03d", i);
	    p = proc_create(tname);
	    KASSERT(NULL != p);
	    thr = kthread_create(p, make_dir_thread, i, NULL);
	    KASSERT(NULL != thr);

	    sched_make_runnable(thr);
	}
	/* Wait for children and report errors in their return values */
	while ( ( pid = do_waitpid(-1, 0 , &rv) ) != -ECHILD) {
	    if ( rv < 0 ) {
		kprintf(ksh, "\nChild (make dir) %d: %d %s", pid, rv, strerror(-rv));
		passed = 0;
	    } else {
		kprintf(ksh, "\nChild (make dir) %d: %d", pid, rv);
	    }
	}
	for ( i = 0; i< lim; i++) {
	    snprintf(tname, TESTBUFLEN, "clean_dir_thread%03d", i);
	    p = proc_create(tname);
	    KASSERT(NULL != p);
	    thr = kthread_create(p, clean_dir_thread, i, (passed ? NULL : (void*)1));
	    KASSERT(NULL != thr);
	    sched_make_runnable(thr);
	    while ( ( pid = do_waitpid(-1, 0, &rv) ) != -ECHILD)
		if ( rv < 0 )
		    kprintf(ksh, "\nChild (clean dir) %d: %d %s", pid, rv, strerror(-rv));
		else
		    kprintf(ksh, "\nChild (clean dir) %d: %d", pid, rv);
	}
        for ( i = 0; i< lim; i++) {
            int rv2;
            snprintf(tname, TESTBUFLEN, "/dir%03d", i);
            if ((rv2 = do_rmdir(tname)) < 0) {
                rv = rv2;
                kprintf(ksh, "\nFailed rmdir(%s): %d %s", tname, rv, strerror(-rv));
		passed = 0;
            }
        }
	if (passed) {
	    kprintf(ksh, "\nNothing failed (you need to decide if this is the expected behavior or not).\n");
	} else {
	    kprintf(ksh, "\nSomething failed (you need to decide if this is the expected behavior or not).\n");
	}
	return 0;
}

/*
 * Run multiple pairs of threads, each running make_dir_thread or rm_dir_thread
 * with a different parameter.  One will be creating a directory full of files,
 * and the other will be deleting them.  They do not move in lock step, so for
 * a few threads, say 4 or 5, the system is likely to run out of i-nodes.
 *
 * The calling format (from the kshell) is
 * directory_test <num>, where num is an integer.  The number is parsed into an
 * int and pairs of threads with parameter 0..num are created.  This code then
 * waits for them and prints each exit value.
 */
int faber_directory_test(kshell_t *ksh, int argc, char **argv) {
        KASSERT(NULL != ksh);

        proc_t *p = NULL;	/* A process to run in */
        kthread_t *thr = NULL;	/* A thread to run in it */
	char tname[TESTBUFLEN];	/* A thread name */
	int pid = 0;		/* Process ID from do_waitpid (who exited?) */
	int lim = 1;		/* Number of processes to run */
	int rv = 0;		/* Return values */
	int i = 0;		/* Scratch */
	int passed = 1;		/* Passed all tests */

        KASSERT(NULL != ksh);
	kprintf(ksh, "\n>>> Running faber_directory_test()... ");
	if ( argc == 1 ) {
	    kprintf(ksh, "\nError: faber_directory_test() cannot run without a commandline argument.");
	    kprintf(ksh, "\nUsage: %s n\n", argv[0]);
	    return 1;
	}
	if ( argc > 1) {
	    /* Oh, barf */
	    if ( sscanf(argv[1], "%d", &lim) != 1)
		lim = 1;
	    /* A little bounds checking */
	    if ( lim < 1 || lim > 255 )
		lim = 1;
	}
	/*  Start pairs of processes */
	for ( i = 0; i< lim; i++) {
	    /* The maker process */
	    snprintf(tname, TESTBUFLEN, "thread%03d", i);
	    p = proc_create(tname);
	    KASSERT(NULL != p);
	    thr = kthread_create(p, make_dir_thread, i, NULL);
	    KASSERT(NULL != thr);

	    sched_make_runnable(thr);

	    /* The deleter process */
	    snprintf(tname, TESTBUFLEN, "rmthread%03d", i);
	    p = proc_create(tname);
	    KASSERT(NULL != p);
	    thr = kthread_create(p, rm_dir_thread, i, NULL);
	    KASSERT(NULL != thr);

	    sched_make_runnable(thr);
	}
	/* Wait for children and report their error codes */
	while ( ( pid = do_waitpid(-1, 0 , &rv) ) != -ECHILD) {
	    if ( rv < 0 ) {
		kprintf(ksh, "\nChild %d: %d %s", pid, rv, strerror(-rv));
		passed = 0;
	    } else {
		kprintf(ksh, "\nChild %d: %d", pid, rv);
	    }
	}
        for ( i = 0; i< lim; i++) {
            int rv2;
            snprintf(tname, TESTBUFLEN, "/dir%03d", i);
            if ((rv2 = do_rmdir(tname)) < 0) {
                rv = rv2;
                kprintf(ksh, "\nFailed rmdir(%s): %d %s", tname, rv, strerror(-rv));
		passed = 0;
            }
        }
	if (passed) {
	    kprintf(ksh, "\nNothing failed (you need to decide if this is the expected behavior or not).\n");
	} else {
	    kprintf(ksh, "\nSomething failed (you need to decide if this is the expected behavior or not).\n");
	}
	return 0;
}

/* 
 * A little convenience command to clear the files from a directory (though not
 * the directories).  Called from the kshell as cleardir <name>.
 */
int faber_cleardir(kshell_t *ksh, int argc, char **argv) {
        KASSERT(NULL != ksh);

	struct dirent d;	/* The current directory entry */
	char buf[TESTBUFLEN];	/* A buffer used to assemble the pathname */
	int f = -1;		/* File descriptor (dirs must be opened) */
	int rv = 0;		/* Return values */
	int got_one = 1;	/* True if this iteration deleted a file */

	if ( argc < 2 ) {
	    kprintf(ksh, "Usage: cleardir dir\n");
	    return -1;
	}

	/* Because unlinking a file changes the order of the directory entries
	 * - specifically, it moves a directory entry into the spot where the
	 *   unlinked file's directory entry was - this loop starts over every
	 *   time a file is unlinked.  The pseudocode is:
	 *
	 *  repeat
	 *	open the directory.
	 *	find the first directory entry that is neither . nor ..
	 *	unlink it
	 *	close the directory
	 *  until only . and .. are left
	 */
	while ( got_one ) {
	    got_one = 0;
	    /* Open up the directory */
	    if ( (f = do_open(argv[1], O_RDONLY)) < 0 ) {
		kprintf(ksh, "Open failed on %s: %d %s\n", argv[1], f, 
			strerror(-f));
		return -1;
	    }

	    while ( ( rv = do_getdent(f, &d)) > 0 ) {
		/* Keep looking if d contains . or .. */
		if ( strncmp(".", d.d_name, NAME_LEN) == 0 || 
			strncmp("..", d.d_name, NAME_LEN) == 0 ) 
		    continue;
		/* Found a name to delete.  Construct the path and delete it */
		snprintf(buf, TESTBUFLEN, "%s/%s", argv[1], d.d_name);
		kprintf(ksh, "unlinking %s\n", buf);
		if ( (rv = do_unlink(buf)) < 0 ) {
		    /* Something went wrong- d probably points to a directory.
		     * Report the error, close f, and terminate the command. */
		    kprintf(ksh, "Unlink failed on %s: %d %s\n", buf, rv, 
			    strerror(-rv));
		    do_close(f);
		    return 0;
		}
		got_one = 1;
		/* CLose the directory and restart (because it set got_one) */
		break;
	    }
	    do_close(f);
	    /* This branch will be taken if do_getdent fails */
	    if ( rv < 0 ) {
		kprintf(ksh, "get_dent failed on %s: %d %s\n", argv[1], rv, 
			strerror(-rv));
		return 0;
	    }
	}
	/* OK, deleted everything we could. */
	return 0;
}

static void
print_dir_info(kshell_t *ksh, int level, const char *dir)
{
	int ret, i = 0;
        vnode_t *vn;
	char buf[TESTBUFLEN];

        if (0 > (ret = open_namev(dir, O_RDONLY, &vn, curproc->p_cwd))) {
		buf[0] = '\0';
        } else {
        	snprintf(buf, sizeof(buf), "(ino %ld, refcount=%d, nrespages=%d)", (long)vn->vn_vno, vn->vn_refcount, vn->vn_nrespages);
        	vput(vn);
        }

	for (i = 0; i < level; i++) kprintf(ksh, "    ");
	if (strcmp(dir, "/") == 0) {
		if (buf[0] == '\0') {
			kprintf(ksh, "/\n");
		} else {
			kprintf(ksh, "/ %s\n", buf);
		}
	} else {
		if (buf[0] == '\0') {
			kprintf(ksh, "%s\n", dir);
		} else {
			kprintf(ksh, "%s %s\n", dir, buf);
		}
	}
}

static int
traverseall(kshell_t *ksh, int level, const char *dir_name)
{
        int ret, fd = -1;
        struct stat status;

        print_dir_info(ksh, level, dir_name);

        if (0 > do_chdir(dir_name)) {
                goto error;
        }
	if (0 > (fd = do_open(".", O_RDONLY))) {
		goto error;
	}
        ret = 1;
        while (ret != 0) {
        	dirent_t dirent;

                if (0 > (ret = do_getdent(fd, &dirent))) {
                        goto error;
                }
                if (sizeof(dirent) > (unsigned int)ret) {
                        break;
                }
                if (0 != strcmp(".", dirent.d_name) && 0 != strcmp("..", dirent.d_name)) {
                	if (0 > do_stat(dirent.d_name, &status)) {
                        	goto error;
                	}
                	if (S_ISDIR(status.st_mode)) {
                        	if (0 > traverseall(ksh, level+1, dirent.d_name)) {
                                	goto error;
                        	}
                        } else {
        			print_dir_info(ksh, level+1, dirent.d_name);
                        }
                }
        }
        if (0 > do_chdir("..")) {
                return curthr->kt_errno;
        }

        do_close(fd);
        return 0;

error:
        if (0 <= fd) {
                do_close(fd);
        }

        return curthr->kt_errno;
}

/* 
 * Just some code to display information about the directory hierarchy in AFS & VFS.
 * For each vnode, refcount should be > nrespages.  
 * Please note that the refcount is decremented immediately after the information
 * about it is printed.  Called from the kshell as dirhier <dir>.
 */
int directory_hierarchy(kshell_t *ksh, int argc, char **argv) {
        KASSERT(NULL != ksh);

	int rv = 0;		/* Return values */

	if ( argc < 2 ) {
	    kprintf(ksh, "Usage: dirhier dir\n");
	    return -1;
	}
	traverseall(ksh, 0, argv[1]);

	return 0;
}

#endif /* __VFS__ */
