%{
#include<stdio.h>
#include<stdlib.h>
int t=0;
%}
%token NUM ID
%right '='
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
S: ID '=' E{printf("answer: t%d",t)}
E: E '+' E{printf()}
|E '-' E{}
|E '*' E{}
|E '/' E{}
|E '%' E{}
|ID
|NUM{$$}
;
%%
#include "lex.yy.c"
int main()
{
   printf("Enter the expression:");
   yyparse();
   return 0;
}
void yyerror(char* msg)
{
   puts(msg);
}