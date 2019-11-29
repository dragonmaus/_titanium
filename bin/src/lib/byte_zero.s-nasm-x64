; void byte_zero(char *RDI, unsigned int RSI)

%include 'core.m'

	section	.text
proc byte_zero
	mov	rcx, rsi
	xor	al, al
	cld
rep	stosb
endproc
