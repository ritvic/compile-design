%{
#include<stdio.h>
%}
%%
[0-9]* {printf("%s is a Whole Number\n",yytext);}
[0-9]+\.[0-9]+ {printf("%s is a Decimal Number\n",yytext);}
[\n] {printf("\n");return 0;}
. {printf("");}
%%
int main()
{
yylex();
return 0;
}