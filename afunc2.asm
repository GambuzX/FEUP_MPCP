;; Funcao 2 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.code

afunc2 PROC uses ebx edi pixels: ptr byte, largura: sdword, altura:sdword
	mov edi, pixels
	mov eax, largura
	mul altura
	mov ecx, eax

	start:
	mov ebx, 0
	mov [edi], bl
	add edi,4
	loop start

	ret
afunc2 ENDP

END
