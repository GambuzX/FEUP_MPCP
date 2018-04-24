include mpcp.inc

.data
	pontos sword -2, 0, 2, -2, 3, 0, 0, 0, 0, -3, 1, 0
	Px sword 1
	Py sword 1
	msg byte "Numero de pontos abaixo e a direita de (Px,Py): %d",13, 10, 0

.code

main PROC C
	mov edx, OFFSET pontos
	mov eax, LENGTHOF pontos
	mov cl, 2
	div cl
	mov ecx, eax
	xor eax, eax

	ciclo:
	cmp ecx, 0
	jz fim
	mov bx, [edx]
	cmp bx, Px
	jle avanca
	mov bx, [edx+2]
	cmp bx, Py
	jge avanca
	inc eax
	
	avanca:
	add edx, TYPE pontos
	add edx, TYPE pontos
	dec ecx
	loop ciclo

	fim:
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess,0

main ENDP

end