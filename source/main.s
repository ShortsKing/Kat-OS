/*This version of Oexis OS currently turns an led on and off with a slight delay*/
/*please update this comment as the OS gets more advanced*/

.section .init /*Tells the linker where to put our code (the linker links together the assembly files)*/
.globl _start /*stops a warning message from appearing*/
_start: /*stops a warning message from appearing*/
ldr r0,=0x20200000 /*inserts the value 0x20200000 (the address of the GPIO controller) into register 0*/
mov r1,#1 /*puts a temporary value in register 1*/
lsl r1,#18 /*changes the value in register 1*/
str r1,[r0,#4] /*send the value in register 1 to the the address in register 0, the GPIO controller*/
mov r2,#0x3F0000 /*puts the hexadecimal value 3F0000 into register r2*/
wait1$: /*creates a label called "wait"*/
sub r2,#1 /*subtracts 1 from the hex value every repitition*/
cmp r2,#0 /*tests if the value in r2 is equal to 0*/
bne wait1$ /*runs the instruction only if the previous compare command is fulfilled*/
mov r1,#1 /*puts a temporary 1 in register 1*/
lsl r1,#16 /*changes the value in register 1*/
str r1,[r0,#40] /*sends a one in the 16th bit to 40 (base ten) added to the gpio controllers address, to turn that pin of*/
loop$: /*names the next line "loop"*/
b loop$ /*tells the processor to execute code starting at line "loop"*/
