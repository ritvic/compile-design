%{
#include <stdio.h>
#include <stdlib.h>
%}
%token ID NUM WHILE LE GE EQ NE OR AND
%right '='
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'
%%
S         : ST {printf("Input accepted\n"); exit(0);}
	;
ST       : WHILE '(' E2 ')' DEF
           ;
DEF    : '{' BODY '}'
           | E';'
           | ST
           |
           ;
BODY  : BODY BODY
           | E ';'
           | ST
           |
           ;
E        : ID '=' E
          | E '+' E
          | E '-' E
          | E '*' E
          | E '/' E
          | E '<' E
          | E '>' E
          | E LE E
          | E GE E
          | E EQ E
          | E NE E
          | E OR E
          | E AND E
          | E '+' '+'
          | E '-' '-'
          | ID
          | NUM
          ;
E2     : E'<'E
         | E'>'E
         | E LE E
         | E GE E
         | E EQ E
         | E NE E
         | E OR E
         | E AND E
         ;
%%
#include "lex.yy.c"
int main() {
    printf("Enter the expression:\n");
    yyparse();
}