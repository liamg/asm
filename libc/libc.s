section .rodata
    format:    db 'hello, %s', 0xa, 0
    name:      db 'liam'

section .text
	global main
	extern printf
    main:
        ; printf(format, name)
        mov rdi, format
        mov rsi, name
	mov rax, 0
        call printf
	; return 0
        mov rax, 0
        ret

