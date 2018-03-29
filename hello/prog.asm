section .data
	msg	db  'Hello, world!',0xa
	len	equ $ - msg

	;console   db 1
	;return	  db 0

	;sys_write db 1
	;sys_exite db 60

section .text
	global 	_start

_start:
	mov rdx, len
	mov rsi, msg
	mov rdi, 1;console
	mov rax, 1;sys_write
	syscall
	
	mov rdi, 0;return
	mov rax, 60;sys_exite
	syscall
