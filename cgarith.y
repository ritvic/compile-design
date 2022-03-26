%{
#include<stdio.h>
#include<stdlib.h>
int vala=0,valb=0,t=0;
%}
%token ID NUM
%%
S: ID'='E{printf("Answer:t%d\t",$3);printf("MOV(@%c,AX)\n",$1);};
E: E'+'E {$$=t;printf("t%d=t%d+t%d\t",t,$1,$3);printf("ADD(AX,BX)\n");t++;}
   |E'-'E {$$=t;printf("t%d=t%d-t%d\t",t,$1,$3);printf("SUB(AX,BX)\n");t++;}
   |E'*'E {$$=t;printf("t%d=t%d*t%d\t",t,$1,$3);printf("MUL(AX,BX)\n");t++;}
   |E'/'E {$$=t;printf("t%d=t%d/t%d\t",t,$1,$3);printf("DIV(AX,BX)\n");t++;}
   |ID {$$=t;printf("t%d=%c\t",t,$1);t++;if(vala==0){printf("MOV(AX,@%c)\n",$1);vala=1;} else {printf("MOV(BX,@%c)\n",$1);valb=1;}}
   |NUM {$$=t;printf("t%d=%d\t",t,$1);t++;if(vala==0){printf("MOV(AX,#%d)\n",$1);vala=1;} else {printf("MOV(BX,#%d)\n",$1);valb=1;}}

%%
#include "lex.yy.c"
int main(){
printf("Enter Expression:\n");
yyparse();
return 0;}