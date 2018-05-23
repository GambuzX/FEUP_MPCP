include mpcp.inc
.xmm

.data
sequence REAL4 12.0, 3.4, 5.6, 9.1, 14.2,15.1, 12.4, 8.2
alpha REAL4 3.0

testVal REAL8 ?

.code
scaleSeq PROTO seq:PTR REAL4, N:DWORD, alfa:REAL4

main PROC C
	invoke scaleSeq, OFFSET sequence, LENGTHOF sequence, alpha

	mov eax, OFFSET sequence
	
	invoke _getch
	invoke ExitProcess,0
main ENDP

scaleSeq PROC seq:PTR REAL4, N:DWORD, alfa:REAL4
	movss xmm0, alfa
	shufps xmm0, xmm0, 0 ;entire register equal to alfa

	mov ecx, N
	mov ebx, seq
	.WHILE ecx > 0
		movaps xmm1, REAL4 PTR [ebx]
		mulps xmm1, xmm0
		movaps REAL4 PTR [ebx], xmm1

		add ebx, 16
		dec ecx
	.ENDW
	ret
scaleSeq ENDP

end