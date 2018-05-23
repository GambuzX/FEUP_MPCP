include mpcp.inc

.data
seq SDWORD 15, -19, 8, 71, -100, 20, 41, -11, -20, -54,500,12
limiar SDWORD 20 ; sempre positivo
limiarNeg SDWORD 1
formato BYTE "Alterados %d elementos.", 13, 10, 0

.code

main PROC C
	mov ecx, LENGTHOF seq
	mov edx, OFFSET seq

	mov eax, limiar
	neg eax
	mov limiarNeg, eax
	xor eax, eax

ciclo:
	cmp ecx, 0
	jz fim
	mov ebx, [edx]
	cmp ebx, limiar
	jg maior
	cmp ebx, limiarNeg
	jl menor
	add edx, 4
	loop ciclo
	jmp fim

maior:
	mov esi, limiar
	mov [edx], esi
	inc eax
	add edx, 4
	loop ciclo
	jmp fim

menor:
	mov esi, limiarNeg
	mov [edx], esi
	inc eax
	add edx, 4
	loop ciclo
	;jmp fim

	fim:
	invoke printf, OFFSET formato, eax
	invoke _getch
	invoke ExitProcess,0

main ENDP

end