%{
    #include<stdio.h>
    int num,r,digit=0,count,pcount=0,i;
    char a[20];
%}
DIGIT [0-9]

%%

{DIGIT}+ {    num=atoi(yytext);
        while(num!=0)
        {
            r=num%2;
            digit='0'+r;
            a[count++]=digit;
            num=num/2;
        }
        for(i=count-1;i>=pcount;--i)
                printf("%c",a[i]);
                pcount=count;
        }
.|\n    ECHO;
        
%%
main()
{
    yylex();
    return 0;
}      