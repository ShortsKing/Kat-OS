.global _refreshScreen

_refreshScreen:
  
  MOV PC, LR

.data
screen: .ascii ""
p1: .ascii "  "
p2: .ascii "░░"
p3: .ascii "▒▒"
p4: .ascii "▓▓"
p5: .ascii "██"
