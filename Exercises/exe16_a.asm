include mpcp.inc

.data

.code
main PROC C

cmp cl, ah
jg INC

cmp al, ah
jle fim
cmp bl, bh
jle fims

INC: 
inc ecx

fim:
invoke ExitProcess,0

main ENDP

end