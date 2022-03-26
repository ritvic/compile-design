%{
#include<stdio.h>
#include<stdlib.h>
%}
%token FOR ID NUM LE GE
%right '='
%left LE GE '<' '>'
%left '+' '-'
%left '*' '/'
%%
S:FOR'('E1';'{lab1();}E1';'{lab2();}E1{lab3();}')'E1';'{lab4();exit(0);};
E1: E'='{push();}E{codegen_assign();}
   |E'<'{push();}E;
E : E'+'{push();}E{codegen();}
   |E'-'{push();}E{codegen();}
   |E'*'{push();}E{codegen();}
   |E'/'{push();}E{codegen();}
   |ID{push();}
   |NUM{push();}
   ;
%%
#include "lex.yy.c"
#include<string.h>
char st[100][25];
int top=0,tint=0,lno=0,i;
int main(){
printf("Enter expression:\n");
yyparse();}

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
printf("%s = %s\n",st[top-2],st[top]);
top-=2;}
void lab1(){
printf("L%d: \n",lno++);
}
void lab2(){
printf("if not %s %s %s then goto L%d\n goto L%d\n L%d:",st[top-2],st[top-1],st[top],lno,lno+1,lno+2);
lno+=2;
top-=2;
tint++;
}
void lab3(){
printf("goto L0\n L%d:",lno-1);
}

void lab4(){
printf("goto L%d\n L%d:",lno,lno-2);
}






