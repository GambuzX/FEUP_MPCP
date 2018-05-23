include mpcp.inc

.data

.code
main PROC C

cmp cl, ah
jng fim

cmp al, ah
jg DEC
cmp bl, bh
jng fim

DEC: 
dec ecx

fim:
invoke ExitProcess,0

main ENDP

end