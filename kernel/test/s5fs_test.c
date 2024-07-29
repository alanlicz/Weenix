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

//
// Tests some edge cases of s5fs
//

#include "globals.h"
#include "errno.h"
#include "config.h"
#include "limits.h"

#include "test/usertest.h"

#include "util/debug.h"
#include "util/string.h"
#include "util/printf.h"

#include "fs/s5fs/s5fs.h"
#include "fs/vfs_syscall.h"
#include "fs/lseek.h"
#include "fs/fcntl.h"

#define BUFSIZE 256
#define BIG_BUFSIZE 2056

#define S5_MAX_FILE_SIZE S5_BLOCK_SIZE * S5_MAX_FILE_BLOCKS

static void get_file_name(char* buf, size_t sz, int fileno)
{
        snprintf(buf, sz, "file%d", fileno);
}

// Write to a fail forever until it is either filled up or we get an error.
static int write_until_fail(int fd)
{
        size_t total_written = 0;
        char buf[BIG_BUFSIZE] = {42};
        while (total_written < S5_MAX_FILE_SIZE)
        {
                int res = do_write(fd, buf, BIG_BUFSIZE);
                if (res < 0)
                {
                        return res;
                }
                total_written += res;
        }
        KASSERT(total_written == S5_MAX_FILE_SIZE);
        KASSERT(do_lseek(fd, 0, SEEK_END) == S5_MAX_FILE_SIZE);

        return 0;
}

// Read n bytes from the file, and check they're all 0
// We do this in increments of big_bufsize because we might want to read
// like a million bytes from the file
static int is_first_n_bytes_zero(int fd, int n) {
        int total_read = 0;
        while (total_read < n) {

                int amt_to_read = MIN(BIG_BUFSIZE, n - total_read);
                char buf[BIG_BUFSIZE] = {1};
                int res = do_read(fd, buf, amt_to_read);
                if (res != amt_to_read) {
                        dbg(DBG_TESTFAIL, "do_read result was %d\n", res);
                        return 0;
                        // KASSERT("Could not read from file" && 0);
                }
                total_read += res;

                // Check everything that we read is indeed 0
                for (int i = 0; i < amt_to_read; ++i) {
                        if (buf[i] != 0) {
                                dbg(DBG_TESTFAIL, "buf contains char %d\n", (int)buf[i]);
                                return 0;
                        }
                }
        }

        return 1;
}

static void test_running_out_of_inodes()
{
        // Open a ton of files until we get an error
        int res = -1;
        int fileno = 0;
        char filename[BUFSIZE];

        // open files til we get an error
        while (1)
        {
                get_file_name(filename, BUFSIZE, fileno);
                res = do_open(filename, O_RDONLY|O_CREAT);
                if (res >= 0)
                {
                        fileno++;
                        test_assert(do_close(res) == 0, "couldn't close");
                }
                else
                {
                        break;
                }
        }
        test_assert(res == -ENOSPC, "Did not get ENOSPC error");

        // make sure mkdir fails now that we're out of inodes
        test_assert(do_mkdir("directory") < 0, "do_mkdir worked!?");
        test_assert(res == -ENOSPC, "unexpected error");

        test_assert(do_mknod("nod", S_IFCHR, 123) != 0, "mknod worked!?");
        test_assert(res == -ENOSPC, "wrong error code");

        // the last file we tried to open failed
        fileno--;

        do
        {
                get_file_name(filename, BUFSIZE, fileno);
                res = do_unlink(filename);
                test_assert(res == 0, "couldnt unlink");
                fileno--;
        }
        while(fileno >= 0);

        // Now we've freed all the files, try to create another file
        int fd = do_open("file", O_RDONLY | O_CREAT);
        test_assert(fd >= 0, "Still cannot create files");
        test_assert(do_close(fd) == 0, "Could not do_close fd");
        test_assert(do_unlink("file") == 0, "Could not remove file");
}

static void test_filling_file()
{
        int res = 0;
        int fd = do_open("hugefile", O_RDWR | O_CREAT);
        KASSERT(fd >= 0);

        res = write_until_fail(fd);
        test_assert(res == 0, "Did not write to entire file");

        // make sure all other writes are unsuccessful/dont complete
        char buf[BIG_BUFSIZE] = {0};
        res = do_write(fd, buf, sizeof(buf));
        test_assert(res < 0, "Able to write although the file is full");
        test_assert(res == -EFBIG || res == -EINVAL, "Wrong error code");

        test_assert(do_close(fd) == 0, "couldnt close hugefile");
        test_assert(do_unlink("hugefile") == 0, "couldnt unlink hugefile");
}

// Fill up the disk. Apparently to do this, we should need to fill up one
// entire file, then start to fill up another. We should eventually get
// the ENOSPC error
static void test_running_out_of_blocks()
{
        int res = 0;

        int fd1 = do_open("fullfile", O_RDWR | O_CREAT);

        res = write_until_fail(fd1);
        test_assert(res == 0, "Ran out of space quicker than we expected");

        int fd2 = do_open("partiallyfullfile", O_RDWR | O_CREAT);
        res = write_until_fail(fd2);
        test_assert(res == -ENOSPC, "Did not get nospc error");

        test_assert(do_close(fd1) == 0, "could not close");
        test_assert(do_close(fd2) == 0, "could not close");

        test_assert(do_unlink("fullfile") == 0, "couldnt do_unlink file");
        test_assert(do_unlink("partiallyfullfile") == 0, "couldnt do_unlink file");
}


// Open a new file, write to some random address in the file,
// and make sure everything up to that is all 0s.
static int test_sparseness_direct_blocks()
{
        const char* filename = "sparsefile";
        int fd = do_open(filename, O_RDWR | O_CREAT);

        // Now write to some random address that'll be in a direct block
        const int addr = 10000;
        const char* b = "iboros";
        const int sz = strlen(b);

        test_assert(do_lseek(fd, addr, SEEK_SET) == addr, "couldnt seek");
        test_assert(do_write(fd, b, sz) == sz, "couldnt write to random address");

        test_assert(do_lseek(fd, 0, SEEK_SET) == 0, "couldnt seek back to begin");
        test_assert(is_first_n_bytes_zero(fd, addr) == 1, "sparseness don't work");


        // Get rid of this file
        test_assert(do_close(fd) == 0, "couldn't close file");
        test_assert(do_unlink(filename) == 0, "couldnt unlink file");

        return 0;
}

static int test_sparseness_indirect_blocks()
{
        const char* filename = "bigsparsefile";
        int fd = do_open(filename, O_RDWR | O_CREAT);

        // Now write to some random address that'll be in an indirect block
        const int addr = 1000000;
        const char* b = "iboros";
        const int sz = strlen(b);

        test_assert(do_lseek(fd, addr, SEEK_SET) == addr, "couldnt seek");
        test_assert(do_write(fd, b, sz) == sz, "couldnt write to random address");

        test_assert(do_lseek(fd, 0, SEEK_SET) == 0, "couldnt seek back to begin");
        test_assert(is_first_n_bytes_zero(fd, addr) == 1, "sparseness don't work");

        // Get rid of this file
        test_assert(do_close(fd) == 0, "couldn't close file");
        test_assert(do_unlink(filename) == 0, "couldnt unlink file");

        return 0;
}


int s5fs_test_main()
{
        dbg(DBG_TEST, "\nStarting S5FS test\n");

        test_init();

        KASSERT(do_mkdir("s5fstest") == 0);
        KASSERT(do_chdir("s5fstest") == 0);
        dbg(DBG_TEST, "Test dir initialized\n");

        dbg(DBG_TEST, "Testing sparseness for direct blocks\n");
        test_sparseness_direct_blocks();
        dbg(DBG_TEST, "Testing sparseness for indirect blocks\n");
        test_sparseness_indirect_blocks();

        dbg(DBG_TEST, "Testing running out of inodes\n");
        test_running_out_of_inodes();
        dbg(DBG_TEST, "Testing filling a file to max capacity\n");
        test_filling_file();
        dbg(DBG_TEST, "Testing using all available blocks on disk\n");
        test_running_out_of_blocks();


        test_assert(do_chdir("..") == 0, "");
        test_assert(do_rmdir("s5fstest") == 0, "");

        test_fini(NULL);

        return 0;
}
