%{
#include<stdio.h> #include<string.h>
%}
%%
"//" { int c;
while((c = input()) != '\n');
}
. {fprintf(yyout, "%s",yytext);}
%%
int yywrap(){ return 1;} int main(){
yyin = fopen("in4.c", "r");
yyout = fopen("out4.c", "w"); yylex();
return 0;
}
