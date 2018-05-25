;; Funcao 3 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.code

afunc3 PROC uses ebx pixels: ptr byte, largura: sdword, altura:sdword
	mov edi, pixels
	mov eax, largura
	mul altura
	mov ecx, eax

	start:
	push eax
	push ecx
	push edx

	mov al,[edi]; B
	mov cl,[edi+1]; G
	mov dl,[edi+2]; R
	mov [edi], dl
	mov [edi+1], al
	mov [edi+2], cl

	pop edx
	pop ecx
	pop eax

	add edi, 4
	loop start

	ret
afunc3 ENDP

END
