
all: clean calculator

demo: all run

run:
	./calculator

clean:
	rm -f calculator
	rm -f lex.yy.c
	rm -f calculator.tab.c
	rm -f calculator.tab.h

calculator.tab.c calculator.tab.h: calculator.y
	bison -d calculator.y

lex.yy.c: calculator.l calculator.tab.h
	flex calculator.l

calculator: lex.yy.c
	gcc -o calculator calculator.tab.c lex.yy.c
	chmod +x calculator
