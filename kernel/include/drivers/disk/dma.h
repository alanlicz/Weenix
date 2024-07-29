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

/* Linux kernel: drivers/ata/libata-sff.c */
#define DMA_COMMAND 0x00
#define DMA_STATUS  0x02
#define DMA_PRD     0x04 /* dword register */

/**
 * Initializes the DMA subsystem.
 */
void dma_init(void);

/* 1/21/17 Commented this out for now; it isn't implemented */
/**
 * Return the DMA status.
 *
 * @param busmaster_addr the address of the busmaster register
 */
/*void dma_status(uint16_t busmaster_addr);*/

/**
 * Resets DMA for its next operation by acknowledging an interrupt,
 * clearing all interrupts and errors.
 *
 * @param busmaster_addr the address of the busmaster register
 */
void dma_reset(uint16_t busmaster_addr);

/**
 * Initialize DMA for an operation
 *
 * @param channel the channel on which to perform the operation
 * @param start the beginning of the buffer in memory
 * @param count the number of bytes to read/write
 */
void dma_load(uint8_t channel, void* start, int count);

/* 1/24/13 Commented this out for now, it isn't used anyway */
/**
 * Cancel the current DMA operation.
 *
 * @param channel the disk channel
 */
/*void dma_stop(uint8_t channel);*/

/**
 * Execute a DMA operation.
 *
 * @param channel the disk channel
 * @param busmaster_addr the address of the busmaster register
 * @param write true if writing, false if reading
 */
void dma_start(uint8_t channel, uint16_t busmaster_addr, int write);
