include mpcp.inc
.xmm

.data
msg BYTE "A area de um circulo de raio %f e %f", 13,10,0

PI real8 3.1415926535897932
raio real8 12.0
result real8 ?

.code

main PROC C
	movsd xmm0, raio
	mulsd xmm0, xmm0
	mulsd xmm0, PI
	movsd result, xmm0

	invoke printf, OFFSET msg, raio, result
	invoke _getch
	invoke ExitProcess,0

main ENDP

end