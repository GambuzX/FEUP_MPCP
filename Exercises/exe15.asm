include mpcp.inc

.data

sequence SDWORD 1,2,3,4,5,6,12
.code

recinv PROTO SEQ: PTR SDWORD, N: DWORD

main PROC C
	invoke recinv, OFFSET sequence, LENGTHOF sequence
	invoke _getch
	invoke ExitProcess,0
main ENDP

recinv PROC SEQ: PTR SDWORD, N: DWORD
	; Magic happens
	mov ecx, N
	mov ebx, SEQ
	cmp N, 0
	jz popStuff
	push [ebx]
	dec ecx
	add ebx, TYPEOF sequence

	invoke recinv, ebx, ecx

popStuff:
	mov ecx, 

recinv ENDP


end