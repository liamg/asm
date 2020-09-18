section .rodata
    usage_str:    db 'Usage: args [url]', 0
    newline: db 0xa

section .text
	global _start
_start:
	; check 1 arg is passed
	pop rsi ; argc
	cmp rsi, 2 ; 1 = ./args 2 = argv[1]
	jne usage

	pop rsi; pop program name

	; next stack item is argv[1]
	call println

	; exit(0)
	push 0
	call exit
    ret

    println:
	mov rsi, [rsp+8]
	push rsi
	call print
	push newline
	call print
    ret

    print: ; print a message to terminal - push the message first
	mov ecx, 0 ; set counter to 0
	mov rsi, [rsp+8] ; read string arg
	mov r8, rsi ; backup string arg
	.repeat: ; loop to calc string length
    	lodsb                   ; byte in AL
    	test   al,al            ; check if zero
    	jz     .done            ; if zero then we're done
    	inc    ecx              ; increment counter
    	jmp    .repeat          ; repeat until zero
	.done:
	mov edx, ecx ; string length
	mov rsi, r8 ; string arg
	mov rdi, 1 ; stdout
	mov rax, 1 ; syscall: write
	syscall

	; backup up return addr, throw away stack val, and restore
	pop rsi
	pop rcx
	push rsi
    ret

    exit:
        ; exit(code)
        mov rdi, [rsp+8]
        mov rax, 60
        syscall

    usage:
	push usage_str
	call println

	; exit(1)
	push 1
	call exit
    ret
    	
