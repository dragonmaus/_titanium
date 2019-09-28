%ifndef ERROR_M
%define ERROR_M

%ifndef program
	%warning "program not defined, defaulting to 'program'"
	%define program 'program'
%endif

%ifndef print_error_and_exit
	%define print_error_and_exit .die
%endif

%macro errcmp 1
	cmp	eax, 0x%1
	je	.e%1
%endmacro

%macro errmsg 2+
e%1m	db	program, ': fatal: ', %2, 0x0A
e%1l	equ	$ - e%1m
%endmacro

%macro errset 1
.e%1:	push	dword e%1l
	push	dword e%1m
	jmp	print_error_and_exit
%endmacro

%endif
