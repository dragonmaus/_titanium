	section	.note.openbsd.ident
	align	2
	dd	8
	dd	4
	dd	1
	db	'OpenBSD', 0
	dd	0
	align	2

	section	.text
	global	_start
_start:
	mov	eax, 42
	push	dword eax
	push	dword eax	; padding
	mov	eax, 1		; syscall exit
	int	0x80
