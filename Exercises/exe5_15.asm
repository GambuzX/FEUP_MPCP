include mpcp.inc
.xmm

.data
sequence SDWORD 12 , 1 , 4 , 5 ,9 , 15 ,0 , 3

.code
invCoords PROTO seq: PTR SDWORD, n: DWORD

main PROC C
	invoke invCoords, OFFSET sequence, LENGTHOF sequence
	mov eax, OFFSET sequence
	
	invoke _getch
	invoke ExitProcess,0
main ENDP

invCoords PROC seq: PTR SDWORD, n: DWORD
	mov ebx, seq
	mov ecx, n
	shr ecx, 1

	.WHILE ecx > 0
		cvtsi2ss xmm0, REAL4 PTR [ebx]
		cvtsi2ss xmm1, REAL4 PTR [ebx+4]

		movss REAL4 PTR [ebx+4], xmm0
		movss REAL4 PTR [ebx], xmm1

		dec ecx
		add ebx, 8
	.ENDW
	ret
invCoords ENDP

end