include mpcp.inc

.data

sequence SBYTE 1024 DUP(-3)
msg SBYTE "Total = %d", 13, 10 ,0

.code

main PROC C
mov eax, 0
mov ebx, OFFSET sequence
mov ecx, LENGTHOF sequence

ciclo:
mov edx, 0
mov dl, BYTE PTR [ebx]
test dl, 80H ;tests the sign of the byte
jnz negativo

;positivo
add eax, edx
add ebx, TYPE sequence
loop ciclo
jmp fim

negativo:
neg dl
sub eax, edx
add ebx, TYPE sequence
loop ciclo

fim:
invoke printf, OFFSET msg, eax
invoke ExitProcess, 0

main ENDP

end