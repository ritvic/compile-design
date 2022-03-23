%{
#include<stdio.h>
int count=0;
%}
upper [A-Z]
lower [a-z]
text [a-zA-Z]
%%
{upper}+{lower}+{text}* {printf("%s\n",yytext); count ++;}
{lower}+{upper}+{text}* {printf("%s\n",yytext); count ++;}
[\n] {printf("The count is %d\n", count);return 0;}
. ;
%%
int main()
{
yylex();
return 0;
}