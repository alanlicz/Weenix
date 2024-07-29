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

#include "kernel.h"
#include "types.h"
#include "util/debug.h"
#include "drivers/bytedev.h"
#include "util/list.h"
#include "drivers/tty/tty.h"
#include "drivers/memdevs.h"

static list_t bytedevs;

void
bytedev_init()
{
        list_init(&bytedevs);
        /* Initialize all subsystems */
        tty_init();
        memdevs_init();
}

int
bytedev_register(bytedev_t *dev)
{
        bytedev_t *cd;

        /* Make sure dev, dev ops, and dev id not null */
        if (!dev
            || (NULL_DEVID == dev->cd_id)
            || !(dev->cd_ops))
                return -1;

        /* we should not have already seen dev->cd_id. */
        list_iterate_begin(&bytedevs, cd, bytedev_t, cd_link) {
                if (dev->cd_id == cd->cd_id)
                        return -1;
        } list_iterate_end();

        /* initialize portions of structure ignored by device drivers: */

        list_insert_tail(&bytedevs, &dev->cd_link);
        return 0;
}

bytedev_t *
bytedev_lookup(devid_t id)
{
        bytedev_t *cd;

        list_iterate_begin(&bytedevs, cd, bytedev_t, cd_link) {
                KASSERT(NULL_DEVID != cd->cd_id);
                if (id == cd->cd_id)
                        return cd;
        } list_iterate_end();

        return NULL;
}
