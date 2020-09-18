
default: compile

.PHONY: compile
compile:
	nasm hello.s -f elf64 -o hello.o && ld hello.o -o hello

.PHONY: run
run: compile
	./hello

