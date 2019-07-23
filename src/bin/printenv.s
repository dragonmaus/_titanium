%include 'core.m'

	section	.text
	global	_start
_start:
;	mov	rax, [rsp]	; argc
;	cmp	rax, 1
;	jg	.args
	mov	rbx, rsp
	add	rbx, 24		; envv
.env:	mov	r12, [rbx]
	or	r12, r12
	jz	.exit		; loop until end of envv (null pointer)
	mov	rdi, r12
	xor	rcx, rcx
	not	rcx		; max uint64
	xor	rax, rax	; scan for `\0`
	cld
repne	scasb
	not	rcx		; ~rcx = string length + 1 (for newline)
	dec	rdi
	mov	byte [rdi], 0x0A	; replace null terminator with newline
	sinvoke	4, 1, r12, rcx	; syscall write
	add	rbx, 8		; ++envv
	jmp	.env
.args:	; TODO: implement this
.exit:	sinvoke	1, 0
