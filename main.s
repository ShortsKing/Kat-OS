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

/*
* Use our new SetGpioFunction function to set the function of GPIO port 16 (OK 
* LED) to 001 (binary)
*/
mov r0,#16
mov r1,#1
bl SetGpioFunction

/* NEW
* Load in the pattern to flash and also store our position in the flash
* sequence.
*/
ptrn .req r4
ldr ptrn,=pattern
ldr ptrn,[ptrn]
seq .req r5
mov seq,#0

loop$:

/* NEW
* Use our new SetGpio function to set GPIO 16 base on the current bit in the 
* pattern causing the LED to turn on if the pattern contains 0, and off if it
* contains 1.
*/
mov r0,#16
mov r1,#1
lsl r1,seq
and r1,ptrn
bl SetGpio

/* NEW
* We wait for 0.25s using our wait method.
*/
ldr r0,=250000
bl Wait

/* NEW
* Loop over this process forevermore, incrementing the sequence counter.
* When it reaches 32, its bit pattern becomes 100000, and so anding it with 
* 11111 causes it to return to 0, but has no effect on all patterns less than
* 32.
*/
add seq,#1
and seq,#0b11111
b loop$

/* NEW
* In the data section of the kernel image, store the pattern we wish to flash
* on the LED.
*/
.section .data
.align 2
pattern:
.int 0b11111111101010100010001000101010
.globl GetMailboxBase
GetMailboxBase:
ldr r0,=0x2000B880
mov pc,lr

.globl MailboxWrite
MailboxWrite:
tst r0,#0b1111
movne pc,lr
cmp r1,#15

channel .req r1
value .req r2
mov value,r0
push {lr}
bl GetMailboxBase
mailbox .req r0
movhi pc,lr

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
mailbox .req r0

.section .text
.globl InitialiseFrameBuffer
InitialiseFrameBuffer:
width .req r0
height .req r1
bitDepth .req r2
cmp width,#4096
cmpls height,#4096
cmpls bitDepth,#32
result .req r0
movhi result,#0
movhi pc,lr

/*This code checks that the width and height are less than or equal to 4096, and that the bit depth is less than or equal to
32. This is once again using a trick with conditional execution. Convince yourself that this works.*/

fbInfoAddr .req r3
push {lr}
ldr fbInfoAddr,=FrameBufferInfo
str width,[fbInfoAddr,#0]
str height,[fbInfoAddr,#4]
str width,[fbInfoAddr,#8]
str height,[fbInfoAddr,#12]
str bitDepth,[fbInfoAddr,#20]
.unreq width
.unreq height
.unreq bitDepth

/*This code simply writes into our frame buffer structure defined above. I also take the opportunity to push the link register onto the stack.*/

mov r0,fbInfoAddr
add r0,#0x40000000
mov r1,#1
bl MailboxWrite

/*The inputs to the MailboxWrite method are the value to write in r0, and the channel to write to in r1.*/

mov r0,#1
bl MailboxRead

*/The inputs to the MailboxRead method is the channel to write to in r0, and the output is the value read.*/

teq result,#0
movne result,#0
popne {pc}

/*This code checks if the result of the MailboxRead method is 0, and returns 0 if not.*/

mov result,fbInfoAddr
pop {pc}
.unreq result
.unreq fbInfoAddr

/*This code finishes off and returns the frame buffer info address.*/
