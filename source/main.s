.section .init /*Tells the assembler where to put our code*/
.globl _start /*stops a warning message from appearing*/
_start: /*stops a warning message from appearing*/
ldr r0,=0x20200000 /*inserts the value 0x20200000 (the address of the GPIO controller) into register 0*/
mov r1,#1 /*puts a temporary value in register 1*/
lsl r1,#18 /*changes the value in register 1*/
str r1,[r0,#4] /*send the value in register 1 to the the address in register 0, the GPIO controller*/
mov r1,#1 /*puts a temporary 1 in register 1*/
lsl r1,#16 /*changes the value in register 1*/
str r1,[r0,#40] /*sends a one in the 16th bit to 40 (base ten) added to the gpio controllers address, to turn that pin of*/
loop$: /*names the next line "loop"*/
b loop$ /*tells the processor to execute code starting at line "loop"*/
