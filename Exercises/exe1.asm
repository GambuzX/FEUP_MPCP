include mpcp.inc

	.data
cadeia	BYTE "abcd", 0
msg BYTE "Total = %d", 13,10,0 ;\n, \newline, ...

	.code
main PROC C
	mov eax, 0
	mov ebx, offset cadeia
ciclo: mov dl, [ebx] 
	cmp dl, 0
	jz fim
	add ebx, type cadeia ;incrementa endereco
	inc eax ;incrementa contador
	jmp ciclo

fim: invoke printf, offset msg, eax
	invoke _getch
	invoke	ExitProcess, 0

main ENDP

end