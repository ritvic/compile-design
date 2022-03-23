%{
#include<stdio.h>
%}

%%
[A-Z][a-z]+ ; {
yyless(1);
fprintf(yyout, "%s", yytext);
}
.   ;
%%

int yywrap(){ return 1;
}

int main()
{

yyin = fopen("input.txt", "r");

yyout = fopen("out.txt", "w");

yylex(); return 0;
}
