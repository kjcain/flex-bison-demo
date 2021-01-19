# flex-bison-demo
basic flex and bison parser demo

## example run

``` bash
make demo
rm -f calculator
rm -f lex.yy.c
rm -f calculator.tab.c
rm -f calculator.tab.h
bison -d calculator.y
flex calculator.l
gcc -o calculator calculator.tab.c lex.yy.c
chmod +x calculator
./calculator
(9 * 9)
81
exit
exiting
```
