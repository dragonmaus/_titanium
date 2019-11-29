; unsigned int byte_find(const char *RDI, char RSI, unsigned int RDX)

%include 'core.m'

	section	.text
proc byte_find
	mov	rcx, rdx
	mov	rdx, rdi	; save initial pointer
	mov	al, sil
	cld
repne	scasb
	mov	rax, rdi
	sub	rax, rdx	; return current pointer - initial pointer
endproc
