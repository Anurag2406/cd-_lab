%{
#include <stdio.h>
%}

letter  [a-zA-Z]
digit   [0-9]
aop     "+"|"-"|"*"|"/"|"%"
rop     "=="|"!="|"<="|">="|"<"|">"
lop     "&&"|"||"|"!"
aop_assign "="
keyword "int"|"float"|"if"|"else"|"while"|"for"|"do"|"return"|"break"|"continue"

int_const    [0-9]+
float_const  [0-9]+"."[0-9]* | "."[0-9]+

single_comment  "//".*
multi_comment   "/*"([^*]|\*+[^*/])*\*+"/"

%%

{keyword}           { printf("%s is a keyword\n", yytext); }
{letter}({letter}|{digit})* { printf("%s is a valid identifier\n", yytext); }
{digit}+"."{digit}+ { printf("%s is a floating point constant\n", yytext); }
{aop}               { printf("%s is an arithmetic operator\n", yytext); }
{rop}               { printf("%s is a relational operator\n", yytext); }
{lop}               { printf("%s is a logical operator\n", yytext); }
{aop_assign}        { printf("%s is an assignment operator\n", yytext); }
{digit}+            { printf("%s is integer constant \n", yytext); }
{single_comment}    { printf("%s is single line comment \n", yytext); }
{multi_comment}     { printf("%s is a multi line comment \n" , yytext); }

%%

int yywrap() {
    return 1;
}
