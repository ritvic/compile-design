%{
#include<stdio.h>
%}

%%
[ \n\t]+ {fprintf(yyout, "");}
.	{ fprintf(yyout, "%s", yytext); }
%%

int yywrap(){ return 1;
}

// driver code int main()
{

yyin = fopen("Input.txt", "r");

/* yyout points to the file output.txt and opens it in write mode*/
yyout = fopen("Output.txt", "w");

yylex(); return 0;
 
}
