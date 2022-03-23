%%
[0-9]* { yylval = atoi(yytext); return NUM; }
[a-zA-Z]* { yylval = yytext[0] ; return NAME; }
[ \t] { }
\n return 0;
. return yytext[0];
%%