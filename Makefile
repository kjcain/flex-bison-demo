
.PHONY: all

calculator.tab.c calculator.tab.h: calculator.y
	bison -d calculator.y

lex.yy.c: calculator.l calculator.tab.h
	flex calculator.l

calculator: lex.yy.c
	gcc -o calculator calculator.tab.c lex.yy.c

all: calculator