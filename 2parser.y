%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token WHILE ID NUM RELOP ASSIGN MUL ADD

%%

program : WHILE '(' condition ')' '{' stmt_list '}'
        ;

condition : expr RELOP expr
          ;

stmt_list : stmt_list stmt
          | stmt
          ;

stmt : ID ASSIGN expr ';'
     ;

expr : expr ADD term
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
    if (yyparse() == 0)
        printf("Syntax is correct!\n");

    return 0;
}
