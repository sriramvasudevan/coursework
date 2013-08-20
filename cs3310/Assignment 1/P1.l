/**
 * Author: Sriram V.
 *
 **/

%{

#include "LinkedList.h"
#include "P1.tab.h"

%}

SKIP [\n\t ]
COMMENT ((\/\/(.)*\n)|(\/\*([^*]|\n|(\*+([^*/]|[\n])))*\*+\/))
BOOL_VAL (true|false)
INT_VAL ([1-9][0-9]*|0)
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
SYMBOL [\(\)\{\}\[\]#.;,]
OPERATOR [+\-\*\/<=&!]

%%

"class"               {yylval.tl = strdup(yytext); return CLASS;}
"public"              {yylval.tl = strdup(yytext); return PUBLIC;}
"static"              {yylval.tl = strdup(yytext); return STATIC;}
"void"                {yylval.tl = strdup(yytext); return VOID;}
"main"                {yylval.tl = strdup(yytext); return MAIN;}
"String"              {yylval.tl = strdup(yytext); return STRING;}
"return"              {yylval.tl = strdup(yytext); return RETURN;}
"int"                 {yylval.tl = strdup(yytext); return INT;}
"boolean"             {yylval.tl = strdup(yytext); return BOOLEAN;}
"extends"             {yylval.tl = strdup(yytext); return EXTENDS;}
"length"              {yylval.tl = strdup(yytext); return LENGTH;}
"define"              {yylval.tl = strdup(yytext); return DEFINE;}
"while"               {yylval.tl = strdup(yytext); return WHILE;}
"this"                {yylval.tl = strdup(yytext); return THIS;}
"new"                 {yylval.tl = strdup(yytext); return NEW;}
"if"                  {yylval.tl = strdup(yytext); return IF;}
"else"                {yylval.tl = strdup(yytext); return ELSE;}
"System"              {yylval.tl = strdup(yytext); return SYSTEM;}
"out"                 {yylval.tl = strdup(yytext); return OUT;}
"println"             {yylval.tl = strdup(yytext); return PRINTLN;}
{BOOL_VAL}            {yylval.tl = strdup(yytext); return BOOL_VAL;}
{INT_VAL}             {yylval.tl = strdup(yytext); return INT_VAL;}
({SKIP}|{COMMENT})    {;}
{IDENTIFIER}          {yylval.tl = strdup(yytext); return IDENTIFIER;}
({SYMBOL}|{OPERATOR}|.) {yylval.tl = strdup(yytext); return yytext[0];}
<<EOF>>               {return ENDOFFILE;}

%%
/*.                     {return ERROR;}*/
