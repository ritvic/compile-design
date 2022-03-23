%{


%}
%s START
%s ARG
%s BODY
%%
<INITIAL>"int " {BEGIN START;}
<INITIAL>. {fprintf(yyout,"%s",yytext);}
<START>[a-zA-Z0-9]+ {
    fprintf(yyout,"#define %s",yytext);
    BEGIN ARG;
}
<START>[(] {
    BEGIN ARG;
}
<ARG>[^,() ] {
    fprintf(yyout,"%s",yytext);
}
<ARG>[,] {fprintf(yyout,"%s",yytext);}
<ARG>"int " ;
<ARG>")" {
    fprintf(yyout,"%s",yytext);
    BEGIN BODY;
}
<BODY>"return" ;
<BODY>[\{;\n ] ;
<BODY>[^\n };]+ {
    fprintf(yyout," %s",yytext);
}
<BODY>"}" {BEGIN INITIAL;}


%%
int main(){
    yyin =fopen("in.c","r");
    yyout=fopen("ou.c","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}


int yywrap(){
 return 1;
}
