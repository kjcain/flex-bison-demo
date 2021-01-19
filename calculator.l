%option noyywrap

%{
#include "calculator.tab.h"
%}

whitespace [ \t]+
digit [0-9]
integer {digit}+

%%

{whitespace}    { } // ignore whitespace

{integer}       { yylval.ival=atoi(yytext); return T_INT; }

"+"             { return T_PLUS; }
"-"             { return T_MINUS; }
"*"             { return T_MULTIPLY; }
"/"             { return T_DIVIDE; }
"("             { return T_L_PAREN; }
")"             { return T_R_PAREN; }
"\n"            { return T_EOL; }
"exit"          { return T_EXIT; }
