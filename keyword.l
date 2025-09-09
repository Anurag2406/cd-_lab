%{
#include <stdio.h>
%}

letter [a-zA-Z]
digit [0-9]
keyword (if|else|while|for|return|switch|int|char|float|void|double)

%%

{keyword}        { printf("%s is a keyword\n", yytext); }
{letter}({letter}|{digit})* { printf("%s is not a keyword\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}