section .data
	hello: db 'Condition test in assembly',10	; First message
	hello_len: equ $-hello

	newline: db '',10				; Newline
	newline_len: equ $-newline

	equal_text: db 'They are equal!',10		; Message to show if 'equal'
	equal_text_len: equ $-equal_text

	notEqual_text: db 'They are NOT equal!',10	; Message to show if 'NOT equal'
	notEqual_text_len: equ $-notEqual_text

section .test
	global _start

_start:
	mov eax,4					; Prints the first message
	mov ebx,1
	mov ecx,hello
	mov edx,hello_len

	int 80h

	mov eax,4					; Newline
	mov ebx,1
	mov ecx,newline
	mov edx,newline_len

	int 80h

	mov eax, 5					; Compare two values (5,3)
	mov ecx, 3
	cmp eax, ecx					
	je equal					; If equal, call 'equal'
	call notEqual					; else, call 'notEqual'

equal:
	mov eax,4					; Prints equal message
	mov ebx,1
	mov ecx,equal_text
	mov edx,equal_text_len
	
	int 80h

	mov eax, 1					; Gracefully exits
	mov ebx, 0	
	int 80h

notEqual:	
	mov eax,4					; Prints not equal message
	mov ebx,1
	mov ecx,notEqual_text
	mov edx,notEqual_text_len

	int 80h

	mov eax, 1					; Gracefully exits
	mov ebx, 0	
	int 80h
