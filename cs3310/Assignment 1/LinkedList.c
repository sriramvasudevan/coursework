/* 
 * File:   LinkedList.c
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:30 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "LinkedList.h"
#include <string.h>

#ifndef TYPE
#define TYPE char*
#endif


/*******************************************************************************
 * 
 * A library of functions to handle singly Linked Lists.
 * 
 ******************************************************************************/

Node* Node_new(TYPE value, Node* next) { 
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

void append(LinkedList* list, TYPE value) {
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

TYPE rem(LinkedList* list) {
    if (list->front == NULL) {
        fprintf(stderr, "ERROR : The list is empty.\n");
        exit(-1);
    }
    TYPE temp = list->front->value;
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

/*
// Test function for Linked List
int main() {
    LinkedList* list = LinkedList_new();
    append(list, "hello");
    char* temp = (char*) malloc(sizeof(char)*8);
    temp[0] = '\0';
    strcat(temp, "genders");
    append(list, temp);
    print(list);

    LinkedList* list2 = LinkedList_new();
    append(list2, "hello2");
    char* temp2 = (char*) malloc(sizeof(char)*8);
    temp2[0] = '\0';
    strcat(temp2, "gender2");
    append(list2, temp2);
    print(list2);

    appendList(list, list2);
    printf("------\n");
    print(list);

    clear(list);
    printf("\n%d\n", is_empty(list));
    free(list);
    return 0;
}
*/
