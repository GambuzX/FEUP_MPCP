.686
.model flat, C

.data

val2 SDWORD 2
val3 SDWORD 3
val4 SDWORD 4

.code

horizontalReflection PROC USES esi ebp pixels: ptr byte, largura: sdword, altura:sdword
	LOCAL larguraBytes: SDWORD, metadeAltura: SDWORD, ediInicial: SDWORD
	mov edi, pixels
	mov ecx, largura

	mov eax, largura
	mul val4
	mov larguraBytes, eax
	
	mov eax, altura
	xor edx, edx
	div val2
	mov metadeAltura, eax ;calcula metade da altura

	inicio:
	push ecx
	push edi
		
		mov ecx, 0
		mov ediInicial, edi

		percorreLinhas:
		cmp ecx, metadeAltura
		jz next

		;calcular endereco a contar do fim
		mov ebx, altura
		dec ebx ;indice comeca em 0
		sub ebx, ecx ; calcula linha a contar do fim
		mov eax, larguraBytes
		mul ebx ; eax fica com offset da linha
		mov ebx, ediInicial ;copia valor do endereco da primeira linha
		add ebx, eax ; ebx fica com endereco da linha a contar do fim

		;inverter valores
		mov eax, [edi]
		mov esi, [ebx]
		mov [edi],esi
		mov [ebx], eax

		add edi, larguraBytes
		inc ecx
		jmp percorreLinhas

		next:

	pop edi
	add edi, val4
	pop ecx
	loop inicio

	ret
horizontalReflection ENDP

end