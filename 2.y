%{
#include<stdio.h>
#include<stdlib.h>
%}
%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%%
S : ID{push();}'='{push();}E{codegen_assign();};
E : E'+'{push();}E{codegen();}
   |E'-'{push();}E{codegen();}
   |E'*'{push();}E{codegen();}
   |E'/'{push();}E{codegen();}
   |ID{push();}
   |NUM{push();}
   ;
%%
#include "lex.yy.c"
#include <string.h>
int tint=0;
char st[100][25],top=0;
int main(){
printf("Enter Expression:\n");
yyparse();
return 0;
}
void push(){
strcpy(st[++top],yytext);
}
void codegen(){
char temp[2];
temp[0]='t';
printf("t%d = %s %s %s\n",tint,st[top-2],st[top-1],st[top]);
top-=2;
temp[1]=tint+'0';
strcpy(st[top],temp);
tint++;
}
void codegen_assign(){
printf("%s %s %s\n",st[top-2],st[top-1],st[top]);
top-=2;}