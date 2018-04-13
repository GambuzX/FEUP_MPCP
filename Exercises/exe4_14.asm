include mpcp.inc

.data
msg BYTE "The max number is %d", 0, 10, 13
sequence DWORD 1,2,3,4,5,6,7,12,8

.code

maxnum PROC SEQ: PTR DWORD, N:DWORD
	LOCAL Address: PTR DWORD, tempN:DWORD
	mov Address, SEQ
	mov tempN, N

	cmp N, 0
	jz endMaxNum
	mov ecx, [SEQ]
	cmp eax, ecx
	jg recursion
	mov eax, DWORD PTR [SEQ] ; if greater

	recursion:
	dec tempN
	add Address, 4
	invoke maxnum, Address, tempN

	endMaxNum:
	ret

maxnum ENDP

main PROC C
	mov eax, 0
	invoke maxnum, OFFSET sequence, LENGTHOF sequence
	mov eax, OFFSET sequence
	mov ebx, [eax]
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess, 0

main ENDP

end