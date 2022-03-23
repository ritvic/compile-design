%{
#include<stdio.h>
%}

%%
[a-zA-Z ]+ ; {
yymore();
fprintf(yyout, "%s", yytext);
}
". "	; {fprintf(yyout,".\n");}
. ;
%%

int yywrap(){ return 1;
}
 
// driver code int main()
{

yyin = fopen("in3.txt", "r");

yyout = fopen("out3.txt", "w");

yylex(); return 0;
}
