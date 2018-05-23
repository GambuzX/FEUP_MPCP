include mpcp.inc

.data
inP WORD 0,0,0,0,1,1,2,3,4,5,6,7,7,8
outP WORD 1,1,1,2,2,2,3,4,5,6,6,6,8,9,10
msg BYTE "%d",0,10,13

.code

nviaturas PROTO tin: PTR WORD, tout: PTR WORD, N: WORD, M: WORD

main PROC C
	invoke nviaturas, OFFSET inP, OFFSET outP, LENGTHOF inP, 1
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess,0
main ENDP

nviaturas PROC tin: PTR WORD, tout: PTR WORD, N: WORD, M: WORD	
	LOCAL count: DWORD
	mov eax, 0
	mov count, eax
	xor ecx, ecx
	mov cx, N
	mov ebx, tin

	.WHILE ecx > 0
		mov dx, WORD PTR [ebx]
		.IF M > dx
			inc count
		.ENDIF
		add ebx, 2
		dec ecx
	.ENDW

	xor ecx, ecx
	mov cx, N
	mov ebx, tout

	.WHILE ecx > 0
		mov dx, WORD PTR [ebx]
		.IF M > dx
			dec count
		.ENDIF
		add ebx, 2
		dec ecx
	.ENDW

	mov eax, count
	ret
nviaturas ENDP

coerente PROC tin: PTR WORD, tout: PTR WORD, N: DWORD
	mov esi, tin
	mov edi, tout
	mov ecx, N

compare:
	cmpsw
	ja fim
	loop compare
	xor eax, eax
	ret

fim:
	mov eax, 1
	ret
coerent ENDP

end