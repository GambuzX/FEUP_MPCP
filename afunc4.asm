;; Funcao 4 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.data
k BYTE 12

.code

afunc4 PROC pixels: ptr byte, largura: sdword, altura:sdword
    mov edi, pixels
	mov eax, largura
	mul altura
	mov ecx, eax
	mov al, k

	start:
	mov bl, [edi]
	add bl, al
	jc ovf1
	add [edi], al
	jmp next1

	ovf1:
	mov bl, 255
	mov [edi], bl

	next1:
	mov bl, [edi+1]
	add bl, al
	jc ovf2
	add [edi+1], al
	jmp next2

	ovf2:
	mov bl, 255
	mov [edi+1], bl

	next2:
	mov bl, [edi+2]
	add bl, al
	jc ovf3
	add [edi+2], al
	jmp fim

	ovf3:
	mov bl, 255
	mov [edi+2], bl

	fim:
	add edi, 4
	loop start

	ret
afunc4 ENDP

END