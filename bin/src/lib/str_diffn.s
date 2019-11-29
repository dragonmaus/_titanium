; int str_diffn(const char *RDI, const char *RSI, unsigned int RDX)

%include 'core.m'

	section	.text
proc str_diffn
	or	rdx, rdx
	jz	.fail		; fail early if RDX == 0 (simplifies logic below)
	mov	rcx, rdx
	cld
.loop:	cmpsb
	jne	.done
	cmp	byte [rsi-1], 0
	loopne	.loop
.fail:	xor	rax, rax	; no differences found; return 0
endproc
.done	mov	al, byte [rdi-1]
	sub	al, byte [rsi-1]
	movsx	rax, al		; return *RDI - *RSI
endproc
