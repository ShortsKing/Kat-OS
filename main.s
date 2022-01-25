.global _start

_start:
  LDR R7,=splash @argument for get content
  BL getContent @gets content of a file

.data @data section
splash: .asciz "splash.lrs"
