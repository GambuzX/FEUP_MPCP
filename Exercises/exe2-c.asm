include mpcp.inc

.data

sequence SBYTE -5,-8,-9,9,8,5,25
msg BYTE "Total sum = %d", 13,10,0

.code

main PROC C

mov eax,0
mov ebx, offset sequence
mov ecx, lengthof sequence

ciclo:
mov edx, 0
mov dl, BYTE PTR [ebx]
test dl, 80H
jnz negativo ;jumps if value is negative

;if positive
add eax, edx
add ebx, type sequence
loop ciclo
jmp verifySize

negativo:
neg dl ;switches signal
sub eax, edx
add ebx, type sequence
loop ciclo

verifySize:
test eax, 0FFFF0000H
jnz isDWord ; ends if value needs 4 bytes
test eax, 0FF00H
jnz isWord
invoke printf, offset msg, al
jmp fim

isDWord: 
invoke printf, offset msg, eax

isWord: 
invoke printf, offset msg, ax

fim: invoke ExitProcess, 0

main ENDP

end