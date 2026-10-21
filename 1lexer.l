%{
#include <stdio.h>
%}

%option noyywrap

%%

"while"                     { printf("WHILE       %s\n", yytext); }

[a-zA-Z][a-zA-Z0-9]*        { printf("ID          %s\n", yytext); }

[0-9]+                      { printf("NUM         %s\n", yytext); }

"<"                         { printf("RELOP       %s\n", yytext); }

"="                         { printf("ASSIGN      %s\n", yytext); }

"*"                         { printf("MUL         %s\n", yytext); }

"+"                         { printf("ADD         %s\n", yytext); }

[(){};]                     { printf("SPECIAL     %s\n", yytext); }

[ \t\n]+                    { /* Ignore spaces, tabs and newlines */ }

.                           { printf("UNKNOWN     %s\n", yytext); }

%%

int main()
{
    printf("Enter the source program:\n");
    yylex();
    return 0;
}
