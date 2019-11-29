; unsigned int str_findr(const char *RDI, char RSI)

%include 'core.m'

	section	.text
proc str_findr
	mov	rdx, rdi
	xor	rcx, rcx	; match will be stored here
	mov	al, sil
	cld
.loop:	scasb
	jne	.skip
	mov	rcx, rdi	; save current pointer if match found
.skip:	cmp	byte [rdi-1], 0
	jne	.loop
	or	rcx, rcx
	jnz	.done		; check if a match was found
	mov	rcx, rdi	; if not, use current pointer
.done:	dec	rcx		; move pointer back to match (or null terminator)
	sub	rcx, rdx
	mov	rax, rcx	; return current pointer - initial pointer
endproc
