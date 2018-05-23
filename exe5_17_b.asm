include mpcp.inc
.xmm

.data

sequenceX REAL4 1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0
sequenceY REAL4 1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0
result REAL4 ?

.code

prodintSIMD PROTO seqX: PTR REAL4, seqY: PTR REAL4, N: DWORD, res: PTR REAL4

main PROC C
	invoke prodintSIMD, OFFSET sequenceX, OFFSET sequenceY, LENGTHOF sequenceX, OFFSET result
	mov eax, OFFSET result
	invoke _getch
	invoke ExitProcess,0	
main ENDP

prodintSIMD PROC seqX: PTR REAL4, seqY: PTR REAL4, N: DWORD, res: PTR REAL4
	mov ebx, res
	mov edx, seqX
	mov esi, seqY
	mov ecx, N
	shr ecx, 2
	subss xmm0, xmm0
	movss REAL4 PTR [ebx], xmm0

	.WHILE ecx > 0
		movaps xmm0, REAL4 PTR [edx]
		movaps xmm1, REAL4 PTR [esi]
		mulps xmm0, xmm1
		haddps xmm0, xmm0
		haddps xmm0, xmm0 ; todas as 4 SPFP sao a soma que quero
		addss xmm0, REAL4 PTR [ebx] ; soma o valor atual de res
		movss REAL4 PTR [ebx], xmm0

		dec ecx
		add edx, 16
		add esi, 16
	.ENDW
	ret
prodintSIMD ENDP

end