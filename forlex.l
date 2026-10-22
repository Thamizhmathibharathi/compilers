%{
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%

"for"                       { return FOR; }

"++"                        { return INC; }
"--"                        { return DEC; }

"<="|">="|"=="|"!="|"<"|">" { return RELOP; }

[a-zA-Z][a-zA-Z0-9]*        { return ID; }

[0-9]+                      { return NUM; }

"="                         { return ASSIGN; }

"+"                         { return ADD; }
"-"                         { return SUB; }
"*"                         { return MUL; }

[(){};]                     { return yytext[0]; }

[ \t\n]+                    { /* Ignore whitespace */ }

.                           { return yytext[0]; }

%%


