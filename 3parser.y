%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);

int temp_count = 0;
int label_count = 0;

char *loop_start;
char *loop_end;

char *newtemp()
{
    char *s = malloc(20);
    sprintf(s, "t%d", ++temp_count);
    return s;
}

char *newlabel()
{
    char *s = malloc(20);
    sprintf(s, "L%d", ++label_count);
    return s;
}
%}

%union {
    char *str;
}

%token WHILE ASSIGN MUL ADD
%token <str> ID NUM RELOP

%type <str> expr term factor condition

%%

program : WHILE '('
          {
              loop_start = newlabel();
              printf("%s:\n", loop_start);
          }
          condition ')'
          {
              loop_end = newlabel();
              printf("ifFalse %s goto %s\n", $4, loop_end);
          }
          '{' stmt_list '}'
          {
              printf("goto %s\n", loop_start);
              printf("%s:\n", loop_end);
          }
        ;

condition : expr RELOP expr
            {
                char *t = newtemp();
                printf("%s = %s %s %s\n", t, $1, $2, $3);
                $$ = t;
            }
          ;

stmt_list : stmt_list stmt
          | stmt
          ;

stmt : ID ASSIGN expr ';'
       {
           printf("%s = %s\n", $1, $3);
       }
     ;

expr : expr ADD term
       {
           char *t = newtemp();
           printf("%s = %s + %s\n", t, $1, $3);
           $$ = t;
       }
     | term
       {
           $$ = $1;
       }
     ;

term : term MUL factor
       {
           char *t = newtemp();
           printf("%s = %s * %s\n", t, $1, $3);
           $$ = t;
       }
     | factor
       {
           $$ = $1;
       }
     ;

factor : ID
         {
             $$ = $1;
         }
       | NUM
         {
             $$ = $1;
         }
       | '(' expr ')'
         {
             $$ = $2;
         }
       ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main()
{
    printf("Three Address Code:\n");

    if (yyparse() == 0)
        printf("Code generation completed.\n");

    return 0;
}
