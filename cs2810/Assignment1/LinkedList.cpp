/* 
 * File:   LinkedList.cpp
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:30 PM
 */

#include <iostream>
#include <cstdlib>
#include "LinkedList.h"

#ifndef TYPE
#define TYPE int
#endif


/*******************************************************************************
 * 
 * A library of functions to handle doubly Linked Lists.
 * 
 ******************************************************************************/

using namespace std;

LinkedList::LinkedList() {
    most_significant = NULL;
    least_significant = NULL;
}

LinkedList::LinkedList(const LinkedList& list) {
    most_significant = NULL;
    least_significant = NULL;
    for (Node* i = list.most_significant; i != NULL; i = i->next) {
        insert_least_significant(i->value);
    }
}

void LinkedList::insert_most_significant(TYPE value) {
    Node* new_node = new Node(value, most_significant, NULL);
    most_significant = new_node;
    if (least_significant == NULL) {
        least_significant = new_node;
    }
}

void LinkedList::insert_least_significant(TYPE value) {
    Node* new_node = new Node(value, NULL, least_significant);
    least_significant = new_node;
    if (most_significant == NULL) {
        most_significant = new_node;
    }
}

bool LinkedList::is_empty() {
    return (most_significant == NULL);
}

unsigned int LinkedList::length() {
    unsigned int length = 0;
    for (Node* i = most_significant; i != NULL; i = i->next) {
        ++length;
    }
    return length;
}

TYPE LinkedList::pop_most_significant() {
    if (most_significant == NULL) {
        cerr << "ERROR : The list is empty." << endl;
        exit(-1);
    }
    TYPE temp = most_significant->value;
    Node* old_most_significant = most_significant;
    most_significant = most_significant->next;
    if (most_significant != NULL) {
        most_significant->prev = old_most_significant->prev; //should be NULL.
        if (most_significant->next == NULL) {
            //then only 1 element in list.
            least_significant = most_significant;
        }
    } else {
        //no elements left.
        least_significant = most_significant;
    }

    delete old_most_significant;
    return temp;
}

TYPE LinkedList::pop_least_significant() {
    if (most_significant == NULL) {
        cerr << "ERROR : The list is empty." << endl;
        exit(-1);
    }
    TYPE temp = least_significant->value;
    Node* old_least_significant = least_significant;
    least_significant = least_significant->prev;

    if (least_significant != NULL) {
        least_significant->next = old_least_significant->next; //should be NULL.
        if (least_significant->prev == NULL) {
            //then only 1 element in list.
            most_significant = least_significant;
        }
    } else {
        //no elements left.
        most_significant = least_significant;
    }

    delete old_least_significant;
    return temp;
}

void LinkedList::clear() {
    for (Node* i = most_significant; i != NULL; i = i->next) {
        pop_most_significant();
    }
}

LinkedList::~LinkedList() {
    clear();
}

void LinkedList::print() {
    for (Node* i = most_significant; i != NULL; i = i->next) {
        cout << (i->value);
    }
    cout << endl;
}

/* To test linked lists.
   int main() {
   LinkedList list;
   for (TYPE i = 19; i < 25; i++) {
   list.insert_most_significant(i);
   }
   LinkedList list2(list);
   list2.insert_most_significant(99999);
   list2.pop_least_significant();
   list2.print();
   list.print();

   list.insert_least_significant(555);
   list.print();
   cout << list.is_empty() << endl;
   cout << list.length() << endl;
   list.clear();
   cout << list.length() << endl;
   return 0;
   }
   */
