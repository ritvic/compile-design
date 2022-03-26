%%
for return FOR;
[A-Za-z]+ return ID;
[0-9]+ return NUM;
"<=" return LE;
">=" return GE;
. return yytext[0];
%%
void yyerror(char *msg){
puts(msg);}
