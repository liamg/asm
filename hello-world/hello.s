section .rodata
    msg:    db 'hello, world', 10
    msglen: equ $-msg

section .text
    global _start
    _start:
        ; write(1, msg, msglen)
        mov rdi, 1
        mov rsi, msg
        mov rdx, msglen
        mov rax, 1
        syscall
        ; exit(0)
        mov rdi, 0
        mov rax, 60
        syscall
