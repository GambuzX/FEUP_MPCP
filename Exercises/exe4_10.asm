include mpcp.inc

.data
	sequence DWORD 9,8,7,54,4,2,8,6,12

.code
ordena PROTO seq: PTR DWORD, n: DWORD

main PROC C
	invoke ordena, OFFSET sequence, LENGTHOF sequence
	invoke _getch
	invoke ExitProcess, 0
main ENDP

ordena PROC	seq: PTR DWORD, n: DWORD
	LOCAL seqSize: DWORD
	mov eax, n
	mov seqSize, eax

	mov ebx, seq

	.WHILE seqSize > 1 ;stops before last element
		mov ecx, [ebx] ;store current value
		mov edx, [ebx+4] ; next element
		.IF ecx > edx ;switch elements
			mov [ebx], edx
			mov [ebx+4], ecx
		.ENDIF
		add ebx, 4
		dec seqSize
	.ENDW

	.IF n > 1
		dec n
		invoke ordena, seq, n
	.ENDIF
	ret
ordena ENDP

end