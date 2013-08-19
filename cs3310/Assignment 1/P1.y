/**
 * Author: Sriram V.
 *
 **/

%{
    #include<stdio.h>
%}

%token CLASS IDENTIFIER
%token PUBLIC STATIC VOID MAIN
%token STRING IDENTIFIER
%token RETURN
%token INT BOOL
%token IF ELSE
%token INT_VAL BOOL_VAL
%token EXTENDS
%token THIS NEW
%token DEFINE
%token WHILE
%token LENGTH
%token EOF

%%

Goal : 	(MacroDefinition)* MainClass (TypeDeclaration)* EOF
     ;

MainClass :	CLASS IDENTIFIER '{' PUBLIC STATIC VOID MAIN '(' STRING '[' ']' IDENTIFIER ')' '{' System.out.println ( Expression ); '}' '}'
          ;

TypeDeclaration : CLASS IDENTIFIER '{' (Type IDENTIFIER ';')* (MethodDeclaration)* '}'
                | CLASS IDENTIFIER EXTENDS IDENTIFIER '{' (Type IDENTIFIER ';')* (MethodDeclaration )* '}'
                ;

MethodDeclaration :	PUBLIC Type IDENTIFIER '(' ((Type IDENTIFIER)(Type IDENTIFIER)*)? ')' '{' (Type IDENTIFIER ';')* (Statement)* RETURN Expression ';' '}'
                  ;
Type : INT '[' ']'
     | BOOL
     | INT
     | IDENTIFIER
     ;

Statement :	'{' (Statement)* '}'
          | System.out.println ( Expression )';'
          | IDENTIFIER '=' Expression ';'
          | IDENTIFIER '[' Expression ']' '=' Expression ';'
          | IF '(' Expression ')' Statement
          | IF '(' Expression ')' Statement ELSE Statement
          | WHILE '(' Expression ')' Statement
          | IDENTIFIER '(' ( Expression (',' Expression)* )? ')' ';' /* Macro stmt call */
          ;

Expression : PrimaryExpression '&' PrimaryExpression      {strcat($$,$1); strcat($$,"&"); strcat($$, $2);}
           | PrimaryExpression '<' PrimaryExpression
           | PrimaryExpression '+' PrimaryExpression
           | PrimaryExpression '-' PrimaryExpression
           | PrimaryExpression '*' PrimaryExpression
           | PrimaryExpression '/' PrimaryExpression
           | PrimaryExpression '[' PrimaryExpression ']'
           | PrimaryExpression '.' LENGTH 
           | PrimaryExpression
           | PrimaryExpression '.' IDENTIFIER '(' ( Expression (',' Expression)* )? ')'
           | IDENTIFIER '(' ( Expression (',' Expression)* )? ')'/* Macro expr call */
           ;

PrimaryExpression :	INT_VAL
                  |	BOOL_VAL
                  |	IDENTIFIER
                  |	THIS
                  | NEW INT '[' Expression ']'
                  | NEW IDENTIFIER '(' ')'
                  | '!' Expression
                  | '(' Expression ')'
                  ;

MacroDefinition : MacroDefExpression
                | MacroDefStatement
                ;

MacroDefStatement :	'#' DEFINE IDENTIFIER '(' ( IDENTIFIER (',' IDENTIFIER)* )? ')' '{' (Statement)* '}'
                  ;

MacroDefExpression : '#' DEFINE IDENTIFIER '(' ( IDENTIFIER (',' IDENTIFIER)* )? ')' '(' Expression ')'
                   ;

%%

main (int argc, char **argv) {
  yyparse();
}

yyerror (char *s) {
  fprintf(stderr, "Macha error: %s\n", s);
}
