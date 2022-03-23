%{
#include<stdio.h>
int ans=0;
%}

%%
"/*" {
        int c;
        for ( ; ; )
        {
            while ( (c = input()) != '*' && c != EOF );    

            if ( c == '*' )
                {
                while ( (c = input()) == '*' );
                if ( c == '/' )
                    break;    /* the end of comment*/
                }                
        }
     }
. {ans+=yyleng;fprintf(yyout,"%s",yytext);}

<<EOF>> {printf("total number of characters: %d\n",ans); return 0;}

%%              

int main()
{
    yyin=fopen("input.cpp","r");
    yyout = fopen("output.cpp","w+");
    yylex();
    return 0;
} 
