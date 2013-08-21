/**
 * Author: Sriram V.
 *
 **/

%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


/*start of LinkedList.h*/
//Node of the linked list.
typedef struct N {
        char* value;
        struct N *next;
}Node;

//Linked List
typedef struct L {
        Node* front;
        Node* back;
        struct L* next;
}LinkedList;

//List of Lists
typedef struct LL {
        LinkedList* front;
        LinkedList* back;
}LoL;

//Functions
Node* Node_new(char*, Node*);
LinkedList* LinkedList_new();
LoL* LoL_new();
void appendLoL(LoL*, LinkedList*);
void clear(LinkedList*);
void clearLoL(LoL*);
void remLoL(LoL*);
void printClear(LinkedList*);
char* rem(LinkedList* list);
void appendList(LinkedList*, LinkedList*);
void append(LinkedList*, char*);
/*end of LinkedList.h*/


/*start of LinkedList.c*/
Node* Node_new(char* value, Node* next) { 
  Node* p = (Node*) malloc(sizeof(Node));
  p->value = value;
  p->next = next;
  return p;
}

LinkedList* LinkedList_new() { 
  LinkedList* p = (LinkedList*) malloc(sizeof(LinkedList));
  p->front = NULL;
  p->back = NULL;
  p->next = NULL;
  return p;
}

LoL* LoL_new() {
    LoL* p = (LoL*) malloc(sizeof(LoL));
    p->front = NULL;
    p->back = NULL;
    return p;
}

void append(LinkedList* list, char* value) {
    Node* new_node = Node_new(value, NULL);
    if(list->back != NULL ) {
        list->back->next = new_node;
    }
    else {
        list->front = new_node;
    }
    list->back = new_node;
}

void appendLoL(LoL* list, LinkedList* arg) {
    if(list->back != NULL ) {
        list->back->next = arg;
    }
    else {
        list->front = arg;
    }
    list->back = arg;
}

void clearLoL(LoL* list) {
    LinkedList* i;
    for (i = list->front; i != NULL; i = i->next) {
        remLoL(list);
    }
}

void remLoL(LoL* list) {
    if (list->front == NULL) {
        fprintf(stderr, "ERROR : The list is empty.\n");
        exit(-1);
    }
    LinkedList* old_front = list->front;
    if (list->front == list->back) {
        list->back = NULL;
    }
    list->front = list->front->next;
    clear(old_front);
    free(old_front);
}

void appendList(LinkedList* list, LinkedList* addon) {
    if(list->back == NULL) {
        list->front = addon->front;
    }
    else {
        list->back->next = addon->front;
    }
    if(addon->back != NULL) {
        list->back = addon->back;
    }
    free(addon);
}

char* rem(LinkedList* list) {
    if (list->front == NULL) {
        fprintf(stderr, "ERROR : The list is empty.\n");
        exit(-1);
    }
    char* temp = list->front->value;
    Node* old_front = list->front;
    if (list->front == list->back) {
        list->back = NULL;
    }
    list->front = list->front->next;
    free(old_front);
    return temp;
}

void clear(LinkedList* list) {
    Node* i;
    char* temp;
    for (i = list->front; i != NULL; i = i->next) {
        temp = rem(list);
    }
}

void printClear(LinkedList* list) {
    Node* i;
    for (i = list->front; i != NULL; i = i->next) {
        printf("%s ", rem(list));
    }
    printf("\n");
}
/*end of LinkedList.c*/


/*start of LinkedDef.h*/
//Node of the linked list.
typedef struct ND {
        char* macro;
        LoL* args;
        LinkedList* body;
        struct ND *next;
}NodeDef;

//Linked List
typedef struct LD {
        NodeDef* top;
}LinkedDef;

//Functions
NodeDef* NodeDef_new(char*, LinkedList*, LinkedList*, NodeDef*);
LinkedDef* LinkedDef_new();
void pushDef(LinkedDef*, char*, LinkedList*, LinkedList*);
void popDef(LinkedDef*);
void clearDef(LinkedDef*);
LoL* tokenize(LinkedList*);
int findRepDef(LinkedDef*, char*, LinkedList*, LinkedList*);
/*end of LinkedDef.h*/


/*start of LinkedDef.c*/
LoL* tokenize(LinkedList* args) {
    int open_p = 0;
    Node* i;
    LoL* tk_list = LoL_new();
    LinkedList* a = LinkedList_new();
    if (args->front!=NULL) {
        for(i=args->front; i!=NULL; i=i->next) {
            if(strcmp(i->value, "(")==0) {
                append(a, i->value);
                open_p++;
                continue;
            }
            else if (strcmp(i->value, ")")==0) {
                append(a, i->value);
                open_p--;
                continue;
            }

            if(open_p==0) {
                if(strcmp(i->value, ",")==0) {
                    appendLoL(tk_list, a);
                    a = LinkedList_new();
                    continue;
                }
            }
            append(a, i->value);
        }
        appendLoL(tk_list, a);
    }
    clear(args);
    free(args);
    return tk_list;
}

NodeDef* NodeDef_new(char* macro, LinkedList* args, LinkedList* body, NodeDef* next) { 
    NodeDef* p = (NodeDef*) malloc(sizeof(NodeDef));
    p->macro = macro;
    //assuming that for the definition, the args will be only identifiers
    //ie., only single-element Linked Lists will be in the LoL.
    LoL* tk_list = tokenize(args);
    p->args = tk_list;
    p->body = body;
    p->next = next;
    return p;
}

LinkedDef* LinkedDef_new() { 
    LinkedDef* p = (LinkedDef*) malloc(sizeof(LinkedDef));
    p->top = NULL;
    return p;
}

void pushDef(LinkedDef* list, char* macro, LinkedList* args, LinkedList* body) {
    NodeDef* new_node = NodeDef_new(macro, args, body, list->top);
    list->top = new_node;
}

void popDef(LinkedDef* list) {
    if (list->top == NULL) {
        fprintf(stderr, "ERROR : The list is empty.\n");
        exit(-1);
    }
    NodeDef* old_top = list->top;
    list->top = list->top->next;
    free(old_top);
}

void clearDef(LinkedDef* list) {
    NodeDef* i;
    for (i = list->top; i != NULL; i = i->next) {
        popDef(list);
    }
}


int findRepDef(LinkedDef* list, char* macro, LinkedList* args, LinkedList* result) {
    NodeDef* i;
    for(i = list->top; i != NULL; i = i->next) {
        if(strcmp(i->macro, macro)==0) {
            break;
        }
    }
    if (i==NULL) {
        return 0; 
    }

    LoL* tk_list = tokenize(args);

    LinkedList* def_arg;
    LinkedList* rep_arg;

    //no. of args args mismatch won't be there
    //no args case is a trivial instance of below for loop
    Node* j;
    for(j=i->body->front; j!=NULL; j=j->next) {
        for(def_arg=i->args->front, rep_arg=tk_list->front; def_arg!=NULL && rep_arg!=NULL; def_arg=def_arg->next, rep_arg=rep_arg->next) {
            if(strcmp(j->value,def_arg->front->value)==0) {
                //replace with rep_arg and break
                {
                    Node* temp;
                    for(temp=rep_arg->front; temp!=NULL; temp=temp->next) {
                        append(result, temp->value);
                    }
                }
                break;
            }
        }
        if(def_arg==NULL&&rep_arg==NULL) {
            //No replacement
            //append as is to result
            append(result, j->value); 
        }
    }
    clearLoL(tk_list);
    free(tk_list);
    return 1;
}
/*end of LinkedDef.c*/


/*global variables*/
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
  printf("// Failed to parse macrojava code.\n");
}
