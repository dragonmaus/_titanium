%define program 'hd'

%include 'core.m'
%include 'error.m'
%include 'stdlib.m'

%define isize 16
%define osize 79

%define index r15
%define length r14

	section	.text
	global	_start
_start:
	xor	index, index			; overall index

.read	sinvoke	sys.read, stdin, ibuf, isize	; read isize bytes into ibuf
	cmp	rax, 0
	jl	.fail
	je	.done
	mov	length, rax			; input size

	invoke	addindex, obuf, index		; output overall index

	xor	r13, r13			; current index in ibuf
.hexg:	xor	r12, r12			; current index in group

	mov	rax, 0x20
	stosb					; output a space

.hexc:	mov	rax, 0x20
	stosb					; output a space

	cmp	r13, length
	jge	.none				; if not past end of input:
	mov	rsi, qword [ibuf+r13]
	call	hexdump
	stosw					; output hex dump of current byte
	jmp	.endh
.none:	mov	rax, 0x2020
	stosw					; else output two spaces
.endh:	inc	r12
	inc	r13
	cmp	r12, 8
	jl	.hexc
	cmp	r13, isize
	jl	.hexg

	mov	rax, 0x2020
	stosw					; output two spaces

	mov	rax, 0x7C
	stosb					; output a pipe

	mov	r13, length
	mov	rsi, ibuf
.char:	or	r13, r13
	jz	.endc				; loop until no more bytes
	call	chardump
	stosb					; output printable variant of current byte
	dec	r13
	jmp	.char
.endc:
	mov	rax, 0x0A7C
	stosw					; output a pipe and a newline

	sub	rdi, obuf			; get output length
	sinvoke	sys.write, stdout, obuf, rdi	; syscall write

	add	index, length			; increment overall index

	cmp	length, isize
	je	.read				; quit if input size < isize

.done:	or	index, index
	jz	.quit				; quit if no data was processed
	invoke	addindex, obuf, index		; otherwise output final index

	mov	rax, 0x0A
	stosb					; output a newline

	sub	rdi, obuf			; get output length
	sinvoke	sys.write, stdout, obuf, rdi	; syscall write
.quit:	sinvoke	sys.exit, 0			; syscall exit
.fail:	neg	rax
;	errcmp	04
;	errcmp	05
;	errcmp	09
;	errcmp	0B
;	errcmp	0E
	errcmp	15
	errcmp	16
	mov	rdx, e__l
	mov	rsi, e__m
.die:	sinvoke	sys.write, stderr		; syscall write (RSI and RDX already set)
	sinvoke	sys.exit, 1			; syscall exit
;	errset	04
;	errset	05
;	errset	09
;	errset	0B
;	errset	0E
	errset	15
	errset	16

; write the current index (SI) to the output (DI) in hex dword (%08x) format
addindex:
	push	rdx
	mov	rdx, rdi			; save original pointer
	add	rdi, 6				; move pointer to the 4th byte (000000[0]0)
	std					; iterate right-to-left
.loop:	call	hexdump
	stosw
	shr	rsi, 8
	cmp	rdi, rdx
	jge	.loop				; loop until we pass the original pointer
	add	rdi, 10				; move past the 4th byte (00000000[.])
	cld
	pop	rdx
	ret

; translate the next byte pointed to by SI into '.' if it is not printable
chardump:
	lodsb
	cmp	al, 0x20			; return '.' if AL < ' '
	jl	.dot
	cmp	al, 0x7E			; return '.' if AL > '~'
	jg	.dot
	ret					; else return AL unmodified
.dot:	mov	al, 0x2E
	ret

; convert the bottom byte of SI into ASCII characters in hex byte format (%02x)
hexdump:
	push	rbx
	mov	rbx, htable			; lookup table
	mov	rax, rsi
	mov	ah, al				; duplicate so we can get at both nibbles
	and	al, 0x0F			; low nibble
	shr	ah, 4				; high nibble
	xlatb					; convert low nibble into ASCII
	xchg	ah, al
	xlatb					; convert high nibble into ASCII
	pop	rbx
	ret

	section	.data
htable	db	'0123456789abcdef'
; the commented errors seem unlikely, if not impossible
; uncomment if encountered in the wild
;	errmsg	04, 'interrupted syscall'
;	errmsg	05, 'IO error'
;	errmsg	09, 'bad file descriptor'
;	errmsg	0B, 'resource temporarily unavailable'
;	errmsg	0E, 'bad address'
	errmsg	15, 'input is a directory'
	errmsg	16, 'invalid input'
	errmsg	__, 'unknown error'

	section	.bss
ibuf	resb	isize
obuf	resb	osize
