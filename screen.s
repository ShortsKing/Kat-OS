.global _refreshScreen

_refreshScreen:
  
  MOV PC, LR @end subroutine

.data
screen: .ascii "" @ store uncompressed pixel data
p0: .ascii "  " @ space, ascii 32
p1: .ascii "░░" @ low density dotted, ascii 172
p2: .ascii "▒▒" @ medium density dotted, ascii 173
p3: .ascii "▓▓" @ high density dotted, ascii 174
p4: .ascii "██" @ block, ascii 219
