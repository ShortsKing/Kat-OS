*
*	A sample assembly code implementation of the screen02 operating system.
*	See main.s for details.
*
*	drawing.s contains code to do with drawing shapes to the screen.
******************************************************************************/

/* NEW
* The foreColour is the colour which all our methods will draw shapes in.
* C++ Signature: short foreColour;
*/
.section .data
.align 1
foreColour:
	.hword 0xFFFF

/* NEW
* graphicsAddress stores the address of the frame buffer info structure. 
* C++ Signature: FrameBuferDescription* graphicsAddress;
*/
.align 2
graphicsAddress:
	.int 0

/* NEW
* SetForeColour changes the current drawing colour to the 16 bit colour in r0.
* C++ Signature: void SetForeColour(u16 colour);
*/
.section .text
.globl SetForeColour
SetForeColour:
	cmp r0,#0x10000
	movhi pc,lr
	moveq pc,lr

	ldr r1,=foreColour
	strh r0,[r1]
	mov pc,lr

/* NEW
* SetGraphicsAddress changes the current frame buffer information to 
* graphicsAddress;
* C++ Signature: void SetGraphicsAddress(FrameBuferDescription* value);
*/
.globl SetGraphicsAddress
SetGraphicsAddress:
	ldr r1,=graphicsAddress
	str r0,[r1]
