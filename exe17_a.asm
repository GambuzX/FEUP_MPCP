include mpcp.inc

	.data
sequence DWORD 1,2,3,4,5,6,12
msg BYTE "Median value = %d", 13,10,0

	.code
main PROC C
	mov eax,0
	mov ecx, LENGTHOF sequence
	mov edx, OFFSET sequence

	;;Ciclo para somar os valores
	ciclo: 
	mov ebx, [edx]
	add eax, ebx
	add edx, TYPE sequence
	loop ciclo

	mov ecx, LENGTHOF sequence
	mov edx, 0
	div ecx

	sal edx,1 ;multiplico resto por 2
	cmp edx,ecx ;comparo o dobro do resto com o divisor
	jnge fim ;se nao for maior ou igual, nao e preciso incrementar
	inc eax 

	fim:
	invoke printf, offset msg, eax
	invoke _getch
	invoke ExitProcess,0

main ENDP

end