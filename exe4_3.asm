include mpcp.inc

.data

sequence BYTE "abcd"
msg BYTE "%c",0
potato BYTE 0

.code

main PROC C
	mov ebx, OFFSET sequence
	mov ecx, LENGTHOF sequence

pushValues:
	push ebx ;push the address
	inc ebx
	loop pushValues

	mov potato, BYTE PTR LENGTHOF sequence
printValues:
	cmp potato, 0
	jz fim
	pop edx
	mov bl, BYTE PTR [edx]
	invoke printf, OFFSET msg, bl
	dec potato
	jmp printValues

	fim:
	invoke _getch
	invoke ExitProcess,0

main ENDP

end