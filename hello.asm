section .data
	hello: db 'Hello!', 10		; 'Hello' plus a linefeed character
	hello_len: equ $-hello		; Length of the 'Hello!' string

section .text
	global _start

_start:
	mov eax,4			; The system call for write
	mov ebx,1			; File descriptor 1 - standard output
	mov ecx,hello			; Put the offset of hello in ecx
	mov edx,hello_len		; hello_len is a constant, so we don't need to say
					;  mov edx,[hello_len] to get it's actual value

	int 80h				; Call the kernel

	mov eax,1			; The system call for exit (sys_exit)
	mov ebx,0			; Exit with return code of 0 (no error)
	int 80h
