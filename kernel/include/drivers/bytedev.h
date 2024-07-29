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

#include "drivers/dev.h"
#include "util/list.h"

struct vnode;
struct pframe;

struct bytedev_ops;
struct vmarea;
struct mmobj;

typedef struct bytedev {
        devid_t             cd_id;
        struct bytedev_ops *cd_ops;
        list_link_t         cd_link;
} bytedev_t;

typedef struct bytedev_ops {
        int (*read)(bytedev_t *dev, int offset, void *buf, int count);
        int (*write)(bytedev_t *dev, int offset, const void *buf, int count);
        int (*mmap)(struct vnode *file, struct vmarea *vma, struct mmobj **ret);
        int (*fillpage)(struct vnode *file, off_t offset, void *pagebuf);
        int (*dirtypage)(struct vnode *file, off_t offset);
        int (*cleanpage)(struct vnode *file, off_t offset, void *pagebuf);
} bytedev_ops_t;

/**
 * Initializes the byte device subsystem.
 */
void bytedev_init(void);

/**
 * Registers the given byte device.
 *
 * @param dev the byte device to register
 */
int bytedev_register(bytedev_t *dev);

/**
 * Finds a byte device with a given device id.
 *
 * @param id the device id of the byte device to find
 * @return the byte device with the given id if it exists, or NULL if
 * it cannot be found
 */
bytedev_t *bytedev_lookup(devid_t id);
