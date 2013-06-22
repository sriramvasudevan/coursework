/* 
 * File:   main.cpp
 * Author: sriram
 *
 * Created on 6 March, 2013, 5:09 PM
 */

#include <iostream>
#include <cstdlib>
#include <string.h>

#define MAXSIZE 100

using namespace std;

/*******************************************************************************
 * 
 * To evaluate all tree traversals for a given binary tree.
 * 
 ******************************************************************************/

//definition of nodes

class node {
    public:
        int value;
        node *left, *right;

        node() {
            left = right = NULL;
            value = 0;
        }
};

//linked list structure to store nodes

struct llist {
    node* value;
    llist* next;
};

//stack

class stack {
    private:
        llist* first; //pointer to the topmost element of the stack

    public:
        //Constructor function. Initialises the pointer to the topmost element of the stack to NULL

        stack() {
            first = NULL;
        }

        //Function to remove and return the topmost element
        node* pop() {
            if (first == NULL) return NULL; //in case of no element returns NULL
            node* toreturn = first->value;
            first = first->next; //pops the element and removes the reference to it from the stack
            return toreturn;
        }

        node* top() {
            return first->value;
        }

        //pushes value (from argument) onto the stack
        void push(node* value) {
            llist* current = new llist; //create a new element
            current->value = value;
            current->next = first;
            first = current; //put the new element at the top of the stack 
        }

        bool empty() {
            return (first == NULL);
        }
};

class queue {
    private:
        llist* first;
        llist* last;

    public:
        queue() {
            first = last = NULL;
        }

        //pushes value into queue at the end.
        void push(node* value) {
            llist* current = new llist;
            current->value = value;
            if (first == NULL) {
                first = last = current;
                return;
            }
            last->next = current;
            last = last->next;
        }

        //pops first value from queue.
        node* pop() {
            if (!first) return NULL;
            node* toreturn = first->value;
            first = first->next;
            return toreturn;
        }

        bool empty() {
            return (first == NULL);
        }
};

//tree definition
class tree {
    private:
        node* root;

    public:
        tree() {
            root = new node;
        }

        //read in input
        void generate() {
            node *current;
            queue input;
            char temp[MAXSIZE];
            cout << "\nEnter the value for root: ";
            cin >> root->value;
            input.push(root);
            while (!input.empty()) {
                current = input.pop();
                cout << "\nEnter the value for " << current->value << "'s left child: "; //accept left child's value
                cin >> temp;
                if (strcmp(temp, "x")) {
                    node* newnode = new node;
                    newnode->value = atoi(temp);
                    current->left = newnode;
                    input.push(newnode);
                }
                cout << "\nEnter the value for " << current->value << "'s right child: "; //accept right child's value
                cin >> temp;
                if (strcmp(temp, "x")) {
                    node* newnode = new node;
                    newnode->value = atoi(temp);
                    current->right = newnode;
                    input.push(newnode);
                }
            }

        }

        //Preorder traversal
        void preorder() {
            stack output;
            node* current = root;
            cout << "\nPreorder Traversal:\n";
            while (current != NULL || !output.empty()) {
                if (current != NULL) {
                    cout << " " << current->value;
                    output.push(current);
                    current = current->left;
                } else {
                    current = output.pop();
                    current = current->right;
                }
            }
        }

        //Inorder traversal
        void inorder() {
            stack output;
            node* current = root;
            cout << "\nInorder Traversal:\n";
            while (current != NULL || !output.empty()) {
                if (current != NULL) {
                    output.push(current);
                    current = current->left;
                } else {
                    current = output.pop();
                    cout << " " << current->value;
                    current = current->right;
                }
            }
        }

        //Postorder traversal
        void postorder() {
            cout << "\nPostorder Traversal:\n";
            if (root == NULL) {
                return;
            }
            stack output;
            output.push(root);
            node *prev = NULL, *current = NULL;
            while (!output.empty()) {
                current = output.top();
                if (prev == NULL || prev->left == current || prev->right == current) {
                    if (current->left) {
                        output.push(current->left);
                    } else if (current->right) {
                        output.push(current->right);
                    }
                } else if (current->left == prev) {
                    if (current->right) {
                        output.push(current->right);
                    }
                } else {
                    current = output.pop();
                    cout << " " << current->value;
                }
                prev = current;
            }
        }
};

int main() {
    char cont = 'a';
    while (true) {
        cout << "\nPress 'a' to continue, 'q' to quit: ";
        cin >> cont;
        if (cont == 'a') {
            tree t;
            t.generate();
            t.preorder();
            t.inorder();
            t.postorder();
        } else if (cont == 'q') {
            return 0;
        } else {
            cout << "\nEnter a valid input";
            break;
        }
    }
}
