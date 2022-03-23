%{
#include<stdio.h>
int countword=0,countline=0,countchar=0;
%}
%%
[ ] {countword++;}
. {countchar++;}
[\n] {countline++;countword++; }
[\n][\n] {countline++;countword++; return 0;}
%%
int main()
{
yylex();
printf("Word:%d Line:%d Char:%d",countword,countline,countchar);
return 0;
}