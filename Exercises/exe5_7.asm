include mpcp.inc
.xmm

.data
msg BYTE "Internal product = %f", 13,10,0

vecX REAL4 12.0, 3.5, 4.1
vecY REAL4 24.0, 1.2, 7.1
result REAL4 ?
result8 REAL8 ?

.code

prodint PROTO vectX: PTR REAL4, vectY: PTR REAL4, N: dword, res: PTR REAL4

main PROC C
	invoke prodint, OFFSET vecX, OFFSET vecY, LENGTHOF vecX, OFFSET result

	cvtss2sd xmm0, result
	movsd result8, xmm0
	invoke printf, OFFSET msg, result8
	invoke _getch
	invoke ExitProcess,0	
main ENDP

prodint PROC vectX: PTR REAL4, vectY: PTR REAL4, N: dword, res: PTR REAL4
	mov edx, vectX
	mov esi, vectY
	mov ecx, N
	mov eax, res
	subss xmm2, xmm2

	.WHILE ecx > 0
		movss xmm0, REAL4 PTR [edx]
		movss xmm1, REAL4 PTR [esi]
		mulss xmm0, xmm1
		addss xmm2, xmm0

		add edx, TYPE REAL4
		add esi, TYPE REAL4
		dec ecx
	.ENDW

	movss REAL4 PTR [eax], xmm2
	ret
prodint endP

end