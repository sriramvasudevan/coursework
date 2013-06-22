#include<iostream>

using namespace std ;

struct node {
    node* prev ;
    node* next ;
    node* child ;
    node* parent ;
    int value ;
    int degree ;
    bool marked ;
};

class fheap {

    public:
        fheap() {
            heap = NULL ;
        }
        node* insert ( int value ) {

            node* n = new node ;
            n->value = value ;
            n->prev = n ;
            n->next = n ;
            n->degree = 0 ;
            n->marked = 0 ;
            n->child = NULL ;
            n->parent = NULL ;
            heap = mergenodes ( heap , n ) ;
            return n ;
        }

        void meld ( fheap* tomeld ) {
            heap = mergenodes ( heap , tomeld->heap ) ;
        }

        bool empty() {
            return ( heap == NULL ) ;
        }
        void decreaseKey ( int oldvalue , int value ) {

            node* n = find ( heap,  oldvalue ) ;
            if ( n == NULL ) {
                cout<<"No such value exists"<<endl ;
                return ;
            }
            n->value = value ;
            if ( n->parent == NULL ) return ;
            if(n->value > n->parent->value ) {
                heap = cut ( n );
                node* parent = n->parent;
                n->parent = NULL;
                while ( parent!=NULL && parent->marked ) {
                    heap = cut ( parent );
                    n = parent;
                    parent = n->parent;
                    n->parent = NULL;
                }
                if (parent != NULL && parent->parent != NULL) parent->marked = true;
            }
        }

        node* find ( node* n , int value) {

            if ( n == NULL ) {
                return NULL ;
            }
            do {
                if ( n->value == value ) return n;
                node* toreturn = find ( n->child , value ) ;
                if ( toreturn ) return toreturn ;
                n = n->next ;
            } while ( n != heap ) ;
            return NULL ;
        }

        int getMax() {

            return heap->value ;
        }

        int deleteMax() {

            if ( heap == NULL ) return 0 ;
            int toreturn = heap->value ;
            heap = delMax ( heap ) ;
            return toreturn ;
        }
        void traverse () {

            if ( heap == NULL ) {
                cout<<"Heap is empty."<<endl ;
                return ;
            }
            node* curr = heap ;
            char c = 'a' ;
            while ( c != 'q' ) {

                cout<<"Current element is "<<curr->value<<endl ;
                cout<<"l for left, r for right, p for parent, c for child, q to quit."<<endl ;
                cin>>c ;
                switch ( c ) {

                    case 'l':
                        if ( curr->prev == NULL ) {
                            cout<< "No elements to the left"<<endl ;
                            break ;
                        }
                        else {
                            curr = curr->prev ;
                            break ;
                        }
                    case 'r':
                        if ( curr->next == NULL ) {
                            cout<< "No elements to the right"<<endl ;
                            break ;
                        }
                        else {
                            curr = curr->next ;
                            break ;
                        }
                    case 'p':
                        if ( curr->parent == NULL ) {
                            cout<<"No parent"<<endl ;
                            break ;
                        }
                        else {
                            curr = curr->parent ;
                            break ;
                        }
                    case 'c':
                        if ( curr->child == NULL ) {
                            cout<<"No child"<<endl ;
                            break ;
                        }
                        else {
                            curr = curr->child ;
                            break ;
                        }
                }
            }
        }

    private:

        node* heap ;
        node* mergenodes ( node* a , node* b ) {

            if ( a == NULL ) return b ;
            if ( b == NULL ) return a ;
            if ( a->value < b->value ) {
                node* temp = a ;
                a = b ;
                b = temp ;
            }
            node* a_next = a->next ;
            node* b_prev = b->prev ;
            a->next = b ;
            b->prev = a ;
            a_next->prev = b_prev ;
            b_prev->next = a_next ;
            return a ;
        }

        //removes the marks and parents of all the nodes in n's list
        void unmark ( node* n ) {
            if ( n == NULL ) return ;
            node* temp = n ;
            do {
                temp->marked = 0 ;
                temp->parent = NULL ;
                temp = temp->next ;
            } while ( temp != n ) ;
        }

        node* delMax ( node* n ) {

            unmark ( n->child ) ;
            if ( n->next == n ) {

                n = n->child ;
            } 
            else {
                n->next->prev = n->prev ;
                n->prev->next = n->next ;
                n = mergenodes ( n->next, n->child ) ;
            }
            if ( n == NULL ) return n ;

            node* trees[64]={NULL};

            while (true) {
                if ( trees[n->degree] != NULL ) {

                    node* t = trees[n->degree] ;
                    if (t == n ) break ;
                    trees[n->degree] = NULL ;
                    if (n->value > t->value) {
                        t->prev->next = t->next;
                        t->next->prev = t->prev;
                        addChild ( n, t ) ;
                    }
                    else {
                        t->prev->next = t->next;
                        t->next->prev = t->prev;
                        if (n->next == n) {
                            t->next = t->prev = t;
                            addChild(t,n);
                            n = t;
                        } 
                        else {
                            n->prev->next=t;
                            n->next->prev=t;
                            t->next=n->next;
                            t->prev=n->prev;
                            addChild(t,n);
                            n=t;
                        }
                    }
                    continue;
                } else {
                    trees[n->degree]=n;
                }
                n=n->next;
            }
            node* max = n ;
            do {
                if (n->value > max->value) max = n ;
                n = n->next ;
            } while( n != n );
            return max ;
        }
        void addChild(node* parent ,node* child) {

            child->prev = child->next = child;
            child->parent = parent;
            parent->degree++;
            parent->child = mergenodes (parent->child,child);
        }
        node* cut ( node* n) {
            if ( n->next == n ) {
                n->parent->child = NULL ;
            } else {
                n->next->prev = n->prev;
                n->prev->next = n->next;
                n->parent->child = n->next;
            }
            n->next = n->prev = n;
            n->marked = false;
            return mergenodes (heap , n );
        }

};


int main () {

    fheap heap ;
    char c = 'a' ;
    int n , input ;
    while ( c != 'q' ) {

        cout<<"Press i to insert, d to deleteMax, k to decreaseKey, t to traverse"<<endl ;
        cin>>c ;
        if ( c == 'i' ) {
            cout<<"How many elements?"<<endl ;
            cin>>n ;
            cout<<"Enter "<<n<<" elements."<<endl ;
            while ( n-- ) {

                cin>>input ;
                heap.insert ( input ) ;
            }
        }
        if ( c == 'd' ) {

            input = heap.deleteMax() ;
            cout<<"The max element, which has been deleted is "<<input<<endl ;
        }

        if ( c == 'k' ) {

            cout<<"Enter element to decrease key and the new value"<<endl ;
            cin>>n>>input ;
            heap.decreaseKey ( n , input ) ;
        }

        if ( c == 't' ) {

            heap.traverse () ;
        }
    }

    return 0 ;
}
