include mpcp.inc
.xmm

.data


.code
scaleSeq PROTO seq:PTR REAL4, N:DWORD, alfa:REAL4

main PROC C

main ENDP

scaleSeq PROC seq:PTR REAL4, N:DWORD, alfa:REAL4
	mov ecx, N
	mov esi, seq

	.WHILE ecx > 0
		movss xmm0, REAL4 PTR [esi]
		mulss xmm0, alfa


		dec ecx
	.ENDW
	ret

scaleSeq ENDP

end