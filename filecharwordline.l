%{
#include<stdio.h>
int countword=0,countline=0,countchar=0;
%}

%%
[ ] {countword++;}
. {countchar++;}
[\n] {countline++,countword++; }
<<EOF>> {countline++,countword++;return 0;}
%%

int main()
{
FILE* fp;
fp = fopen("input.txt","r");
yyin=fp;
yylex();
printf("No. of characters: %d \nNo. of words: %d \nNo. of lines: %d\n",countchar,countword,countline);
return 0;
}
