#include<iostream>

using namespace std;

//Element of the Binomial Heap.
class node {
    public:
        int key;
        int degree;
        node* parent;
        node* child;
        node* sibling;
        node(int value) {
            key=value;
            degree=0;
            parent=child=sibling=NULL;
        }
};

//Element of the stack.
class llist {
    public:
        node* element;
        llist* next;
        llist() {
            element = NULL;
            next = NULL;
        }
};

//Stack class definition
class stack {
    private:
        llist* top;

    public:
        stack* next;
        //Constructor
        stack() {
            top = NULL;
            next = NULL;
        }

        //Push a node
        void push(node* element) {
            llist* newelement = new llist;
            newelement->element = element;
            newelement->next = top;
            top = newelement;
        }

        //Pop a node
        node* pop() {
            if(!top) {
                return NULL;
            }
            node* temp = top->element;
            llist* delelement = top;
            top = top->next;
            delete delelement;
            return temp;
        }

        //Peek at the node at the top of the stack
        node* peek() {
            if(top) {
                return top->element;
            }
            else {
                return NULL;
            }
        }

        //empty the stack
        void empty() {
            llist* delelement;
            while(top) {
                delelement= top;
                top = top->next;
                delete delelement;
            }
        }
};    

//Stackofstacks class definition
class stackofstacks {
    private:
        stack* top;

    public:
        //Constructor
        stackofstacks() {
            top = NULL;
        }

        //Push a node
        void push(stack* element) {
            element->next = top;
            top = element;
        }

        //Pop a node
        stack* pop() {
            if(!top) {
                return NULL;
            }
            stack* temp = top;
            top = top->next;
            return temp;
        }

        //empty the stack
        void empty() {
            stack* delstack;
            while(top) {
                delstack = top;
                top = top->next;
                delstack->empty(); //Empty the stack to be deleted
                delete delstack;
            }
        }
};    

//Binomial Heap class
class binomial {
    private:
        node* findNode(node*, int);
        node* reverseList(node*);

    public:
        node* head;

        //Constructor
        binomial() {
            head=NULL;
        }

        void insertNode(int);
        int deleteMax();
        void decreaseKey();
        void traverseHeap();
};

//Helper functions
//Links the tree rooted at y as the leftmost child of the tree rooted at z.
void linkTrees(node* y, node* z)
{
    y->parent=z;
    y->sibling=z->child;
    z->child=y;
    z->degree++;
}

//Returns a Binomial Heap that is the result of the merging of the root lists of the 2
//binomial heaps passed as arguments.
binomial mergeHeaps(binomial H1, binomial H2) {
    binomial H;
    node* y = H1.head;
    node* z = H2.head;
    node* prev_y = NULL;
    node* temp;
    if(y) {
        H.head = y;
    }
    else {
        H.head = z;
        return H;
    }

    while(y!=NULL&&z!=NULL) {
        if(y->degree<=z->degree) {
            prev_y = y;
            y=y->sibling;            
        }
        else {
            temp = z->sibling;
            z->sibling = y;
            if(prev_y) {
                prev_y->sibling = z;
            }
            else {
                H.head = z;
            }
            prev_y = z;
            z = temp;
        }	  
    }  
    if(z) {
        while(z) {
            prev_y->sibling = z;
            prev_y = z;
            z = z->sibling;
        }
    }
    return H;
}

//Merges 2 binomial heaps
binomial unionHeaps(binomial H1,binomial H2) {
    binomial H = mergeHeaps(H1, H2);
    if(H.head==NULL) {
        return H;
    }
    node* prev_x = NULL;
    node* x = H.head;
    node* next_x = x->sibling;
    while(next_x) { 
        if((x->degree!=next_x->degree)||((next_x->sibling!=NULL)&&(next_x->sibling->degree==x->degree))) { //Cases 1 and 2
            prev_x=x;
            x=next_x;
        }
        else
        {
            if(x->key>=next_x->key)  //Case 3
            { 
                x->sibling=next_x->sibling;   
                linkTrees(next_x, x);
            }
            else                     //Case 4
            {
                if(!prev_x) {
                    H.head=next_x;
                }
                else {
                    prev_x->sibling=next_x;
                }
                linkTrees(x, next_x);
                x=next_x;
            }
        }
        next_x = x->sibling;    
    }
    return H;   
}

//Binomial Heap class member function definitions
//Finds a node, given the key.
node* binomial::findNode(node* head, int key) { 
    node* x = head;
    node* p = NULL;
    if(x->key==key) {
        p=x;
        return p;
    }
    if(x->child!=NULL&&p==NULL) {
        p = findNode(x->child, key);
    }
    if(x->sibling!=NULL&&p==NULL) {
        p = findNode(x->sibling, key);
    }
    return p;
}

//Reverses the root list
node* binomial::reverseList(node* y) {
    node* newhead = y;
    if(y->sibling!=NULL)
    {
        newhead = reverseList(y->sibling);
        y->sibling->sibling=y;
        y->sibling = NULL;
    }
    return newhead;
}

//Inserts a node with the passed key value
void binomial::insertNode(int key) {
    node* x = new node(key);
    binomial tempHeap;
    tempHeap.head = x;
    *this = unionHeaps(*this, tempHeap);
}

//Deletes the node with the greatest key from the heap
int binomial::deleteMax() { 
    if(!head) {
        cout<<"\nHeap is empty.\n";
        return 0; 
    }
    node* t=NULL;
    node* x = head;
    int max=x->key;
    node* p=x;
    //Find the root with the greatest key in the root list
    while(p->sibling!=NULL)
    {
        if(p->sibling->key>max) {
            max=p->sibling->key;
            t=p;
            x=p->sibling;
        }
        p=p->sibling;  
    }

    //Remove x from the root list
    if(t==NULL) {
        head = x->sibling;
    }
    else {
        t->sibling=x->sibling;
    }
    int retval = x->key; //Store the key
    if(x->child!=NULL) {
        binomial Hr;
        Hr.head = reverseList(x->child);
        *this = unionHeaps(*this, Hr);
    }
    delete x;
    return retval;
}

node* maxchild(node* initial) {
    if(!initial) {
        return NULL;
    }
    node* maxnode = initial;
    int max = maxnode->key;
    node* i = maxnode->sibling;
    while(i) {
        if(i->key>max) {
            max = i->key;
            maxnode = i;
        }
        i = i->sibling;
    }
    return maxnode;
}

//Decreases the key value of a node, given its original key and new key values
void binomial::decreaseKey() {
    if(!head) {
        cout<<"\nHeap is empty.\n";
        return;
    }
    int findkey, decval;
    cout<<"Enter element to decrease key and the new value"<<endl ;
    cin>>findkey>>decval ;
    node* p = findNode(head, findkey);
    if(!p) {
        cout<<"\nError: A node with this key doesn't exist.";
        return;
    }
    if(decval>p->key) {
        cout<<"\nError: The new key is greater than the current value.";
        return;
    }
    //decval<=p->key
    p->key=decval;
    node* y=p;
    node* z=maxchild(p->child);
    int temp;
    //Push the node down, since its key has been decreased.
    while(z!=NULL&&y->key<z->key) {
        temp=y->key;
        y->key=z->key;
        z->key=temp;
        y=z;
        z=maxchild(y->child);
    }
    cout<<"\nKey reduced.";  
}

//Function for heap traversal.
void binomial::traverseHeap () {
    if (!head) {
        cout<<"Heap is empty.\n";
        return ;
    }

    stack* prevnodes = new stack; //Stack to keep track of the visited siblings, to facilitate leftwards traversal.
    stackofstacks stacklist;
    node* curr = head ;
    char c = 'a' ;
    while ( c != 'q' ) {

        cout<<"Current element is "<<curr->key<<endl ;
        cout<<"l for left, r for right, p for parent, c for child, q to quit."<<endl ;
        cin>>c ;
        switch ( c ) {

            case 'l':
                if ((prevnodes->peek() == NULL)||(prevnodes->peek()->sibling!=curr)) {
                    cout<< "No elements to the left"<<endl ;
                }
                else {
                    //Pop topmost element from the stack, if the topmost element's sibling is the current element.
                    curr = prevnodes->pop();
                }
                break;
            case 'r':
                if ( curr->sibling == NULL ) {
                    cout<< "No elements to the right"<<endl ;
                    break ;
                }
                else {
                    //Add the current node to the stack
                    prevnodes->push(curr);
                    curr = curr->sibling ;
                    break ;
                }
            case 'p':
                if ( curr->parent == NULL ) {
                    cout<<"No parent"<<endl ;
                    break ;
                }
                else {
                    delete prevnodes;
                    prevnodes = stacklist.pop();
                    curr = curr->parent ;
                    break ;
                }
            case 'c':
                if ( curr->child == NULL ) {
                    cout<<"No child"<<endl ;
                    break ;
                }
                else {
                    stacklist.push(prevnodes);
                    prevnodes = new stack;
                    curr = curr->child ;
                    break ;
                }
        }
    }
    stacklist.empty();
}

//Other functions
//Provides the menu for the list of operations on a heap
binomial menu(int heapno=1) {
    binomial H;
    int n, input;
    char c = 'y';
    while(c!='q') {
        cout<<"\nHeap "<<heapno<<": Press i to insert, d to delete max, m to meld, k to decrease key, t to traverse and q to quit:\n";
        cin>>c ;
        if ( c == 'i' ) {
            cout<<"How many elements?"<<endl ;
            cin>>n ;
            cout<<"Enter "<<n<<" elements."<<endl ;
            while ( n-- ) {
                cin>>input ;
                H.insertNode(input) ;
            }
        }
        if ( c == 'd' ) {
            input = H.deleteMax();
            if (input) {
                cout<<"The max element, which has been deleted is "<<input<<endl ;
            }
        }

        if (c=='m') {
            binomial merge = menu(heapno+1); //Call menu again to create another binomial heap.
            H = unionHeaps(H, merge);
            cout<<"Heaps melded."<<endl;
        }

        if (c=='k') {
            H.decreaseKey();
        }

        if ( c == 't' ) {
            H.traverseHeap() ;
        }
    }
    return H;
}

//Main function
int main()
{
    binomial H = menu();
    return 0;
}
