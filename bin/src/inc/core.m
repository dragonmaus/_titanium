%ifndef CORE_M
%define CORE_M

%macro cextern 1
	extern	%1
%endmacro

%macro cglobal 1
	global	%1
%endmacro

%macro cinvoke 1-*
	%assign a (%0 - 1)
;	%assign s 0
	%if a > 0
;		%if (a % 2) == 1
;			sub	esp, 4
;			%assign s ((a - 1) * 4)
;		%else
;			%assign s ((a - 0) * 4)
;		%endif
		%rep a
			%rotate -1
			push	dword %1
		%endrep
	%endif
	%rotate -1
	call	%1
;	%if s > 0
;		add	esp, s
;	%endif
%endmacro

%macro invoke 1-*
	%assign a (%0 - 1)
	%if a > 0
		%rep a
			%rotate -1
			push	%1
		%endrep
	%endif
	%rotate -1
	call	%1
%endmacro

%macro minmov 2
	%ifnidn %1, %2		; emit nothing if moving a register onto itself
		%ifidn %2, 0	; `xor reg, reg` is smaller than `mov reg, 0`
			xor	%1, %1
		%else
			mov	%1, %2
		%endif
	%endif
%endmacro

%macro proc 0
proc %00
%endmacro

%macro proc 1
	cglobal	%1
%1:
	push	ebp
	mov	ebp, esp
%endmacro

%macro endproc 0
	pop	ebp
	ret
%endmacro

%macro sinvoke 1-*
	%assign a (%0 - 1)
	%if a > 0
		%rep a
			%rotate -1
			push	%1
		%endrep
	%endif
	%rotate -1
	minmov	eax, %1
	int	0x80
%endmacro

%macro string 1+
%00	db	%1
%00_len	equ	$ - %00
%endmacro

%endif
