%{
#include<stdio.h>
int count=0;
%}
%%
[a-jl-z]+[kK]+[a-z]* ;
[A-JL-Z]+[kK]+[a-z]* ;
[kK][a-zA-Z0-9]* {count++;printf("%d: %s",count, yytext);}
[\n] { printf("The count is %d\n",count);return 0;}
. ;
%%
int main()
{

yylex();
return 0;
}