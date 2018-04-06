include mpcp.inc

.data

sequence BYTE "(abc)"
validMsg BYTE "Valid",0
invalidMsg BYTE "Invalid",0
currentChar BYTE 'a'

.code

main PROC C
	mov ebx, OFFSET sequence
	mov ecx, LENGTHOF sequence

checkBrackets:
	mov currentChar, BYTE PTR [ebx]

	cmp currentChar, '('
	jz pushBracket ; if same char

	c2:
	cmp currentChar, '['
	jz pushBracket

	c3:
	cmp currentChar, '{'
	jz pushBracket

	c4:
	cmp currentChar, ')'
	jnz c5
	pop eax
	cmp eax, '('
	jnz invalid
	jmp end1

	c5:
	cmp currentChar, ']'
	jnz c6
	pop eax
	cmp eax, '['
	jnz invalid
	jmp end1

	c6:
	cmp currentChar, '}'
	jnz c6
	pop eax
	cmp eax, '{'
	jnz invalid
	jmp end1

	pushBracket:
	push DWORD PTR currentChar

	end1:
	inc ebx
	dec ecx
	loop checkBrackets

	valid:
	invoke printf, OFFSET validMsg
	jmp fim

	invalid:
	invoke printf, OFFSET invalidMsg

	fim:
	invoke _getch
	invoke ExitProcess,0

main ENDP

end