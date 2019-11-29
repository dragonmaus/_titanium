; unsigned int byte_findr(const char *RDI, char RSI, unsigned int RDX)

%include 'core.m'

	section	.text
proc byte_findr
	mov	rcx, rdx
	mov	al, sil
	add	rdi, rcx
	dec	rdi		; start at end of region
	std
repne	scasb
	jne	.fail
	mov	rax, rcx	; return index of matching byte
endproc
.fail:	mov	rax, rdx	; return length of region (index of last byte + 1)
endproc
