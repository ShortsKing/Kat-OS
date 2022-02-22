  .global _start
_start:

save:
  STM {R4-R12}
  LDM {R12}
  STR R12,=string
  BL write
  LDM {R11}
  STR R11,=string
  BL write
  LDM {R10}
  STR R10,=string
  BL write
  LDM {R9}
  STR R9,=string
  BL write
  LDM {R8}
  STR R8,=string
  BL write
  LDM {R7}
  STR R7,=string
  BL write
  LDM {R6}
  STR R6,=string
  BL write
  LDM {R5}
  STR R5,=string
  BL write
  LDM {R4}
  STR R4,=string
  BL write

write:
  MOV R7, #3
  

exit:
  MOV R7, #1
  SWI 0
  
.data
.ascii "                    \n"
