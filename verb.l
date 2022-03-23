%{
#include<stdio.h>
%}
%%
[\t ]+ ;
is |
am |
are |
were |
was { printf("%s: is a verb\n", yytext); }
[a-zA-Z]+ { printf("%s: is not a verb\n", yytext); }
. { ECHO; }
\n {return 0;}
%%
int main()
{
yylex();
return 0;
}