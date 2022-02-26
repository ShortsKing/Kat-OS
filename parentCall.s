@this file will save current register values by writing them to a file called data.txt
@if a file called data.txt is not found it will return an error
  .global _start
_start:
  PUSH {R4-R12}
  LDR R0,=data.txt
  MOV R1, #o_rdonly
  MOV R2, #rdwr
  MOV R7, #sys_open
  SWI 0
  
  MOVS R8, R0
  BPL writebuffer
  MOV R0, #1
  LDR R1,=error1
  MOV R2, #18
  MOV R7, #4
  SWI 0
  B   finish

store:
  POP {R12}
  STR R12,=regvals
  BL writebuffer
  POP {R11}
  STR R11,=regvals
  BL writebuffer
  POP {R10}
  STR R10,=regvals
  BL writebuffer
  POP {R9}
  STR R9,=regvals
  BL writebuffer
  POP {R8}
  STR R8,=regvals
  BL writebuffer
  POP {R7}
  STR, R7,=regvals
  BL writebuffer
  POP {R6}
  STR R6,=regvals
  BL writebuffer
  POP {R5}
  STR R5,=regvals
  BL writebuffer
  POP {R4}
  STR R4,=regvals
  BL writebuffer
  
writebuffer:
  MOV R0, R9
  LDR R1,=regvals
  MOV R2, #16
  MOV R7, #4
  SWI 0
  MOV R1, #0

  MOV R0, R8
  MOV R7, #118
  SWI 0
  MOV R0, R8
  MOV R7, #6
  SWI 0
  
finish:
  MOV R0, #0
  MOV R7, #1
  SWI 0
  
.data
regvals: "                \n"
