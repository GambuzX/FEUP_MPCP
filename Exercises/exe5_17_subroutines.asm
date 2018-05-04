include mpcp_cpp.inc
.xmm

.code 

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