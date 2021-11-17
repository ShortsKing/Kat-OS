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

mov r0,#1024
mov r1,#768
mov r2,#16
bl InitialiseFrameBuffer

/*
This code simply uses our InitialiseFrameBuffer method to create a frame buffer with width 1024, 
*height 768, and bit depth 16. You can try different values in here if you wish, as long as you are consistent throughout the code. 
*Since it's possible that this method can return 0 if the graphics processor did not give us a frame buffer, we had better check for this, 
*and turn the OK LED on if it happens.
*/

teq r0,#0
bne noError$

mov r0,#16
mov r1,#1
bl SetGpioFunction
mov r0,#16
mov r1,#0
bl SetGpio

error$:
b error$

noError$:
fbInfoAddr .req r4
mov fbInfoAddr,r0

/*
*Now that we have the frame buffer info address, we need to get the frame buffer pointer from it, 
*and start drawing to the screen. We will do this using two loops, one going down the rows, and one going along the columns. 
*On the Raspberry Pi, indeed in most applications, pictures are stored left to right then top to bottom, 
*so we have to do the loops in the order I have said.
*/

render$:
fbAddr .req r3
ldr fbAddr,[fbInfoAddr,#32]

colour .req r0
y .req r1
mov y,#768
drawRow$:
x .req r2
mov x,#1024
drawPixel$:
strh colour,[fbAddr]
add fbAddr,#2
sub x,#1
teq x,#0
bne drawPixel$

sub y,#1
add colour,#1
teq y,#0
bne drawRow$

b render$

.unreq fbAddr
.unreq fbInfoAddr

/*
*This is quite a large chunk of code, and has a loop within a loop within a loop. 
*To help get your head around the looping, I've indented the code which is looped, depending on which loop it is in. 
*This is quite common in most high level programming languages, and the assembler simply ignores the tabs. 
*We see here that I load in the frame buffer address from the frame buffer information structure, and then loop over every row, 
*then every pixel on the row. At each pixel, I use an strh (store half word) command to store the current colour, 
*then increment the address we're writing to. After drawing each row, we increment the colour that we are drawing. 
*After drawing the full screen, we branch back to the beginning.
*/

