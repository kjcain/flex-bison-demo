# flex-bison-demo
basic flex and bison parser demo

## explanation

### flex

- "fast" lexical analyzer generator
- creates a 'lexer', 'tokenizer', or 'scanner'

### bison

- parser generator
- creates a parser for a series of tokens (ie. those emitted by flex)
- generates a LALR(1) parser by default (look ahead 1, left to right)

## dependencies

`sudo apt-get -y install flex bison`

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
