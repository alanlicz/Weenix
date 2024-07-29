/******************************************************************************/
/* Important CSCI 402 usage information:                                      */
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


#ifndef __KERNEL__
#include "unistd.h"
#include "sys/types.h"
#else
#include "types.h"
#endif

#include <stdarg.h>

#define test_assert(expr, fmt, args...) \
        _test_assert(expr, __FILE__, __LINE__, #expr, fmt, ## args)

#ifndef __KERNEL__
#define test_fork_begin()                       \
        do {                                    \
                pid_t __test_pid = fork();      \
                if (0 == __test_pid) {          \
                        do

#define test_fork_end(status)                   \
                        while (0);              \
                        exit(0);                \
                } /* if */                      \
                waitpid(__test_pid, 0, status); \
        } while (0);
#endif

void test_init(void);
void test_fini(const char *);

const char *test_errstr(int err);

typedef void (*test_pass_func_t)(int val, const char *file, int line, const char *name, const char *fmt, va_list args);
typedef void (*test_fail_func_t)(const char *file, int line, const char *name, const char *fmt, va_list args);

int _test_assert(int val, const char *file, int line, const char *name, const char *fmt, ...);
