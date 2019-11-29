; unsigned int str_start(const char *RDI, const char *RSI)

%include 'core.m'

	section	.text
proc str_start
	xor	rax, rax
	cld
.loop:	cmp	byte [rsi], 0
	je	.done
	cmpsb
	je	.loop
endproc				; strings are different; return 0
.done:	inc	rax		; strings are equal; return 1
endproc
