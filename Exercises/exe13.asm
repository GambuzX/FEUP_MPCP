include mpcp.inc

.data
val1 WORD 4
val2 WORD 3

.code

main PROC C
xor eax, eax
mov ax, val1
mul val2
sal dx, 16
or eax,edx

invoke	ExitProcess, 0

main ENDP

end