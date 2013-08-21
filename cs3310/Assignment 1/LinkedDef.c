/* 
 * File:   LinkedDef.c
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:30 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "LinkedList.h"
#include "LinkedDef.h"
#include <string.h>


/*******************************************************************************
 * 
 * A library of functions to handle singly Linked Lists.
 * 
 ******************************************************************************/

void tokenize(LinkedList* args) {
    int open_p = 0;
    Node* i;
    Node* temp;
    Node* last_arg = args->front;
    char* a;
    if (last_arg!=NULL) {
        if(strcmp(last_arg->value, "(")==0) {
            open_p++;
        }
        for(i=last_arg->next; i!=NULL;i=last_arg->next) {
            if(strcmp(i->value, "(")==0) {
                a = (char*) malloc(sizeof(char)*strlen(last_arg->value)+strlen(i->value)+1);
                strcpy(a, last_arg->value);
                strcat(a, i->value);
                last_arg->value = a;
                last_arg->next = i->next;
                free(i);
                open_p++;
                continue;
            }
            else if (strcmp(i->value, ")")==0) {
                a = (char*) malloc(sizeof(char)*strlen(last_arg->value)+strlen(i->value)+1);
                strcpy(a, last_arg->value);
                strcat(a, i->value);
                last_arg->value = a;
                last_arg->next = i->next;
                free(i);
                open_p--;
                continue;
            }

            if(open_p==0) {
                if(strcmp(i->value, ",")==0) {
                    last_arg->next = i->next;
                    free(i);
                    last_arg = last_arg->next;
                    if(strcmp(last_arg->value, "(")==0) {
                        open_p++;
                    }
                    continue;
                }
            }

            a = (char*) malloc(sizeof(char)*strlen(last_arg->value)+strlen(i->value)+1);
            strcpy(a, last_arg->value);
            strcat(a, i->value);
            last_arg->value = a;
            last_arg->next = i->next;
            free(i);
        }
    }
}

NodeDef* NodeDef_new(char* macro, LinkedList* args, LinkedList* body, NodeDef* next) { 
    NodeDef* p = (NodeDef*) malloc(sizeof(NodeDef));
    p->macro = macro;
    tokenize(args);
    p->args = args;
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

    tokenize(args);

    Node* def_arg;
    Node* rep_arg;

    //no. of args args mismatch won't be there
    //no args case is a trivial instance of below for loop
    Node* j;
    for(j=i->body->front; j!=NULL; j=j->next) {
        for(def_arg=i->args->front, rep_arg=args->front; def_arg!=NULL && rep_arg!=NULL; def_arg=def_arg->next, rep_arg=rep_arg->next) {
            if(strcmp(j->value,def_arg->value)==0) {
                //replace with rep_arg and break
                append(result, rep_arg->value);
                break;
            }
        }
        if(def_arg==NULL&&rep_arg==NULL) {
            //No replacement
            //append as is to result
            append(result, j->value); 
        }
    }
    clear(args);
    free(args);
    return 1;
}


/*
// Test function for Linked List
int main() {
LinkedList* list = LinkedList_new();
append(list, "(");
append(list, "hello");
char* temp = (char*) malloc(sizeof(char)*8);
temp[0] = '\0';
append(list, ",");
append(list, "(");
strcat(temp, "genders");
append(list, temp);
append(list, ",");

LinkedList* list2 = LinkedList_new();
append(list2, "hello2");
append(list2, ")");
append(list2, ")");
append(list2, ",");
char* temp2 = (char*) malloc(sizeof(char)*8);
temp2[0] = '\0';
strcat(temp2, "gender2");
append(list2, temp2);

appendList(list, list2);
printf("------\n");
tokenize(list);

free(list);
return 0;
}
*/
