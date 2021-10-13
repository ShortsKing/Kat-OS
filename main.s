.section .init
.globl _start
_start:

/* Store 0x20200000 in r0; this is the base address of the GPIO controller */
ldr r0, =0x20200000

/*
 * Enable output to GPIO pin 47 (the ACT LED) by flipping a bit in a specific
 * register in the GPIO controller.
 */
mov r1, #1  /* r1 = 00000000 00000000 00000000 00000001 */

lsl r1, #21 /* r1 = 00000000 00100000 00000000 00000000 */

str r1, [r0, #16]  /* write contents of r1 into address given by r0 + 16 (GPFSEL4) */

mov r1, #1  /* 00000000 00000000 00000000 00000001 */

lsl r1, #15 /* 00000000 00000000 10000000 00000000 */

str r1, [r0, #32] /* write contents of r1 into address given by r0 + 32 */

/*
 * Loop forever
 */
loop$:
b loop$
