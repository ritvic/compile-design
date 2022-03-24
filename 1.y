%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%%
S: ID{push();} '='{push();} E{codegen_assign();};
E: E '+'{push();} E{codegen();}
|E '-'{push();} E{codegen();}
|E '*'{push();} E{codegen();}
|E '-'{push();} E{codegen();}
|NUM{push();}
|ID{push();}
;
%%
#include "lex.yy.c"
#include <string.h>
char st[100][25];
int tint=0,top=0l;
int main()
{
    printf("Enter the expression:");
    yyparse();
    return 0;
}
void push()
{
    strcpy(st[++top],yytext);
}
void codegen()
{
    char temp[2];
    temp[0]='t';
    printf("t%d = %s %s %s\n",tint,st[top-2],st[top-1],st[top]);
    top-=2;
    temp[1]=tint+'0';
    strcpy(st[top],temp);
    tint++;
}
void codegen_assign()
{
printf("%s %s %s\n",st[top-2],st[top-1],st[top]);
}