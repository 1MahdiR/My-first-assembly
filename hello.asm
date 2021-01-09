section .data
	hello: db 'Hello!', 10		; 'Hello' plus a linefeed character
	hello_len: equ $-hello		; Length of the 'Hello!' string
	
	newline: db '', 10		; New line
	newline_len: equ $-newline	; New line length

	name: db 'My name is MR', 10	; Another string
	name_len: equ $-name		; Length of name string


section .text
	global _start

_start:
	mov eax,4			; The system call for write
	mov ebx,1			; File descriptor 1 - standard output
	mov ecx,hello			; Put the offset of hello in ecx
	mov edx,hello_len		; hello_len is a constant, so we don't need to say
					;  mov edx,[hello_len] to get it's actual value
	
	int 80h				; Call the kernel
		
	
	mov eax,4			; Prints a new line, after that, prints name string
	mov ebx,1
	mov ecx,newline			
	mov edx,newline_len

	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,name_len		


	int 80h				; Call the kernel, again

	mov eax,1			; The system call for exit (sys_exit)
	mov ebx,0			; Exit with return code of 0 (no error)
	int 80h
