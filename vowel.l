%{
#include<stdio.h>
%}
vowels [aeiouAEIOU]
consonents [a-zA-Z^aeiouAEIOU]
%%
{vowels}* {printf("%s is vowel",yytext);}
{consonents}+ {printf("%s is consonent",yytext);}
%%
int main(){
yylex();
 }