%{
#include<stdio.h>
int ans=0;
int n=5;
int i=1;
%}

%%
. {yymore(); printf("%s\n",yytext);}
[\n] {return 0;}
%%

int main()
{
yylex();
return 0;
}