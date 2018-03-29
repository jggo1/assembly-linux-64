section .data
	msg	db  'Hello, world!',0xa
	len	equ $ - msg

section .text
	global 	_start

_start:
	mov rdx, len
	mov rsi, msg
	mov rdi, 1;stdin
	mov rax, 1;sys_write
	syscall
	
	mov rdi, 0;return
	mov rax, 60;sys_exit
	syscall
