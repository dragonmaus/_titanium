; TODO: use a larger buffer
%include 'core.m'

	section	.text
	global	_start
_start:
.read:	sinvoke	3, 0, c, 1	; read the next byte
	cmp	rax, 0
	jl	.fail
	je	.exit
	cmp	byte [c], 0x0D	; did we read a carriage return ('\r')?
	jne	.write		; no, write the current byte
	sinvoke	4, 1, lf, 1	; write a newline
	cmp	rax, 1
	jne	.fail
	sinvoke	3, 0, c, 1	; read the next byte
	cmp	rax, 0
	jl	.fail
	je	.exit
	cmp	byte [c], 0x0A	; did we read a line feed ('\n')?
	je	.read		; yes, skip to next loop iteration
.write:	sinvoke	4, 1, c, 1	; write the current byte
	cmp	rax, 1
	je	.read
.fail:	sinvoke	1, 1
.exit:	sinvoke	1, 0

	section	.data
lf	db	0x0A

	section	.bss
c	resb	1
