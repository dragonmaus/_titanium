%include 'core.m'

	cextern	buffer_0
	cextern	buffer_1
	cextern	buffer_flush
	cextern	buffer_getc
	cextern	buffer_peek
	cextern	buffer_putc
	cextern	buffer_seek
	cglobal	errno

	section	.text
proc _start
.read:	cinvoke	buffer_getc, buffer_0, c
	cmp	rax, 0
	je	.exit
	jl	.fail
	cmp	byte [c], 0x0D
	jne	.write
	cinvoke	buffer_putc, buffer_1, 0x0A
	cinvoke	buffer_peek, buffer_0
	cmp	rax, 0x0A
	jne	.read
	cinvoke	buffer_seek, buffer_0, 1
	jmp	.read
.write:	cinvoke	buffer_putc, buffer_1, c
	jmp	.read
.exit:	cinvoke	buffer_flush, buffer_1
	sinvoke	1, 0
.fail:	cinvoke	buffer_flush, buffer_1
	sinvoke	1, 1
endproc

	section	.data
errno	dd	0

	section	.bss
c	resb	1
