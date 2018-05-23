include mpcp.inc

.data

.code	

ROTINA PROC C uses EDI A:DWORD , B: DWORD
ret
ROTINA ENDP


main PROC C
	invoke ROTINA, eax, ebx
	invoke ExitProcess, 0
main ENDP

end