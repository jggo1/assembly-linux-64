stdout equ 0
stdin  equ 1

sys_read  equ 0
sys_write equ 1
sys_exit  equ 60

%macro read 2
	mov rdx, %2
	mov rsi, %1
	mov rdi, stdout
	mov rax, sys_read 
	syscall
%endmacro

%macro print 2
	mov rdx, %2
	mov rsi, %1
	mov rdi, stdin
	mov rax, sys_write
	syscall
%endmacro

%macro exit 1
	mov rdi, %1
	mov rax, sys_exit
	syscall
%endmacro

section .data
	msg1 db  "enter your name: "
	len1 equ $ - msg1 
	
	msg2 db  "hello, "
	len2 equ $ - msg2
	
	len_name equ 20 
section .bss
	name resb len_name

section .text
	global _start

_start:
	print msg1, len1
	read  name, len_name
	print msg2, len2
	print name, len_name
	exit 0

