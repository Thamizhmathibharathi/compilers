%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token FOR ID NUM RELOP ASSIGN INC DEC
%token ADD SUB MUL

%%

program : FOR '(' init ';' condition ';' update ')'
          '{' stmt_list '}'
        ;

init : ID ASSIGN expr
     ;

condition : expr RELOP expr
          ;

update : ID INC
       | ID DEC
       | ID ASSIGN expr
       ;

stmt_list : stmt_list stmt
          | stmt
          ;

stmt : ID ASSIGN expr ';'
     ;

expr : expr ADD term
     | expr SUB term
     | term
     ;

term : term MUL factor
     | factor
     ;

factor : ID
       | NUM
       | '(' expr ')'
       ;

%%

void yyerror(const char *s)
{
    printf("Syntax Error: %s\n", s);
}

int main()
{
    printf("Enter a for loop:\n");

    if (yyparse() == 0)
        printf("Syntax is correct!\n");

    return 0;
}


