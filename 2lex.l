%{
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%

"while"                     { return WHILE; }

[a-zA-Z][a-zA-Z0-9]*        { return ID; }

[0-9]+                      { return NUM; }

"<"                         { return RELOP; }

"="                         { return ASSIGN; }

"*"                         { return MUL; }

"+"                         { return ADD; }

[(){};]                     { return yytext[0]; }

[ \t\n]+                    { /* Ignore whitespace */ }

.                           { return yytext[0]; }

%%
