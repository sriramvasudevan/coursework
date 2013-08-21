/**
 * Author: Sriram V.
 *
 **/

%{

#include <stdio.h>
#include <stdlib.h>
#include "LinkedList.h"
#include "LinkedDef.h"

LinkedDef* deflist;
%}

%union{
    char* tl; //All terminals are strings
    LinkedList* ll; //All non-terminals are Linked Lists
}

%token <tl> CLASS
%token <tl> PUBLIC
%token <tl> STATIC
%token <tl> VOID
%token <tl> MAIN
%token <tl> STRING
%token <tl> RETURN
%token <tl> INT
%token <tl> BOOLEAN
%token <tl> EXTENDS
%token <tl> LENGTH
%token <tl> DEFINE
%token <tl> WHILE
%token <tl> THIS
%token <tl> NEW
%token <tl> IF
%token <tl> ELSE
%token <tl> SYSTEM
%token <tl> OUT
%token <tl> PRINTLN
%token <tl> BOOL_VAL
%token <tl> INT_VAL
%token <tl> IDENTIFIER
%token <tl> ENDOFFILE

%type <ll> Goal
%type <ll> MacroDefinition
%type <ll> MainClass
%type <ll> TypeDeclaration
%type <ll> Expression
%type <ll> TypeIdentList
%type <ll> MethodDeclaration
%type <ll> Type
%type <ll> MethodArgList
%type <ll> StatementList
%type <ll> MArgList
%type <ll> Statement
%type <ll> Statement2
%type <ll> ExpList
%type <ll> NonUnary
%type <ll> Unary
%type <ll> PrimaryExpression
%type <ll> Fns
%type <ll> MacroCall
%type <ll> EList
%type <ll> MacroDefExpression
%type <ll> MacroDefStatement
%type <ll> MacroDefList
%type <ll> MDefList

%%

Goal : MacroDefinition MainClass TypeDeclaration ENDOFFILE  {
        $$ = LinkedList_new();
        appendList($$, $1);
        appendList($$, $2);
        appendList($$, $3);
        printClear($$);
        free($$);
        clearDef(deflist);
        free(deflist);
        exit(0);
     }
     ;

MainClass :	CLASS IDENTIFIER '{' PUBLIC STATIC VOID MAIN '(' STRING '[' ']' IDENTIFIER ')' '{' SYSTEM '.' OUT '.' PRINTLN '(' Expression ')' ';' '}' '}' {
            $$ = LinkedList_new();
            append($$, $1);
            append($$, $2);
            append($$, "{\n");
            append($$, $4);
            append($$, $5);
            append($$, $6);
            append($$, $7);
            append($$, "(");
            append($$, $9);
            append($$, "[ ]");
            append($$, $12);
            append($$, ") {\n");
            append($$, $15);
            append($$, ".");
            append($$, $17);
            append($$, ".");
            append($$, $19);
            append($$, "(");
            appendList($$, $21);
            append($$, ");\n}\n}\n");
          }
          ;

TypeDeclaration : /* empty */ {
                    $$ = LinkedList_new();
                }
                | TypeDeclaration CLASS IDENTIFIER '{' TypeIdentList MethodDeclaration '}' {
                    $$ = LinkedList_new();
                    appendList($$, $1);
                    append($$, $2);
                    append($$, $3);
                    append($$, "{\n");
                    appendList($$, $5);
                    appendList($$, $6);
                    append($$, "}\n");
                }
                | TypeDeclaration CLASS IDENTIFIER EXTENDS IDENTIFIER '{' TypeIdentList MethodDeclaration '}' {
                    $$ = LinkedList_new();
                    appendList($$, $1);
                    append($$, $2);
                    append($$, $3);
                    append($$, $4);
                    append($$, $5);
                    append($$, "{\n");
                    appendList($$, $7);
                    appendList($$, $8);
                    append($$, "}\n");
                }
                ;

TypeIdentList : /* empty */ {
                  $$ = LinkedList_new();
              }
              | TypeIdentList Type IDENTIFIER ';' {
                  $$ = LinkedList_new();
                  appendList($$, $1);
                  appendList($$, $2);
                  append($$, $3);
                  append($$, ";\n");
              }
              ;

MethodDeclaration : /* empty */ {
                      $$ = LinkedList_new();
                  }
                  | MethodDeclaration PUBLIC Type IDENTIFIER '(' MethodArgList ')' '{' TypeIdentList StatementList RETURN Expression ';' '}' {
                      $$ = LinkedList_new();
                      appendList($$, $1);
                      append($$, $2);
                      appendList($$, $3);
                      append($$, $4);
                      append($$, "(");
                      appendList($$, $6);
                      append($$, "){\n");
                      appendList($$, $9);
                      appendList($$, $10);
                      append($$, $11);
                      appendList($$, $12);
                      append($$, ";\n}\n");
                  }
                  ;
MethodArgList : /* empty */ {
                  $$ = LinkedList_new();
              }
              | MArgList {
                  $$ = LinkedList_new();
                  appendList($$, $1);
              }
              ;

MArgList : Type IDENTIFIER {
            $$ = LinkedList_new();
            appendList($$, $1);
            append($$, $2);
         }
         | MArgList ',' Type IDENTIFIER {
             $$ = LinkedList_new();
             appendList($$, $1);
             append($$, ",");
             appendList($$, $3);
             append($$, $4);
         }
         ;

Type : INT '[' ']' {
        $$ = LinkedList_new();
        append($$, $1);
        append($$, "[ ]");
     }
     | BOOLEAN {
        $$ = LinkedList_new();
        append($$, $1);
     }
     | INT {
        $$ = LinkedList_new();
        append($$, $1);
     }
     | IDENTIFIER {
        $$ = LinkedList_new();
        append($$, $1);
     }
     ;

StatementList : /* empty */ {
                  $$ = LinkedList_new();
              }
              | Statement StatementList {
                  $$ = LinkedList_new();
                  appendList($$, $1);
                  appendList($$, $2);
              }
              ;

/* One way to take care of if-else S/R (works)*/
/*Statement : Matched {printf("");}
          | Unmatched {printf("");}
          ;
*/
/*Matched   :	'{' StatementList '}' {printf("");}
          | SYSTEM '.' OUT '.' PRINTLN '(' Expression ')' ';' {printf("");}
          | IDENTIFIER '=' Expression ';' {printf("");}
          | IDENTIFIER '[' Expression ']' '=' Expression ';' {printf("");}
          | IF '(' Expression ')' Matched ELSE Matched {printf("");}
          | WHILE '(' Expression ')' Matched {printf("");}
          | IDENTIFIER '(' ExpList ')' ';'  {printf("");} // Macro stmt call 
          ;
*/
/*Unmatched : IF '(' Expression ')' Statement {printf("");}
          | IF '(' Expression ')' Matched ELSE Unmatched {printf("");}
          | WHILE '(' Expression ')' Unmatched {printf("");}
          ;
*/
/*First choice ends here*/

/* The other choice to remove S/R for if-else (works) */
Statement :	'{' StatementList '}' {
              $$ = LinkedList_new();
              append($$, "{\n");
              appendList($$, $2);
              append($$, "}\n");
          }
          | SYSTEM '.' OUT '.' PRINTLN '(' Expression ')' ';' {
              $$ = LinkedList_new();
              append($$, $1);
              append($$, ".");
              append($$, $3);
              append($$, ".");
              append($$, $5);
              append($$, "(");
              appendList($$, $7);
              append($$, ");\n");
          }
          | IDENTIFIER '=' Expression ';' {
              $$ = LinkedList_new();
              append($$, $1);
              append($$, "=");
              appendList($$, $3);
              append($$, ";\n");
          }
          | IDENTIFIER '[' Expression ']' '=' Expression ';' {
              $$ = LinkedList_new();
              append($$, $1);
              append($$, "[");
              appendList($$, $3);
              append($$, "] =");
              appendList($$, $6);
              append($$, ";\n");
          }
          | IF '(' Expression ')' Statement {
              $$ = LinkedList_new();
              append($$, $1);
              append($$, "(");
              appendList($$, $3);
              append($$, ")");
              appendList($$, $5);
          }
          | IF '(' Expression ')' Statement2 ELSE Statement {
              $$ = LinkedList_new();
              append($$, $1);
              append($$, "(");
              appendList($$, $3);
              append($$, ")");
              appendList($$, $5);
              append($$, $6);
              appendList($$, $7);
          }
          | WHILE '(' Expression ')' Statement {
              $$ = LinkedList_new();
              append($$, $1);
              append($$, "(");
              appendList($$, $3);
              append($$, ")");
              appendList($$, $5);
          }
          | IDENTIFIER '(' ExpList ')' ';' {
              $$ = LinkedList_new();
              int success = findRepDef(deflist, $1, $3, $$);
              if(success==0) {
                  append($$, $1);
                  append($$, "(");
                  appendList($$, $3);
                  append($$, ");\n");
              }
          } /* Macro stmt call */
          ;

/* Any rule ending in a statement here must end in Statement2
 * as the handle of the rule is Statement 2. This means it could be
 * inside the if of an if-else, and hence this statement will be
 * followed by an else. So dangling else issue.
 */
Statement2 :	'{' StatementList '}' {
               $$ = LinkedList_new();
               append($$, "{\n");
               appendList($$, $2);
               append($$, "}\n");
           }
           | SYSTEM '.' OUT '.' PRINTLN '(' Expression ')' ';' {
               $$ = LinkedList_new();
               append($$, $1);
               append($$, ".");
               append($$, $3);
               append($$, ".");
               append($$, $5);
               append($$, "(");
               appendList($$, $7);
               append($$, ");\n");
           }
           | IDENTIFIER '=' Expression ';' {
               $$ = LinkedList_new();
               append($$, $1);
               append($$, "=");
               appendList($$, $3);
               append($$, ";\n");
           }
           | IDENTIFIER '[' Expression ']' '=' Expression ';' {
               $$ = LinkedList_new();
               append($$, $1);
               append($$, "[");
               appendList($$, $3);
               append($$, "] =");
               appendList($$, $6);
               append($$, ";\n");
           }
           | IF '(' Expression ')' Statement2 ELSE Statement2 {
               $$ = LinkedList_new();
               append($$, $1);
               append($$, "(");
               appendList($$, $3);
               append($$, ")");
               appendList($$, $5);
               append($$, $6);
               appendList($$, $7);
           }
           | WHILE '(' Expression ')' Statement2 {
               $$ = LinkedList_new();
               append($$, $1);
               append($$, "(");
               appendList($$, $3);
               append($$, ")");
               appendList($$, $5);
           }
           | IDENTIFIER '(' ExpList ')' ';' {
               $$ = LinkedList_new();
               int success = findRepDef(deflist, $1, $3, $$);
               if(success==0) {
                   append($$, $1);
                   append($$, "(");
                   appendList($$, $3);
                   append($$, ");\n");
               }
           } /* Macro stmt call */
           ;
/*Other choice ends here*/

/*Expression : PrimaryExpression '&' PrimaryExpression {printf("");}
           | PrimaryExpression '<' PrimaryExpression {printf("");}
           | PrimaryExpression '+' PrimaryExpression {printf("");}
           | PrimaryExpression '-' PrimaryExpression {printf("");}
           | PrimaryExpression '*' PrimaryExpression {printf("");}
           | PrimaryExpression '/' PrimaryExpression {printf("");}
           | PrimaryExpression '[' PrimaryExpression ']' {printf("");}
           | PrimaryExpression '.' LENGTH  {printf("");}
           | PrimaryExpression '.' IDENTIFIER '(' ExpList ')' {printf("");}
           | PrimaryExpression {printf("");}
           | IDENTIFIER '(' ExpList ')' Macro expr call  {printf("");}
           ;
*/

Fns        : NonUnary '[' PrimaryExpression ']' {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, "[");
               appendList($$, $3);
               append($$, "]");
           }
           | NonUnary '.' LENGTH  {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, ".");
               append($$, $3);
           }
           | NonUnary '.' IDENTIFIER '(' ExpList ')' {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, ".");
               append($$, $3);
               append($$, "(");
               appendList($$, $5);
               append($$, ")");
           }

Expression : PrimaryExpression '&' PrimaryExpression {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, "&");
               appendList($$, $3);
           }
           | PrimaryExpression '<' PrimaryExpression {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, "<");
               appendList($$, $3);
           }
           | PrimaryExpression '+' PrimaryExpression {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, "+");
               appendList($$, $3);
           }
           | PrimaryExpression '-' PrimaryExpression {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, "-");
               appendList($$, $3);
           }
           | PrimaryExpression '*' PrimaryExpression {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, "*");
               appendList($$, $3);
           }
           | PrimaryExpression '/' PrimaryExpression {
               $$ = LinkedList_new();
               appendList($$, $1);
               append($$, "/");
               appendList($$, $3);
           }
           | Fns {
               $$ = LinkedList_new();
               appendList($$, $1);
           }
           | PrimaryExpression {
               $$ = LinkedList_new();
               appendList($$, $1);
           }
           | MacroCall {
               $$ = LinkedList_new();
               appendList($$, $1);
           }
           ;

MacroCall : IDENTIFIER '(' ExpList ')' /* Macro expr call */ {
              $$ = LinkedList_new();
              int success = findRepDef(deflist, $1, $3, $$);
              if(success==0) {
                  append($$, $1);
                  append($$, "(");
                  appendList($$, $3);
                  append($$, ")");
              }
          }
          ;

PrimaryExpression : NonUnary {
                      $$ = LinkedList_new();
                      appendList($$, $1);
                  }
                  | Unary {
                      $$ = LinkedList_new();
                      appendList($$, $1);
                  }
                  ;

NonUnary : INT_VAL {
             $$ = LinkedList_new();
             append($$, $1);
         }
         | BOOL_VAL {
             $$ = LinkedList_new();
             append($$, $1);
         }
         | IDENTIFIER {
             $$ = LinkedList_new();
             append($$, $1);
         }
         | THIS {
             $$ = LinkedList_new();
             append($$, $1);
         }
         | NEW INT '[' Expression ']' {
             $$ = LinkedList_new();
             append($$, $1);
             append($$, $2);
             append($$, "[");
             appendList($$, $4);
             append($$, "]");
         }
         | NEW IDENTIFIER '(' ')' {
             $$ = LinkedList_new();
             append($$, $1);
             append($$, $2);
             append($$, "()");
         }
         | '(' Expression ')' {
             $$ = LinkedList_new();
             append($$, "(");
             appendList($$, $2);
             append($$, ")");
         }
         ;

Unary   : '!' PrimaryExpression {
            $$ = LinkedList_new();
            append($$, "!");
            appendList($$, $2);
        }
        | '!' Fns {
            $$ = LinkedList_new();
            append($$, "!");
            appendList($$, $2);
        }
        | '!' MacroCall {
            $$ = LinkedList_new();
            append($$, "!");
            appendList($$, $2);
        }
        ;

ExpList : /* empty */ {
            $$ = LinkedList_new();
        }
        | EList {
            $$ = LinkedList_new();
            appendList($$, $1);
        }
        ;

EList : Expression {
          $$ = LinkedList_new();
          appendList($$, $1);
      }
      | EList ',' Expression {
          $$ = LinkedList_new();
          appendList($$, $1);
          append($$, ",");
          appendList($$, $3);
      }
      ;

/*PrimaryExpression :	INT_VAL {printf("");}
                  |	BOOL_VAL {printf("");}
                  |	IDENTIFIER {printf("");}
                  |	THIS {printf("");}
                  | NEW INT '[' Expression ']' {printf("");}
                  | NEW IDENTIFIER '(' ')' {printf("");}
                  | '!' Expression {printf("");}
                  | '(' Expression ')' {printf("");}
                  ;
*/

MacroDefinition : /* empty */   {
                    $$ = LinkedList_new();
                }
                | MacroDefinition MacroDefExpression {
                    $$ = LinkedList_new();
                    appendList($$, $1);
                    appendList($$, $2);
                }
                | MacroDefinition MacroDefStatement {
                    $$ = LinkedList_new();
                    appendList($$, $1);
                    appendList($$, $2);
                }
                ;

MacroDefStatement :	'#' DEFINE IDENTIFIER '(' MacroDefList ')' '{' StatementList '}' {
                      $$ = LinkedList_new();
                      
                      LinkedList* st_list = LinkedList_new();
                      append(st_list, "{");
                      appendList(st_list, $8);
                      append(st_list, "}");
                      pushDef(deflist, $3, $5, st_list);
                  }
                  ;

MacroDefExpression : '#' DEFINE IDENTIFIER '(' MacroDefList ')' '(' Expression ')' {
                      $$ = LinkedList_new();

                      LinkedList* st_list = LinkedList_new();
                      append(st_list, "(");
                      appendList(st_list, $8);
                      append(st_list, ")");
                      pushDef(deflist, $3, $5, st_list);
                   }
                   ;

MacroDefList: /* empty */ {
                $$ = LinkedList_new();
            }
            | MDefList {
                $$ = LinkedList_new();
                appendList($$, $1);
            }
            ;

MDefList: IDENTIFIER {
            $$ = LinkedList_new();
            append($$, $1);
        }
        | MDefList ',' IDENTIFIER {
            $$ = LinkedList_new();
            appendList($$, $1);
            append($$, ",");
            append($$, $3);
        }
        ;

%%

main (int argc, char **argv) {
  deflist = LinkedDef_new();
  yyparse();
}

yyerror (char *s) {
  fprintf(stderr, "// Failed to parse macrojava code.\n");
}
