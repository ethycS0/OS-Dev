  
; Printing a Character
mov ah, 0x0e


; mov al, 96
; loop:
;   int 0x10
;   inc al
;   cmp al, 'Z' + 1 
;   je exit


; upper_loop:
;   sub al, 31
;   int 0x10
;   cmp al, 'Z' + 1 
;   je exit
;   jmp lower_loop
;
; lower_loop:
;   add al, 33
;   int 0x10
;   cmp al, 'z'
;   je exit
;   jmp upper_loop

[org 0x7c00]
mov bx, love

print:
  mov al, [bx]
  cmp al, 0
  je exit
  int 0x10
  inc bx
  jmp print

love: 
  db "I Love Ayu", 0


exit:
  jmp $
  times 510-($-$$) db 0
  db 0x55, 0xaa


