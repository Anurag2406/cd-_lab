%{
#include<stdio.h>
%}
letter[a-z A-Z_]
digit[0-9]
special[.,;:$!#\/?]
%%
({special}|{digit})({special}|{digit}|{letter})* {printf("\n %s is not an identifier",yytext);}
{letter}({letter}|{digit})* {printf("\n %s is an identifier",yytext);}
{digit}({letter}|{digit})* {printf("\n %s is not an identifier",yytext);}
%%
int main()
{
yylex();
}