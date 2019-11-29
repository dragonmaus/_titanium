; int str_diff(const char *RDI, const char *RSI)

%include 'core.m'

	section	.text
proc str_diff
	cld
.loop:	cmpsb
	jne	.done
	cmp	byte [rsi-1], 0
	jne	.loop
.done	mov	al, byte [rdi-1]
	sub	al, byte [rsi-1]
	movsx	rax, al		; return *RDI - *RSI
endproc
