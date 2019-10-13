	.section .note.openbsd.ident, "a"
	.p2align 2
	.long	8
	.long	4
	.long	1
	.ascii	"OpenBSD\0"
	.long	0
	.p2align 2

	.section .data
msg:	.ascii	"Hello!\n"
msg_len	=	. - msg

	.section .text
	.globl	_start
_start:
	pushl	$msg_len
	pushl	$msg
	pushl	$1
	pushl	%eax		# padding
	movl	$4, %eax	# syscall write
	int	$0x80
	addl	$12, %esp	# clean stack

	pushl	%eax
	pushl	%eax		# padding
	movl	$1, %eax	# syscall exit
	int	$0x80
