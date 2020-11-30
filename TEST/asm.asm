.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib ../LP_LIB/Debug/LP_Lib.lib
ExitProcess PROTO : DWORD
EXTRN Concat		: PROC
EXTRN ConvertToChar		: PROC
EXTRN Copy		: PROC
EXTRN ConsoleWrite		: PROC


.stack 4096
.const
	l0 DWORD 00000001y
	l1 DWORD 00000010y
	l2 DWORD 00000101y
	l3 DWORD 00001010y
	l4 DWORD 00000011y
	l5 BYTE '�������������� ��������', 0
	l6 BYTE 'Hello, ', 0
	l7 BYTE 'World!', 0
	l8 BYTE '�������� �� ��������', 0
	l9 BYTE '������ � ���������', 0
	l10 BYTE '������ �����', 0
	l11 BYTE '����� �����', 0
	l12 DWORD 00000000y
.data
	Sumsum			DWORD 0
	Raznsub			DWORD 0
	Multimul			DWORD 0
	Divisiondiv			DWORD 0
	RemOfDivremofdiv			DWORD 0
	maina			DWORD 0
	mainb			DWORD 0
	mainc			DWORD 0
	maind			DWORD 0
	maine			DWORD 0
	mainsa			DWORD 0
	mainsb			DWORD 0
	mainconcatenated			DWORD 0
	mainx			DWORD 0
	mainy			DWORD 0
	mainout			DWORD 0
	mainiterator			DWORD 0

.code
Sum PROC b: DWORD, a: DWORD
	push		a
	push		b
	;\/��������\/
	pop		eax
	pop		ebx
	add		eax, ebx
	push		eax
	;/\��������/\
	pop			Sumsum

	mov		eax, Sumsum
	ret
Sum ENDP

Razn PROC b: DWORD, a: DWORD
	push		a
	push		b
	;\/���������\/
	pop		ebx
	pop		eax
	sub		eax, ebx
	push		eax
	;/\���������/\
	pop			Raznsub

	mov		eax, Raznsub
	ret
Razn ENDP

Multi PROC b: DWORD, a: DWORD
	push		a
	push		b
	;\/���������\/
	pop		eax
	pop		ebx
	mul		ebx
	push		eax
	;/\���������/\
	pop			Multimul

	mov		eax, Multimul
	ret
Multi ENDP

Division PROC b: DWORD, a: DWORD
	push		a
	push		b
	;\/�������\/
	pop		ebx
	mov		edx, 0
	pop		eax
	div		ebx
	push		eax
	;/\�������/\
	pop			Divisiondiv

	mov		eax, Divisiondiv
	ret
Division ENDP

RemOfDiv PROC b: DWORD, a: DWORD
	push		a
	push		b
	;\/������� �� �������\/
	pop		ebx
	mov		edx, 0
	pop		eax
	div		ebx
	push		edx
	;/\������� �� �������/\
	pop			RemOfDivremofdiv

	mov		eax, RemOfDivremofdiv
	ret
RemOfDiv ENDP

main PROC
	push		l0
	push		l1
	;\/��������\/
	pop		eax
	pop		ebx
	add		eax, ebx
	push		eax
	;/\��������/\
	push		l1
	push		l0
	;\/��������\/
	pop		eax
	pop		ebx
	add		eax, ebx
	push		eax
	;/\��������/\
	;\/���������\/
	pop		ebx
	pop		eax
	sub		eax, ebx
	push		eax
	;/\���������/\
	pop			maina

	push		l1
	push		l0
	;\/���������\/
	pop		ebx
	pop		eax
	sub		eax, ebx
	push		eax
	;/\���������/\
	pop			mainb

	push		l1
	push		l2
	;\/���������\/
	pop		eax
	pop		ebx
	mul		ebx
	push		eax
	;/\���������/\
	pop			mainc

	push		l3
	push		l1
	;\/�������\/
	pop		ebx
	mov		edx, 0
	pop		eax
	div		ebx
	push		eax
	;/\�������/\
	pop			maind

	push		l3
	push		l4
	;\/������� �� �������\/
	pop		ebx
	mov		edx, 0
	pop		eax
	div		ebx
	push		edx
	;/\������� �� �������/\
	pop			maine

	push		offset l5
	call		ConsoleWrite

	push		maina
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		mainb
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		mainc
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		maind
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		maine
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		offset l5
	call		ConsoleWrite

	push		offset l6
	pop			mainsa

	push		offset l7
	pop			mainsb

	push		offset l8
	call		ConsoleWrite

	push		mainsa
	call		ConsoleWrite

	push		mainsb
	call		ConsoleWrite

	push		mainsa
	push		mainsb
	call		Concat
	push		eax
	pop			mainconcatenated

	push		mainconcatenated
	call		ConsoleWrite

	push		offset mainsb
	push		mainsa
	call		Copy
	push		mainsb
	call		ConsoleWrite

	push		offset l8
	call		ConsoleWrite

	push		l3
	pop			mainx

	push		l2
	pop			mainy

	push		offset l9
	call		ConsoleWrite

	push		mainx
	push		mainy
	call		Sum
	push		eax
	pop			mainout

	push		mainout
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		mainx
	push		mainy
	call		Razn
	push		eax
	pop			mainout

	push		mainout
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		mainx
	push		mainy
	call		Multi
	push		eax
	pop			mainout

	push		mainout
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		mainx
	push		mainy
	call		Division
	push		eax
	pop			mainout

	push		mainout
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		mainx
	push		mainy
	call		RemOfDiv
	push		eax
	pop			mainout

	push		mainout
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	push		offset l9
	call		ConsoleWrite

	push		l3
	pop			mainiterator

	push		offset l10
	call		ConsoleWrite

	.while		mainiterator
	;\/���� �����\/
	push		mainiterator
	call		ConvertToChar
	push		eax
	call		ConsoleWrite

	dec			mainiterator
	;/\���� �����/\
	.endw
	push		offset l11
	call		ConsoleWrite

	push		l12
	call		ExitProcess
main ENDP
end main
