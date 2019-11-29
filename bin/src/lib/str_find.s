; unsigned int str_find(const char *RDI, char RSI)

%include 'core.m'

	section	.text
proc str_find
	mov	rdx, rdi
	mov	al, sil
	cld
.loop:	scasb
	je	.done
	cmp	byte [rdi-1], 0
	jne	.loop
.done:	dec	rdi		; move pointer back to match (or null terminator)
	mov	rax, rdi
	sub	rax, rdx	; return current pointer - initial pointer
endproc
