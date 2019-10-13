	.section	".note.openbsd.ident", "a"
	.p2align	2
	.long		8
	.long		4
	.long		1
	.ascii		"OpenBSD\0"
	.long		0
	.p2align	2

	.section	.text
	.global		_start
_start:
	movl		$42, %eax
	pushl		%eax
	pushl		%eax		# padding
	movl		$1, %eax	# syscall exit
	int		$0x80
