; TODO: use a larger buffer

%include 'core.m'
%include 'stdlib.m'

	section	.text
	global	_start
_start:
.read:	sinvoke	sys.read, stdin, c, 1		; read the next byte
	cmp	rax, 0
	jl	.fail
	je	.exit
	cmp	byte [c], 0x0D			; did we read a carriage return ('\r')?
	jne	.write				; no, write the current byte
	sinvoke	sys.write, stdout, lf, 1	; write a newline
	cmp	rax, 1
	jne	.fail
	sinvoke	sys.read, stdin, c, 1		; read the next byte
	cmp	rax, 0
	jl	.fail
	je	.exit
	cmp	byte [c], 0x0A			; did we read a line feed ('\n')?
	je	.read				; yes, skip to next loop iteration
.write:	sinvoke	sys.write, stdout, c, 1		; write the current byte
	cmp	rax, 1
	je	.read
.fail:	sinvoke	sys.exit, 1
.exit:	sinvoke	sys.exit, 0

	section	.data
lf	db	0x0A

	section	.bss
c	resb	1
