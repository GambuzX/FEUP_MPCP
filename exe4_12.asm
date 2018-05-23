include mpcp.inc

.data
outmsg byte "%d" ,13 ,10 ,0

.code

rotina proc
	push 21 ; *
	call double
	add eax , 5
	invoke printf , offset outmsg , eax
	ret ; +
rotina endp

double proc
	mov eax , [ esp +4] ; +
	add eax , eax
	ret 4 ; + *
double endp

main PROC C
	call rotina ; + *
	invoke _getch
	invoke ExitProcess, 0

main ENDP

end