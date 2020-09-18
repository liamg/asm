
default: compile

.PHONY: compile
compile:
	nasm http.s -f elf64 -o http.o && ld http.o -o http

.PHONY: run
run: compile
	./http

.PHONY: clean
clean:
	rm http http.o

