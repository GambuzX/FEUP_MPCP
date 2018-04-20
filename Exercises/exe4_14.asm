include mpcp.inc

.data
msg BYTE "The max number is %d", 0, 10, 13
sequence DWORD 1,240,3,4,5,6,7999,12,8,27

.code

maxnum PROC SEQ: PTR DWORD, N:DWORD
	LOCAL valor: DWORD
	mov ebx, SEQ
	mov ecx, N

	cmp N, 1
	jz casoBase

	;Se nao caso base
	mov edx, [ebx] ;guarda valor atual
	mov valor, edx
	add ebx, 4
	dec ecx
	invoke maxnum, ebx, ecx ;eax has max value
	.IF valor > eax
		mov eax, valor
	.ENDIF
	jmp endMaxNum

	casoBase:
	mov eax, [ebx]

	endMaxNum:
	ret

maxnum ENDP

main PROC C
	mov eax, 0
	invoke maxnum, OFFSET sequence, LENGTHOF sequence
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess, 0

main ENDP

end