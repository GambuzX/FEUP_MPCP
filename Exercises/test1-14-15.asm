include mpcp.inc

.data
	val DWORD 5
	seq DWORD 3,40,15,8,1,13,5,17,21,25,120
	fmt BYTE "A sequencia tem %d multiplos de %d.",10,13,"Adeusinho.",0

.code

main PROC C
	mov esi, OFFSET seq
	mov ecx, LENGTHOF seq
	xor ebx, ebx

ciclo:
	cmp ecx, 0
	jz fim
	mov eax, [esi]
	xor edx, edx
	div val
	.IF edx == 0
		inc ebx
	.ENDIF
	add esi, 4
	loop ciclo

fim:
	invoke printf, OFFSET fmt, ebx, val
	invoke _getch
	invoke ExitProcess, 0

main ENDP

end