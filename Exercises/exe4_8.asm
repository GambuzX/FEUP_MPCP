include mpcp.inc

.data
	msg BYTE "Menor potencia de 2 menor que %d = %d", 0 ,10 ,13
	testValue DWORD 126

.code
minPot2 PROTO val: DWORD

main PROC C
	invoke minPot2, testValue
	invoke printf, OFFSET msg, testValue, eax
	invoke _getch
	invoke ExitProcess,0
main ENDP


minPot2 PROC val: DWORD
	LOCAL shifts: DWORD
	mov eax, 0
	mov shifts, eax

	mov eax, val
	
	.WHILE eax != 1
		sar eax, 1
		inc shifts
	.ENDW

	inc shifts
	.WHILE shifts > 0
		sal eax, 1
		dec shifts
	.ENDW
	ret
minPot2 endP

end