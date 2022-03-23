%{
#include<stdio.h>
int count=0;
%}
%%
[ ] {count++;}
. ;
[\n] {printf("The count is: %d\n", count);return 1;}
. {printf("");}
%%
int main()
{
yylex();
return 0;
}