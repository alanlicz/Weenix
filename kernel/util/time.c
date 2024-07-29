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

#include "globals.h"

#include "main/interrupt.h"
#include "main/apic.h"
#include "main/pit.h"

#include "util/debug.h"
#include "util/init.h"

#include "proc/sched.h"
#include "proc/kthread.h"

#define APIC_TIMER_IRQ 32 /* Map interrupt 32 */

#ifdef __UPREEMPT__
static unsigned int ms = 0;

static void pit_handler(regs_t *regs)
{
  dbg(DBG_CORE, "PIT HANDLER FIRED\n");
}

/* Uncomment this to enable the apic timer to
 * call the pit_handler for userland preemption
 */

static __attribute__((unused)) void time_init(void)
{
  intr_map(APIC_TIMER_IRQ, APIC_TIMER_IRQ);
  intr_register(APIC_TIMER_IRQ, pit_handler);
  /* TODO: figure out how this argument converts to hertz */
  apic_enable_periodic_timer(8);
}
init_func(time_init);

#endif
