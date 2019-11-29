; void byte_copyr(char *RDI, const char *RSI, unsigned int RDX)

%include 'core.m'

	section	.text
proc byte_copyr
	or	rdx, rdx
	jz	.done		; early exit to prevent invalid memory access
	mov	rcx, rdx
	dec	rdx
	add	rsi, rdx	; go to end of source
	add	rdi, rdx	; go to end of destination
	std
rep	movsb
.done:
endproc
