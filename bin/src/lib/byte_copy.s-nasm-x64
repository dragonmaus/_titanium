; void byte_copy(char *RDI, const char *RSI, unsigned int RDX)

%include 'core.m'

	section	.text
proc byte_copy
	mov	rcx, rdx
	cld
rep	movsb
endproc
