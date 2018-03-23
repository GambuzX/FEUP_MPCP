include mpcp.inc

	.data
val1 DWORD 12
msg BYTE "Total sum = %d", 13,10,0

	.code
main PROC C
	mov eax, val1
	mul 18

invoke printf, offset msg, edx, eax
invoke	ExitProcess, 0

main ENDP

end