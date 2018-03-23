include mpcp.inc

	.data
seqB	SDWORD 12, 80000000H, 7FFFFFFFH, 1, 5FF42AC1H
seqW	SWORD 10 DUP(12)

	.code
main PROC C
	mov edi, offset seqB
	mov esi, offset seqW
	mov ecx, lengthof seqB
ciclo: cmp ecx, 0
	jz fim
	mov eax, [edi] ; guardo o valor a alterar
	test eax, 0FFFF0000H; testa se e representavel com 16 bits
	jnz avanca ; salta se nao for zero (se nao for representavel)
	CWDE ; converte
	mov [esi], ax ;
	add edi, type seqB
	add esi, type seqW
	dec ecx
	jmp ciclo
avanca: 
;Nao e representavel
	test eax, 80000000H
	js negativo ;salta se for negativo
;E positivo
	mov SWORD PTR [esi], 7FFFH
	add edi, type seqB
	add esi, type seqW
	dec ecx
	jmp ciclo
negativo:
;E negativo
	mov SWORD PTR [esi], 8000H
	add edi, type seqB
	add esi, type seqW
	dec ecx
	jmp ciclo

fim: invoke	ExitProcess, 0

main ENDP

end