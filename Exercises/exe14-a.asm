include mpcp.inc

	.data
val1 DWORD 240
val2 DWORD 18
msg BYTE "Total sum = %d%d", 13,10,0

	.code
main PROC C
	mov eax, val1
	mul val2

	invoke printf, offset msg, edx,eax
	invoke _getch
	invoke	ExitProcess, 0

main ENDP

end