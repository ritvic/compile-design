%{
#include<stdio.h>
int count=0;
%}
vowel [aeiouAEIOU]
cons [^aeiouAEIOU \n\t]
text [a-zA-Z]
%%
{cons}*{vowel}{cons}*{vowel}{text}* {count ++; printf("%s\n",yytext);}
[\n] {printf("Count is %d\n", count); return 1;}
. ;
%%
int main()
{
yylex();
return 0;
}