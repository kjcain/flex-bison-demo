%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
	int ival;
}

%token<ival> T_INT
%token T_PLUS T_MINUS T_MULTIPLY T_DIVIDE T_L_PAREN T_R_PAREN
%token T_EOL T_EXIT

%left T_PLUS T_MINUS
%left T_MULTIPLY T_DIVIDE

%type<ival> expression

%start equation

%%

equation:
	   | equation line
;

line: T_EOL
    | expression T_EOL { printf("%i\n", $1); }
    | T_EXIT T_EOL { printf("exiting\n"); exit(0); }
;

expression: T_INT							{ $$ = $1; }
	  | expression T_PLUS expression		{ $$ = $1 + $3; }
	  | expression T_MINUS expression		{ $$ = $1 - $3; }
	  | expression T_MULTIPLY expression	{ $$ = $1 * $3; }
	  | expression T_DIVIDE expression		{ $$ = $1 / $3; }
	  | T_L_PAREN expression T_R_PAREN		{ $$ = $2; }
;

%%

int main() {
	yyin = stdin;

	do {
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse Error: %s\n", s);
}
