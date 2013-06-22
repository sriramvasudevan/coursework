/* 
 * File:   LinkedList.h
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:31 PM
 */

#ifndef LINKEDLIST_H
#define LINKEDLIST_H

#ifndef TYPE
#define TYPE int
#endif

//Node of the linked list.
class Node {
    public:
        TYPE value;
        Node *next;
        Node *prev;

        Node() {
            value = 0;
            next = NULL;
            prev = NULL;
        }

        Node(TYPE num, Node* next_node = NULL, Node* prev_node = NULL) {
            value = num;
            next = next_node;
            prev = prev_node;
            if (next_node != NULL) {
                next_node->prev = this;
            }
            if (prev_node != NULL) {
                prev_node->next = this;
            }
        }
};

class LinkedList {
    public:
        Node * least_significant;
        Node * most_significant;

        LinkedList();
        LinkedList(const LinkedList &);
        bool is_empty();
        unsigned int length();
        void insert_most_significant(TYPE);
        void insert_least_significant(TYPE);
        TYPE pop_most_significant();
        TYPE pop_least_significant();
        void clear();
        void print();
        ~LinkedList();
};

#endif
