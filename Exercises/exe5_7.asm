include mpcp.inc
.xmm

.data
msg BYTE "Internal product = %f", 13,10,0

vecX REAL4 12.0, 3.5, 4.1
vecY REAL4 24.0, 1.2, 7.1
result REAL4 ?

.code

prodint PROTO vectX: PTR REAL4, vectY: PTR REAL4, N: dword, res: PTR REAL4

main PROC C
	invoke prodint, OFFSET vecx, OFFSET vecY, LENGTHOF vecX, result
	invoke printf, OFFSET msg, result
	invoke _getch
	invoke ExitProcess,0	
main ENDP

prodint PROC vectX: PTR REAL4, vectY: PTR REAL4, N: dword, res: PTR REAL4
	mov edx, vectX
	mov esi, vectY
	mov ecx, N
	subss xmm0,xmm0
	movss res, xmm0

	.WHILE ecx > 0
		movss xmm0, [edx]
		movss xmm1, [esi]
		mulss xmm0, xmm1
		addss res, xmm0

		add edx, 4
		add esi, 4
		dec ecx
	.ENDW

	ret
prodint endP

end