include mpcp.inc
.xmm

.data
sequence REAL4 12.0 , 1.5 , 4.1 , 5.2 ,9.8 , 15.9 ,0.0 , 3.7

.code
mirrorSeq PROTO seq:PTR REAL4, N:DWORD

main PROC C
	invoke mirrorSeq, OFFSET sequence, LENGTHOF sequence
	mov eax, OFFSET sequence
	
	invoke _getch
	invoke ExitProcess,0
main ENDP

mirrorSeq PROC seq:PTR REAL4, N:DWORD	
	mov ebx, seq
	mov ecx, N
	shr ecx, 1

	.WHILE ecx > 0
		movss xmm0, REAL4 PTR [ebx]
		movss xmm1, REAL4 PTR [ebx+4]

		movss REAL4 PTR [ebx+4], xmm0
		movss REAL4 PTR [ebx], xmm1

		dec ecx
		add ebx, 8
	.ENDW
	ret
mirrorSeq ENDP

end