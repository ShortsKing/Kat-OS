.globl GetMailboxBase
GetMailboxBase:
ldr r0,=0x2000B880
mov pc,lr

/*
*The sending procedure is least complicated, so we shall implement this first. As your methods become more and more complicated, 
you will need to start planning them in advance. A good way to do this might be to write out a simple list of the steps that need to be done, in a fair amount of detail, like below.
*
*Our input will be what to write (r0), and what mailbox to write it to (r1). We must validate this is by checking it is a real mailbox,
and that the low 4 bits of the value are 0. Never forget to validate inputs.
*Use GetMailboxBase to retrieve the address.
*Read from the Status field.
*Check the top bit is 0. If not, go back to 3.
*Combine the value to write and the channel.
*Write to the Write.
*Let's handle each of these in order.
*/

.globl MailboxWrite
MailboxWrite:
tst r0,#0b1111
movne pc,lr
cmp r1,#15
movhi pc,lr

/*
*This achieves our validation on r0 and r1. 
*tst is a function that compares two numbers by computing the logical and operation of the numbers, 
*and then comparing the result with 0. In this case it checks that the lowest 4 bits of the input in r0 are all 0.
*/

channel .req r1
value .req r2
mov value,r0
push {lr}
bl GetMailboxBase
mailbox .req r0

/*
*This code ensures we will not overwrite our value, or link register and calls GetMailboxBase.
*/

wait1$:
status .req r3
ldr status,[mailbox,#0x18]

/*
*This code loads in the current status.
*/

tst status,#0x80000000
.unreq status
bne wait1$

/*
*This code checks that the top bit of the status field is 0, and loops back to 3. if it is not.
*/

add value,channel
.unreq channel

/*
*This code combines the channel and value together.
*/

str value,[mailbox,#0x20]
.unreq value
.unreq mailbox
pop {pc}

/*
*This code stores the result to the write field.
*/

.globl MailboxRead
MailboxRead:
cmp r0,#15
movhi pc,lr

/*
*This achieves our validation on r0.
*/

channel .req r1
mov channel,r0
push {lr}
bl GetMailboxBase
mailbox .req r0

/*
*This code ensures we will not overwrite our value, or link register and calls GetMailboxBase.
*/

rightmail$:
wait2$:
status .req r2
ldr status,[mailbox,#0x18]

/*
*This code loads in the current status.
*/

tst status,#0x40000000
.unreq status
bne wait2$

/*
*This code checks that the 30th bit of the status field is 0, and loops back to 3. if it is not.
*/

mail .req r2
ldr mail,[mailbox,#0]

/*
*This code reads the next item from the mailbox.
*/

inchan .req r3
and inchan,mail,#0b1111
teq inchan,channel
.unreq inchan
bne rightmail$
.unreq mailbox
.unreq channel

/*
*This code checks that the channel of the mail we just read is the one we were supplied. If not it loops back to 3.
*/

and r0,mail,#0xfffffff0
.unreq mail
pop {pc}
