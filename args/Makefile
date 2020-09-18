
default: compile

.PHONY: compile
compile:
	nasm args.s -f elf64 -o args.o && ld args.o -o args

.PHONY: run
run: compile
	./args


