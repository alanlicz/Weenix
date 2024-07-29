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

/**
 * Initialize the screen subsystem.
 */
void screen_init(void);

/**
 * Move the cursor to the given (x,y) coords (measured from top left).
 *
 * @param x the x coordinate
 * @param y the y coordinate
 */
void screen_move_cursor(uint8_t x, uint8_t y);

/**
 * Writes a character to the screen at the given position.
 *
 * @param c the character to display on the screen
 * @param x the x coordinate
 * @param y the y coordinate
 */
void screen_putchar(char c, uint8_t x, uint8_t y);

/**
 * Writes a character to the screen at a given position with the given
 * attributes.
 *
 * @param c the character to display on the screen
 * @param x the x coordinate
 * @param y the y coordinate
 * @param the attributes for the character
 */
void screen_putchar_attrib(char c, uint8_t x, uint8_t y, uint8_t attrib);

/**
 * Write a buffer of characters which is _EXACTLY_ DISPLAY_WIDTH x
 * DISPLAY_HEIGHT characters.
 *
 * @param buf the buffer to write to the screen
 */
void screen_putbuf(const char *buf);

/**
 * Write a buffer of characters which is _EXACTLY_ DISPLAY_WIDTH x
 * DISPLAY_HEIGHT characters and attributes.
 *
 * @param buf the buffer to write to the screen
 */
void screen_putbuf_attrib(const uint16_t *buf);

/**
 * Clear the screen.
 */
void screen_clear(void);
