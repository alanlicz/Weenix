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

#include "tokenizer.h"

#include <ctype.h>

#include "util/debug.h"

#define EOL '\0'

const char *ksh_tok_type_str[] = {
        "text",
        "<",
        ">",
        ">>",
        "end of line",
        ""
};

int kshell_next_token(kshell_t *ksh, char *line, kshell_token_t *token)
{
        KASSERT(NULL != ksh);
        KASSERT(NULL != line);
        KASSERT(NULL != token);

        int i = 0;
        while (line[i] != EOL && isspace(line[i])) ++i;
        token->kt_text = line + i;

        /* Determine the token type */
        switch (line[i]) {
                case EOL:
                        token->kt_type = KTT_EOL;
                        token->kt_textlen = 0;
                        break;
                case '<':
                        token->kt_type = KTT_REDIRECT_IN;
                        token->kt_textlen = i = 1;
                        break;
                case '>':
                        if (line[i + 1] == '>') {
                                token->kt_type = KTT_REDIRECT_OUT_APPEND;
                                token->kt_textlen = i = 2;
                        } else {
                                token->kt_type = KTT_REDIRECT_OUT;
                                token->kt_textlen = i = 1;
                        }
                        break;
                default:
                        token->kt_type = KTT_WORD;
                        token->kt_textlen = 0;
                        break;
        }

        switch (token->kt_type) {
                case KTT_WORD:
                        while (!isspace(line[i]) && line[i] != '<' &&
                               line[i] != '>' && line[i] != EOL) {
                                ++i;
                                ++token->kt_textlen;
                        }
                        break;
                case KTT_EOL:
                        return 0;
                default:
                        break;
        }

        return i;
}

const char *kshell_token_type_str(kshell_token_type_t type)
{
        KASSERT(type < KTT_MAX);
        return ksh_tok_type_str[type];
}
