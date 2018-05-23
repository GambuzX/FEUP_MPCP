include mpcp.inc

.data
	msg BYTE "Result = %d", 0, 10 ,13
	coeficients SWORD 3,2,1
	xValue SWORD 3

.code
poly2 PROTO coefs: PTR SWORD, x: SWORD

main PROC C
	invoke poly2, OFFSET coeficients, xValue
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess,0
main ENDP

poly2 PROC coefs: PTR SWORD, x: SWORD
	LOCAL c1: SWORD, c2: SWORD, c0: SWORD
	
	mov ebx, coefs
	mov cx, [ebx]
	mov c2, cx
	mov cx, [ebx+2]
	mov c1, cx
	mov cx, [ebx+4]
	mov c0, cx
	
	mov eax, 0
	mov ax, c2
	mul x
	mul x

	mov bx, ax ;store previous multiplication

	mov eax, 0
	mov ax, c1
	mul x

	add ax, bx
	add ax, c0
	ret	
poly2 ENDP

end