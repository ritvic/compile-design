%{
#include<stdio.h>
int count=0;
%}
%%
[a-zA-Z] ;
. {count++; printf("%s",yytext);}
[\n] {printf("Count is %d\n", count);return 0;}
. {printf("");}
%%
int main()
{
yylex();
return 0;
}