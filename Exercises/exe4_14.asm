include mpcp.inc

.data
msg BYTE "The max number is %d", 0, 10, 13
sequence DWORD 1,240,3,4,5,6,7,12,8,27

.code

maxnum PROC SEQ: PTR DWORD, N:DWORD

	cmp N, 0
	jz endMaxNum
	mov edx, N
	mov ebx, SEQ ; stores address in a register
	mov ecx, [ebx] ; stores current value
	cmp eax, ecx
	jg recursion
	mov eax, ecx ; if greater

	recursion:
	add ebx, 4
	dec edx
	invoke maxnum, ebx, edx

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