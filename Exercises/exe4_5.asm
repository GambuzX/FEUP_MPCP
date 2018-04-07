include mpcp.inc

.data
dwordValue DWORD 56115699
msg BYTE "%d",0
nElementos BYTE 0

.code

main PROC C
mov ebx, OFFSET dwordValue
mov eax, [ebx]

divideByTwoAndPushValues:
cmp eax, 0
jz printSequence
;mov eax, [ebx]
mov edx, 0
mov ecx, 2
div ecx  ; quociente no eax, resto no edx
;mov [ebx], eax  ;updates dwordValue
cmp edx, 0
jnz addOne
push 0
inc nElementos
jmp divideByTwoAndPushValues

addOne:
push 1
inc nElementos
jmp divideByTwoAndPushValues

printSequence:
cmp nElementos,0
jz fim
pop ebx
dec nElementos
invoke printf, OFFSET msg, ebx
jmp printSequence

fim:
invoke _getch
invoke ExitProcess,0

main ENDP
end