include mpcp.inc

.data
	msg BYTE "%d", 0 ,10, 13
	testNumber DWORD 5

.code
primo PROTO n: DWORD

main PROC C
	invoke primo, testNumber
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess,0

main ENDP

primo PROC n: DWORD
	LOCAL nDivisores: DWORD, divisor: DWORD
	mov ecx, 2
	mov divisor, ecx ;divisor comeca a 2
	mov eax, n
	mov edx, 0 ;clear edx
	div ecx
	mov nDivisores, eax ;eax fica com o valor de n / 2

	.IF n == 1 || n == 2 ;casos especiais
		mov eax, 1
		ret
	.ENDIF

	.WHILE nDivisores > 0
		mov eax, n
		mov edx, 0
		div divisor

		.IF edx == 0 ;se for divisivel pelo numero atual
			mov eax, 0
			ret
		.ENDIF

		dec nDivisores
		inc divisor
	.ENDW

	;se for primo
	mov eax, 1
	ret
primo ENDP

end