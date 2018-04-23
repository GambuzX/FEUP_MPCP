include mpcp.inc

.data
msg BYTE "The most frequent value is %d", 0, 10, 13
sequence SWORD 12,12,12,1,1,5,5,5,5,5,5,5,5,5,1,12,5,6,12,1,1,1,1

.code

maxfreq PROC seq: PTR SWORD, n: DWORD
	LOCAL Maxfreq: WORD, currentFreq: WORD, currentVal: SWORD
	mov ebx, seq
	mov ecx, n
	xor eax, eax
	mov Maxfreq, ax
	
	.WHILE ecx > 0
		mov dx, [ebx]
		mov currentVal, dx
		push ecx
		push bx

		mov ecx,0
		mov currentFreq, cx
		mov ecx, n
		mov ebx, seq
		.WHILE ecx > 0
			mov dx, [ebx] 
			.IF dx == currentVal
				inc currentFreq
			.ENDIF
			add bx, 2
			dec ecx
		.ENDW

		mov cx, currentFreq
		.IF cx > Maxfreq
			mov Maxfreq, cx
			mov ax, currentVal
		.ENDIF

		pop bx
		pop ecx
		add bx, 2
		dec ecx
	.ENDW
	ret

maxfreq ENDP

main PROC C
	invoke maxfreq, OFFSET sequence, LENGTHOF sequence
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess, 0

main ENDP

end