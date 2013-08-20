/* 
 * File:   LinkedList.h
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:31 PM
 */

#ifndef LINKEDLIST_H
#define LINKEDLIST_H

#ifndef TYPE
#define TYPE char*
#endif

//Node of the linked list.
typedef struct N {
        TYPE value;
        struct N *next;
}Node;

//Linked List
typedef struct L {
        Node* front;
        Node* back;
}LinkedList;

//Functions
LinkedList* LinkedList_new();
void clear(LinkedList*);
TYPE rem(LinkedList* list);
int is_empty(LinkedList*);
void appendList(LinkedList*, LinkedList*);
void print(LinkedList*);
void append(LinkedList*, TYPE);
Node* Node_new(TYPE, Node*);

#endif
