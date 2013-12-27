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
