%{
#include"y.tab.h"
#include<math.h>
extern int yylval;
%}
%%
['0'] {yylval=atoi(yytext);return zero;}
['1'] {yylval=atoi(yytext);return one;}
[\t] ;
[\n] return 0;
. return yytext[0];
%%
