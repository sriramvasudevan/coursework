#include<iostream>
#include<cmath>

using namespace std;

class node {
    public:
        int key;
        int value;
        int s;
        node *left, *right;

        node() {
            s = key = value = 0;
            left = right = NULL;
        }
};

node* meld (node*, node*);

//linked list structure to store strings
struct llist {
    node* value;
    llist* next;
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

class heap {
    private:
        int n;
    public:
        node* root;

        heap() {
            root = NULL;
            n = 0;
        }

        void deleteMax() {
            if (!root) {
                cout<<"\nThe heap is empty.\n";
                return;
            }
            cout<<"\nThe node with greatest key is "<< root->key<<". It's value is "<<root->value<<".\n";
            node* temp = root;
            root = meld(root->left, root->right);
            delete temp;
        }

        void insert (int key, int value=0) {
            node* newnode = new node;
            newnode->key = key;
            newnode->value = value;
            heap temp;
            temp.root = newnode;
            temp.root->s = 1;
            root = meld(root, temp.root);
            n++;
        }

        void printHeap() {
            int levels = floor(log2(n));
            int maxTabs = pow(2,levels);
            node *current;
            queue input;
            input.push(root);
            int count = 0, l=0;
            while(!input.empty()) {
                current = input.pop();
                for (int j=1; j <= maxTabs/(int)(pow(2,l)); j++ ) 
                    cout<<"\t" ;
                cout<<current->key;
                if (current->left) {
                    input.push(current->left);
                }
                if (current->right) {
                    input.push(current->right);
                }

                count++;
                if(count%(int)pow(2,l) == 0) {
                    cout<<"\n";
                    count = 0;
                    l++;
                }
            }

        }

};

node* meld (node* h1, node* h2) {
    if (!h1) {
        return h2;
    }
    if (!h2) {
        return h1;
    }

    node* temp;
    if (h1->key<h2->key) {
        temp = h1;
        h1 = h2;
        h2 = temp;
    }

    h1->right = meld(h1->right, h2);

    if(h1->left) {
        if(h1->left->s < h1->right->s) {
            temp = h1->left;
            h1->left = h1->right;
            h1->right = temp;
        }
        h1->s = h1->right->s + 1;
    }
    else {
        h1->left = h1->right;
        h1->right = NULL;
        h1->s = 1;
    }
    return h1;
}

void menu(heap &h, int no=1) {
    char choice;
    heap temp;
    while(true) {
        cout<<"\nHeap "<<no<<": Enter 'i' to insert, 'd' to delete the greatest key, 'm' to meld another heap, 'p' to print the heap and 'q' to quit.\n";
        cin>>choice;
        switch(choice) {
            case 'i':
                cout<<"Enter the no of elements you wish to insert:\t";
                int n, key;
                cin>>n;
                cout<<"Enter the keys:\n";
                for(int i=0;i<n;i++) {
                    cin>>key;
                    h.insert(key);
                }
                break;
            case 'd':
                h.deleteMax(); 
                break;
            case 'm':
                cout<<"\nCreate the next heap:\n";
                menu(temp, no+1);
                h.root = meld(h.root, temp.root);
                break;
            case 'p':
                h.printHeap();
                break;
            case 'q':
                return;
                break;
            default:
                cout<<"\nIncorrect input.\n";
                break;
        }
    }
}

int main() {
    heap leftist_heap;
    menu(leftist_heap);
    return 0;
}
