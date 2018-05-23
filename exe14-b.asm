include mpcp.inc

;18 = 2^4 + 2

	.data
val1 DWORD 12
msg BYTE "Total sum = %d", 13,10,0

	.code
main PROC C
	xor eax, eax
	mov eax, val1
	mov ebx, eax
	sal eax, 4
	sal ebx, 1
	add eax, ebx	

invoke printf, offset msg, eax
invoke _getch
invoke	ExitProcess, 0

main ENDP

end