; unsigned int str_copy(char *RDI, const char *RSI)

%include 'core.m'

	section	.text
proc str_copy
	mov	rdx, rdi
	cld
.loop:	movsb
	cmp	byte [rsi-1], 0
	jne	.loop
	dec	rdi		; move pointer back to null terminator
	mov	rax, rdi
	sub	rax, rdx	; return current pointer - initial pointer
endproc
