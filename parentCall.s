@this file will save current register values by writing them to a file called data.txt
@if a file called data.txt is not found it will return an error
  .global _start
_start:
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
  B   exit
  
writebuffer:
  MOV R0, R9
