.686
.model flat, C

.data
linha SDWORD 12
coluna SDWORD 12

.code

findPixel PROC pixels: ptr byte, largura: sdword, altura:sdword
	mov edi, pixels
	mov eax, largura
	mul altura
	mov ecx, eax ;n pixels

	;.IF (coluna >= largura) || (linha >= altura)
		; Invalido!
	;.ENDIF

	mov eax, largura
	mov ebx, linha
	.IF ebx > 0
		dec ebx
	.ENDIF
	mul ebx
	add eax, coluna
	mov ebx, 4
	mul ebx

	add edi, eax

	mov bl, 0
	mov [edi], bl
	mov [edi+1], bl
	mov bl, 255
	mov [edi+2], bl

	ret
findPixel ENDP

END