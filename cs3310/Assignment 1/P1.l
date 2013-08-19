/**
 * Author: Sriram V.
 *
 **/

%{
    #include "P1.tab.h"
%}

%%

    [0-9]+ 	{yylval = atoi(yytext); return NUM;}
    "+"    	{return ADD;}
    "-"			{return SUB;}
    "*"			{return MUL;}
    "/"			{return DIV;}
    "("			{return LP;}
    ")"			{return RP;}
    "\n"		{return EOL;}
    [ \t]		{;}
    .			{}

%%

COMMENT \/\/(.*)$
KEYWORD
IDENTIFIER
SYMBOL ("#"|"{"|"}")
INT [0-9]+
BOOLEAN ("true"|"false")
OPERATOR ("+"|"-"|"/"|"*"|"."|"&"|"<"|"!"
SKIP (\t|" ")
