%{
/*this is yacc program */
#include<stdio.h>
#include<math.h>
double d;
%}

%token one zero
%%


S   :T '.' F { $$=$1+$3;printf("The result is %d.%d \n\n",$1,$3);}
        ;

T   :T B { $$=$1*2+$2; }
    |B {$$=$1;}
        ;
F   :B F {$$=$2/2+$1;}
    |B   {$$=$1;}
    ;
B   :one {$$=1.000;}
    |zero {$$=0.000;}
   ;
%%
int main()
{
printf("enter a binary expression");
yyparse();
}
yyerror()
{
printf("error \n");
}

