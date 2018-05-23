include mpcp.inc
.xmm

.data
msg BYTE "Value = %f", 13, 10 ,0

sequence REAL4 12.0, 3.4, 5.6, 9.1, 14.2
alpha REAL4 0.5

testVal REAL8 ?

.code
scaleSeq PROTO seq:PTR REAL4, N:DWORD, alfa:REAL4

main PROC C
	invoke scaleSeq, OFFSET sequence, LENGTHOF sequence, alpha

	cvtss2sd xmm0, sequence
	movsd testVal, xmm0
	invoke printf, OFFSET msg, testVal

	invoke _getch
	invoke ExitProcess,0
main ENDP

scaleSeq PROC seq:PTR REAL4, N:DWORD, alfa:REAL4
	mov ecx, N
	mov esi, seq

	.WHILE ecx > 0
		movss xmm0, REAL4 PTR [esi]
		mulss xmm0, alfa
		movss REAL4 PTR [esi], xmm0

		add esi, TYPE REAL4
		dec ecx
	.ENDW
	ret

scaleSeq ENDP

end