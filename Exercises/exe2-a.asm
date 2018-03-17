include mpcp.inc

	.data
seqB	SBYTE 1,2,3,4,5,6,7,8,9,10
seqW	SWORD 10 DUP(?)

	.code
main PROC C
	mov edi, offset seqB
	mov esi, offset seqW
	mov ecx, lengthof seqB
ciclo: mov al,[edi]
	cbw
	mov[esi], ax

	add edi, type seqB

	add esi, type seqW
	loop ciclo

fim:invoke	ExitProcess, 0

main ENDP

end