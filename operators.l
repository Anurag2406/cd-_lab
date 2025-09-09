{
#include <stdio.h>
%}

aop     "+"|"-"|"*"|"/"|"%"
rop     "=="|"!="|"<="|">="|"<"|">"
lop     "&&"|"||"|"!"
aop_assign "="

%%

{aop}           { printf("%s is an arithmetic operator\n", yytext); }
{rop}           { printf("%s is a relational operator\n", yytext); }
{lop}           { printf("%s is a logical operator\n", yytext); }
{aop_assign}    { printf("%s is an assignment operator\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
