
default: compile

.PHONY: compile
compile:
	nasm libc.s -f elf64 -o libc.o
	gcc -Wall -Wextra -Werror -no-pie -o libc libc.o

.PHONY: run
run: compile
	./libc

