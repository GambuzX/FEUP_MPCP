include mpcp.inc
.xmm

.data
msg BYTE "Distance to origin: %f",13,10,0
val1 REAL8 3.0
val2 REAL8 4.0
result REAL8 ?

.code

dist PROTO x: REAL8, y: REAL8, ptrD: PTR REAL8

main PROC C
	invoke dist, val1, val2, offset result
	invoke printf, offset msg, result

	invoke _getch
	invoke ExitProcess,0

main ENDP

dist PROC x: REAL8, y: REAL8, ptrD: PTR REAL8
	movsd xmm0, x
	mulsd xmm0,xmm0
	movsd xmm1, y
	mulsd xmm1,xmm1
	addsd xmm0,xmm1
	sqrtsd xmm0,xmm0

	mov eax, ptrD
	movsd REAL8 PTR [eax], xmm0
	ret
dist endP

end