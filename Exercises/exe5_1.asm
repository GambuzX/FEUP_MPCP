include mpcp.inc
.xmm

.data
msg BYTE "Results = %f, %f", 13,10,0

B REAL8 7.8
M REAL8 3.6
N REAL8 7.1
P REAL8 ?

W DWORD 7
X REAL8 7.1
Y REAL8 ?

.code

main PROC C
	movsd xmm0, N
	addsd xmm0, B
	mulsd xmm0, M
	mov ebx, -1
	cvtsi2sd xmm1, ebx
	mulsd xmm0, xmm1
	movsd P, xmm0

	movsd xmm0, X
	sqrtsd xmm0, xmm0
	cvtsi2sd xmm1, W
	addsd xmm0, xmm1
	movsd Y, xmm0

	invoke printf, OFFSET msg, P, Y
	invoke _getch
	invoke ExitProcess,0

main ENDP

end