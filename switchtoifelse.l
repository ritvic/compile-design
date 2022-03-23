%{
char varname[10] = "" ;
int flag = 0 ;
%}
%s START
%s CASE
%s BODY
ws [\n\t ]
var [a-zA-Z]
num [0-9]
%%
<INITIAL>"switch("  {BEGIN START;}
<INITIAL>{ws}+      ;

<START>{var}+ {printf("%s\n",yytext);strcpy(varname,yytext);}
<START>")"{ws}*"{" {BEGIN CASE;}

<CASE>"}" ;
<CASE>"case"{ws}*{num}+ {
    int i = 4;
    while(yytext[i] == ' ' || yytext[i] == '\n' || yytext[i] == '\t') i++;
    if(flag==0) {
        flag = 1;
        fprintf(yyout,"if(%s",varname);
    } else {
        fprintf(yyout,"else if(%s",varname);
    }
    for(i;i<yyleng;i++){
        fprintf(yyout,"==%c){",yytext[i]);
    }
}
<CASE>"default" { fprintf(yyout,"else {"); }
<CASE>":" {BEGIN BODY;}

<BODY>"}"  { fprintf(yyout,"}"); }
<BODY>{ws}*"break"{ws}*";" {
    fprintf(yyout,"}");
    BEGIN CASE;
}
<BODY>. {fprintf(yyout,"%s",yytext);}
%%
int main(){
    yyin =fopen("input.c","r");
    yyout=fopen("output.c","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap(){
 return 1;
}