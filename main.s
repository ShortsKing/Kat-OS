/******************************************************************************
*	main.s
*	 by Alex Chadwick
*
*	A sample assembly code implementation of the ok05 operating system, that 
*	flashes out a pattern using the wait routine from ok04.
*
*	main.s contains the main operating system, and IVT code.
******************************************************************************/

/*
* .globl is a directive to our assembler, that tells it to export this symbol
* to the elf file. Convention dictates that the symbol _start is used for the 
* entry point, so this all has the net effect of setting the entry point here.
* Ultimately, this is useless as the elf itself is not used in the final 
* result, and so the entry point really doesn't matter, but it aids clarity,
* allows simulators to run the elf, and also stops us getting a linker warning
* about having no entry point. 
*/
.section .init
.globl _start
_start:

/*
* Branch to the actual main code.
*/
b main

/*
* This command tells the assembler to put this code with the rest.
*/
.section .text

/*
* main is what we shall call our main operating system method. It never 
* returns, and takes no parameters.
* C++ Signature: void main(void)
*/
main:

/*
* Set the stack point to 0x8000.
*/
mov sp,#0x8000

.globl GetMailboxBase
GetMailboxBase:
ldr r0,=0x2000B880
mov pc,lr

.globl MailboxWrite
MailboxWrite:
tst r0,#0b1111
movne pc,lr
cmp r1,#15
movhi pc,lr

channel .req r1
value .req r2
mov value,r0
push {lr}
bl GetMailboxBase
mailbox .req r0

wait1$:
status .req r3
ldr status,[mailbox,#0x18]

tst status,#0x80000000
.unreq status
bne wait1$

add value,channel
.unreq channel

str value,[mailbox,#0x20]
.unreq value
.unreq mailbox
pop {pc}

.globl MailboxRead
MailboxRead:
cmp r0,#15
movhi pc,lr

channel .req r1
mov channel,r0
push {lr}
bl GetMailboxBase
mailbox .req r0

rightmail$:
wait2$:
status .req r2
ldr status,[mailbox,#0x18]

tst status,#0x40000000
.unreq status
bne wait2$

mail .req r2
ldr mail,[mailbox,#0]

inchan .req r3
and inchan,mail,#0b1111
teq inchan,channel
.unreq inchan
bne rightmail$
.unreq mailbox
.unreq channel

and r0,mail,#0xfffffff0
.unreq mail
pop {pc}
