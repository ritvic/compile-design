%%
[A-Za-z]+ {yylval=yytext[0];return ID;}
[0-9]+ {yylval=atoi(yytext);return NUM;}
[ \t\n] yyterminate();
. return yytext[0];
%%
void yyerror(char *msg){
puts(msg);
}