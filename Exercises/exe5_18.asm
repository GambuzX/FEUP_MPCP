include mpcp.inc
.xmm

.data
sequence REAL4 

.code

conta_intervalo PROTO pt:ptr REAL4, N:dword, limA:REAL4, limB:REAL4

main PROC C
	
main ENDP

conta_intervalo PROC pt:PTR REAL4, N:dword, limA:REAL4, limB:REAL4
	mov edx, pt
	mov ecx, N
	shr ecx, 2

	movss xmm1, limA
	shufps xmm1, xmm1 0
	movss xmm2, limb
	shufps xmm2, xmm2, 0

	.WHILE ecx > 0	
		movaps xmm0, [edx]
		movaps xmm3, xmm0

		cmpps xmm0, xmm1, 5 ;limite superior
		cmpps xmm3, xmm2, 2 ;limite inferior

		andps xmm0, xmm3 ;valores dentro dos limites ficam 11111...1111
		movmskps ebx, xmm0

		dec ecx
		add edx, 16
	.ENDW

	

conta_intervalo ENDP

end