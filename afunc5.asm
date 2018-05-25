;; Funcao 5 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.data
val3 DWORD 3
val4 DWORD 4

.code

afunc5 PROC pixels: ptr byte, largura: sdword, altura:sdword
	LOCAL currentMax: BYTE, maxIndex: SDWORD
	mov edi, pixels
	mov ecx, altura

	inicio:
	push ecx
		; Percorre a linha
		push edi
		mov eax, 0
		mov currentMax, al
		mov maxIndex, eax

		mov ecx, largura
		
		insideLoop:
		mov eax, 0
		mov ebx, 0
		movzx	eax, byte ptr [edi]		;; componente B
		movzx	ebx, byte ptr [edi+1]	;; componente G
		add		eax, ebx
		movzx	ebx, byte ptr [edi+2]	;; componente R
		add		eax, ebx
		xor		edx, edx				
		div		val3					;; quociente <= 255 em al (garantido)

		.IF al > currentMax
			mov currentMax, al
			
			;guardar coluna
			mov edx, largura
			sub edx, ecx
			mov maxIndex, edx
		.ENDIF

		add edi, 4
		loop insideLoop

		pop edi ;inicio da linha
		push edi
		mov eax, maxIndex
		mul val4
		add edi, eax

		mov bl, 0
		mov [edi], bl
		mov [edi+1], bl
		mov bl, 255
		mov [edi+2], bl

		; atualizar endereco para proxima linha
		pop edi ;inicio da linha
		mov eax, largura
		mul val4
		add edi, eax

	pop ecx
	loop inicio		

	ret
afunc5 ENDP

END