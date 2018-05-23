include mpcp.inc

.data

sequence BYTE "((()))"
validMsg BYTE "Valid",0
invalidMsg BYTE "Invalid",0
currentChar BYTE 'a'
itemsInStack DWORD 0

.code

main PROC C
	mov ebx, OFFSET sequence
	mov ecx, LENGTHOF sequence

checkBrackets:
	mov al, BYTE PTR [ebx]
	mov currentChar, al

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
	dec itemsInStack
	cmp al, '('
	jnz invalid
	jmp end1

	c5:
	cmp currentChar, ']'
	jnz c6
	pop eax
	dec itemsInStack
	cmp al, '['
	jnz invalid
	jmp end1

	c6:
	cmp currentChar, '}'
	jnz end1
	pop eax
	dec itemsInStack
	cmp al, '{'
	jnz invalid
	jmp end1

	pushBracket:
	push DWORD PTR currentChar
	inc itemsInStack

	end1:
	inc ebx
	loop checkBrackets

	cmp itemsInStack, 0
	jnz invalid

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