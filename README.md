# flex-bison-demo
basic flex and bison parser demo

## example run

``` bash
make demo
rm -f calculator lex.yy.c calculator.tab.c calculator.tab.h
bison -d calculator.y
flex calculator.l
gcc -o calculator calculator.tab.c lex.yy.c
chmod +x calculator
./calculator
((9 + 5) * 2) - 1
27
exit
exiting
```
