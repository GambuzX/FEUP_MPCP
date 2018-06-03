include mpcp.inc
.xmm

.data
seq1 REAL4 4.1, 5.6, 8.2, 3.3
seq2 REAL4 8.9, 4.5, 1.9, 7.4
result REAL4 4 DUP(?)


.code

addSeq PROTO seqX: PTR REAL4, seqY: PTR REAL4, N: dword, result: PTR REAL4

main PROC C
	invoke addSeq, offset seq1, offset seq2, lengthof seq1, offset result
	invoke _getch
	invoke ExitProcess,0	
main ENDP

addSeq PROC USES EBX ESI seqX: PTR REAL4, seqY: PTR REAL4, N: dword, res: PTR REAL4
	mov ebx, seqX
	mov esi, seqY
	mov edx, res
	mov ecx, N
	shr ecx, 2

	.WHILE ecx > 0
		movaps xmm0, [ebx]
		movaps xmm1, [esi]
		addps xmm0, xmm1
		movaps [edx], xmm0

		add ebx, 4
		add esi, 4
		add edx, 4
		dec ecx
	.ENDW

	ret
addSeq endP

end