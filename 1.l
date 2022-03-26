alpha [a-zA-Z]
digit [0-9]
%%
{alpha}+ {return ID;}
{digit}+ {yylval=atoi(yytext);return NUM;}
[\n\t] yyterminate();
. return yytext[0];
%%
void yyerror(char* msg)
{
    puts(msg);
}