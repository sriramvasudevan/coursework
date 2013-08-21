/* 
 * File:   LinkedDef.h
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:31 PM
 */

#ifndef LINKEDDEF_H
#define LINKEDDEF_H

//Node of the linked list.
typedef struct ND {
        char* macro;
        LinkedList* args;
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
int findRepDef(LinkedDef*, char*, LinkedList*, LinkedList*);

#endif
