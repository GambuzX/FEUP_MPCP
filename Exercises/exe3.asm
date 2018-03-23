include mpcp.inc

.data

sequence BYTE 8,7,6,5,9
msg BYTE "Boolean value = %d", 13,10,0

.code

main PROC C

mov eax, 1 ;Assumo que esta por ordem
mov ebx, offset sequence
mov ecx, lengthof sequence
dec ecx ;decrement because the program will stop on the penultimate value

ciclo:
mov dl, BYTE PTR [ebx]
mov dh, BYTE PTR [ebx+1]
cmp dl, dh
jg altera ;se o primeiro for maior salta
add ebx, type sequence
loop ciclo
jmp fim

altera:
mov eax , 0

fim:
invoke printf, offset msg, eax
invoke ExitProcess, 0

main ENDP

end