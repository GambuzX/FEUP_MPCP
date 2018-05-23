include mpcp.inc

.data
msg1 BYTE "Limiar de temperatura: %d C.",13,10,0
msg2 BYTE "Minutos acima do limiar:",0
msg3 BYTE " %d", 0,10,13
msg4 BYTE ". Total: %d minutos.",13,10,0
totalMinutes DWORD 0
limit SDWORD -17
seq SDWORD -18,-17,-15,-13,-15,-18,-19,-16,-17,-15,-14,100

.code

seek PROC lim: sdword, buf: ptr sdword
	LOCAL total: DWORD
	mov eax, 0
	mov total, eax
	mov ebx, buf
	mov edx, [ebx]

	.WHILE edx != 100
		.IF edx > lim
			inc total
			inc totalMinutes
		.ELSE
			.IF total > 0
				lea eax, OFFSET msg3
				invoke printf, offset msg3, total
			.ENDIF
		.ENDIF
		add ebx, 4
		mov edx, [ebx]
	.ENDW
	mov eax, -1
	ret
seek ENDP

main PROC C
	invoke printf, OFFSET msg1, limit
	invoke printf, OFFSET msg2
	invoke seek, limit, OFFSET seq
	invoke printf, OFFSET msg4, totalMinutes

	invoke _getch
	invoke ExitProcess,0

main ENDP

end