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

#include "test/kshell/kshell.h"

typedef enum kshell_token_type {
        KTT_WORD,
        KTT_REDIRECT_IN,         /* '<' */
        KTT_REDIRECT_OUT,        /* '>' */
        KTT_REDIRECT_OUT_APPEND, /* '>>' */
        KTT_EOL,

        KTT_MAX /* Number of token types */
} kshell_token_type_t;

typedef struct kshell_token {
        kshell_token_type_t kt_type;
        char *kt_text;
        size_t kt_textlen;
} kshell_token_t;

/**
 * Finds the next token in the input line.
 *
 * Note: To find multiple tokens from the same line, you increment the
 * line pointer by the number of bytes processed before the next call
 * to kshell_next token.
 *
 * @param ksh the kshell
 * @param line the input line to tokenize
 * @param token out parameter containing the next token found
 * @return 0 if no more tokens, otherwise, number of bytes processed
 */
int kshell_next_token(kshell_t *ksh, char *line, kshell_token_t *token);

const char *kshell_token_type_str(kshell_token_type_t type);
