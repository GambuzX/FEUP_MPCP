include mpcp.inc

.data
	msg BYTE "%d", 0 ,10, 13
	testNumber DWORD 5

	msg2 BYTE "Max = %d, Min = %d", 0 , 10 , 13
	numbersVector DWORD 13,24,56,97,5,5,23,2,114,131

.code
primo PROTO n: DWORD
maxAndMinPrimes PROTO vectorPtr: PTR DWORD, vectorSize: DWORD

main PROC C
	invoke maxAndMinPrimes, OFFSET numbersVector, LENGTHOF numbersVector
	invoke printf, OFFSET msg2, edx, eax
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

maxAndMinPrimes PROC vectorPtr: PTR DWORD, vectorSize: DWORD
	LOCAL n: DWORD, max: DWORD, min: DWORD

	mov ecx, vectorSize
	mov n, ecx

	mov ebx, vectorPtr

	mov max, 0
	mov min, 999999

	.WHILE n > 0
		invoke primo, [ebx]
		.IF eax == 1 ;if number is prime
			mov eax, [ebx]
			.IF eax > max
				mov max, eax
			.ENDIF

			.IF eax < min
				mov min, eax
			.ENDIF
		.ENDIF
		add ebx, 4
		dec n
	.ENDW
	mov eax, min
	mov edx, max
	ret
maxAndMinPrimes ENDP

end