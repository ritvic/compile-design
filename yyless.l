%{
#include<stdio.h>
int ans=0;
int n=5;
int i=1;
%}

%%
a+ {ans++;if(yyleng > n)yyless(n);printf("partition%d: %s\n",i,yytext);i++;}
b+ {ans++;if(yyleng > n)yyless(n);printf("partition%d: %s\n",i,yytext);i++;}
. ;
[\n] {printf("total number of partitions: %d\n",ans);return 0;}
%%

int main()
{
    printf("input string: ");
yylex();
return 0;
}