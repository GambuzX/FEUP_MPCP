;; Funcao 1 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.data
	val3 DWORD 3

.code
;; esta função converte imagens de cor para níveis de cinzento:

afunc1 PROC USES edi ebx pixels: ptr byte, largura: dword, altura:dword

	mov		eax,largura
	mul		altura		; EAX = número de pixels
	jo		fim			; resultado não cabe em 32 bits
	; EDX = 0 (garantido)
	mov		ecx, eax

	mov		edi, pixels
	.WHILE (ecx > 0)					;; poderia usar "loop"
		movzx	eax, byte ptr [edi]		;; componente B
		movzx	ebx, byte ptr [edi+1]	;; componente G
		add		eax, ebx
		movzx	ebx, byte ptr [edi+2]	;; componente R
		add		eax, ebx
		xor		edx, edx				
		div		val3					;; quociente <= 255 (garantido)
		
		mov		[edi], al
		mov		[edi+1], al
		mov		[edi+2], al
		mov     byte ptr [edi+3], 255
		add		edi, 4
		dec		ecx
	.ENDW

fim:
	ret
afunc1 ENDP

END
