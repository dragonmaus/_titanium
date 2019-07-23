	section	.note.openbsd.ident
	align	2
	dd	8, 4, 1
	db	'OpenBSD', 0
	dd	0
	align	2

	section	.data
msg	db	'Hello!', 10
msg_len	equ	$ - msg

	section	.text
	global	_start
_start:
	push	dword msg_len
	push	dword msg
	push	dword 1		; stdout
	push	dword eax	; padding
	mov	eax, 4		; syscall write
	int	0x80
	add	esp, 12		; clean stack

	push	dword eax
	push	dword eax	; padding
	mov	eax, 1		; syscall exit
	int	0x80
