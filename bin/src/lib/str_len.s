; unsigned int str_len(const char *RDI)

%include 'core.m'

	section	.text
proc str_len
	xor	rcx, rcx
	not	rcx		; max uint64
	xor	al, al		; search for null terminator
	cld
repne	scasb
	not	rcx
	dec	rcx		; string length = ~rcx - 1
	mov	rax, rcx
endproc
