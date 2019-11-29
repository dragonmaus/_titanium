; int byte_diff(const char *RDI, const char *RSI, unsigned int RDX)

%include 'core.m'

	section	.text
proc byte_diff
	mov	rcx, rdx
	cld
repe	cmpsb
	mov	al, byte [rdi-1]
	sub	al, byte [rsi-1]
	movsx	rax, al		; return *RDI - *RSI
endproc
