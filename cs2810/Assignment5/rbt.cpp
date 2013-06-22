#include<iostream>
using namespace std ;

enum colours { RED, BLACK } ;

struct node {
    int key ;
    int value ;
    colours colour ;
    node* parent ;
    node* left ;
    node* right ;
};


class rbtree {
    public:
        rbtree() {
            nil = new node ;
            nil->colour = BLACK ; 
            nil->left = nil ;
            nil->right = nil ;
            nil->parent = nil ;
            root = nil ; //initialises values of nil and puts root as nil
        }
        void insert ( int k, int v= 0 ) {

            node* input ;
            node* curr ;
            node* prev ;
            input = new node ;
            input->value = v ;
            input->key = k ;
            input->colour = RED ;
            prev = nil ;
            curr = root ;
            while ( curr != nil ) {
                prev = curr ;
                if ( k < curr->key ) 
                    curr = curr->left ;
                else curr = curr->right ;
            }
            input->parent = prev ;
            if ( prev == nil ) 
                root = input ;
            else if ( k < prev->key ) 
                prev->left = input ;
            else prev->right = input ;
            input->left = nil ;
            input->right = nil ;
            iFix ( input ) ;
        }	
        int del ( int k ) {

            node *delnode = search(k,1) ;
            node* y = delnode;
            colours y_orig_colour = y->colour;
            node* x ;
            if ( delnode == nil ) return 0 ;
            if (delnode->left == nil) {
                x = delnode->right;
                transplant(delnode,delnode->right);
            }
            else if (delnode->right == nil) {
                x = delnode->left;
                transplant (delnode,delnode->left);
            }
            else {
                y = minimum (delnode->right);
                y_orig_colour = y->colour ;
                x = y->right;
                if (y->parent == delnode) {
                    x->parent = y;
                }
                else {
                    transplant(y, y->right);
                    y->right = delnode->right;
                    y->right->parent = y;
                }
                transplant(delnode, y);
                y->left = delnode->left;
                y->left->parent = y;
                y->colour = delnode->colour;
            }
            if ( x != nil && y_orig_colour == BLACK) {
                dFix (x);
            }
            return 1 ;
        }
        node* search ( int k, int p = 0 ) {

            node* curr = root ;
            while ( curr != nil && k != curr->key  ) {
                if ( k < curr->key ) curr = curr->left ;
                else curr = curr->right ;			
            }
            if ( curr == nil )
                cout<<"Key not found"<<endl ;
            else if ( p == 0 )
                cout<<"The element exists and has value "<<curr->value<<endl ;
            return curr ;

        }
        node* minimum() {
            return minimum ( root ) ;
        }
        node* minimum ( node* start ) {

            node* curr = start ;
            if ( curr == nil ) {
                cout<<"No elements"<<endl ;
                return nil ;
            }
            while ( curr->left != nil ) {
                curr = curr->left ;
            }
            cout<<"The minimum element is "<<curr->value<<" at key "<<curr->key<<" of colour "<<curr->colour<<endl ;
            return curr ;
        }
        node* maximum() {
            return maximum ( root ) ;
        }
        node* maximum( node* start ) {

            node* curr = start ;
            if ( curr == nil ) {
                cout<<"No elements"<<endl ;
                return nil ;
            }
            while ( curr->right != nil ) {
                curr = curr->right ;
            }
            cout<<"The maximum element is "<<curr->value<<" at key "<<curr->key<<" of colour "<<curr->colour<<endl ;
            return curr ;
        }

        int predecessor ( int input ) {

            node* curr = search ( input , 0 ) ;
            if ( curr == nil ) {
                cout<<"No such key exists"<<endl ;
                return 0 ;
            }
            if ( curr->left != nil ){
                curr = maximum ( curr->left ) ;
                cout<<"The predecessor is "<<curr->key<<endl ;
            }
            else {
                if ( curr->parent == nil ) {
                    cout<<"This is the least node"<<endl ;
                    return 0 ;
                }
                node* prev = curr->parent ;
                while ( prev != nil && curr == prev->left ) {
                    curr = prev ;
                    prev = prev->parent ;
                }
                if ( prev == nil ) {
                    cout<<"This is the least node"<<endl ;
                    return 0 ;
                }
                else {
                    cout<<"The predecessor is "<<prev->key<<endl ;
                    return 1 ;
                }
            }
        }

        int successor ( int input ) {

            node* curr = search ( input, 0 ) ;
            if ( curr == nil ){
                cout<<"No such key exists"<<endl ;
                return 0 ;
            }
            if ( curr->right != nil ){
                curr = minimum ( curr->right  ) ;
                cout<<"The successor is "<<curr->key<<endl ;
            }
            else {
                if ( curr->parent == nil ) {
                    cout<<"This is the greatest node"<<endl ;
                    return 0 ;
                }
                node* prev = curr->parent ;
                while ( prev != nil && curr == prev->right ) {
                    curr = prev ;
                    prev = prev->parent ;
                }
                if ( prev == nil ) {
                    cout<<"This is the greatest node"<<endl ;
                    return 0 ;
                }
                else {
                    cout<<"The successor is "<<prev->key<<endl ;
                    return 1 ;
                }
            }
        }
        void traverse ( int start = 0 ) {

            node* curr = search ( start ) ;
            if ( curr == nil ) {
                if ( root == nil && start != 0 ) cout<<"No elements"<<endl ;
                else {
                    if ( start != 0 ) cout<<"Element not found. Beginning at the root"<<endl ;
                    curr = root ;
                }
            }
            cout<<"Current element is "<<curr->value<<" at key "<<curr->key<<" of colour "<<curr->colour<<endl ;
            char c = 'a' ;
            while ( c != 'q' ) {
                cout<<"Enter l for left child, r for right child, p for parent, q to quit traversal."<<endl ;
                cin>>c ;
                if ( c == 'l' ) {
                    if ( curr->left == nil ) cout<<"No more elements on the left"<<endl ;
                    else {
                        curr = curr->left ;
                        cout<<"Current element is "<<curr->value<<" at key "<<curr->key<<" of colour "<<curr->colour<<endl ;
                    }
                }
                if ( c == 'r') {
                    if ( curr->right == nil ) cout<<"No more elements on the right"<<endl ;
                    else {
                        curr = curr->right ;
                        cout<<"Current element is "<<curr->value<<" at key "<<curr->key<<" of colour "<<curr->colour<<endl ;
                    }
                }
                if ( c == 'p') {
                    if ( curr->parent == nil ) cout<<"This element is the root"<<endl ;
                    else {
                        curr = curr->parent ;
                        cout<<"Current element is "<<curr->value<<" at key "<<curr->key<<" of colour "<<curr->colour<<endl ;
                    }
                }
            }
        }
    private:
        node* root ;
        node* nil ;

        void left_rotate ( node* x ) {

            node* y = x->right ;
            x->right = y->left ;
            if ( y->left != nil ) 
                y->left->parent = x ;
            y->parent = x->parent ;
            if ( x->parent == nil ) 
                root = y ;
            else if ( x == x->parent->left ) 
                x->parent->left = y ;
            else x->parent->right = y ;
            y->left = x ;
            x->parent = y ;	
        }
        void right_rotate ( node*x ) {

            node* y = x->left ;
            x->left = y->right ;
            if ( x->left != nil ) 
                x->left->parent = x ;
            y->parent = x->parent ;
            if ( x->parent == nil ) 
                root = y ;
            else if ( x == x->parent->left ) 
                x->parent->left = y ;
            else x->parent->right = y ;
            y->right = x ;
            x->parent = y ;	
        }

        void transplant ( node* u, node* v ) {
            if (u->parent == nil) {
                root = v;
            }
            else if (u == u->parent->left) {
                u->parent->left = v;
            }
            else {
                u->parent->right = v;
            }
            v->parent = u->parent;
        }
        void iFix ( node* x ) {

            node* temp ;
            while ( x->parent->colour == RED ) {
                if ( x->parent == x->parent->parent->left ) {
                    temp = x->parent->parent->right ;
                    if ( temp->colour == RED ) {
                        x->parent->colour = BLACK ;
                        temp->colour = BLACK ;
                        x->parent->parent->colour = RED ;
                        x = x->parent->parent ;
                    }
                    else {
                        if ( x == x->parent->right ) {
                            x = x->parent ;
                            left_rotate ( x ) ;
                        }
                        x->parent->colour = BLACK ;
                        x->parent->parent->colour = RED ;
                        right_rotate ( x->parent->parent ) ;
                    }
                }
                else {
                    temp = x->parent->parent->left ;
                    if ( temp->colour == RED ) {
                        x->parent->colour = BLACK ;
                        temp->colour = BLACK ;
                        x->parent->parent->colour = RED ;
                        x = x->parent->parent ;
                    }
                    else {
                        if ( x == x->parent->left ) {
                            x = x->parent ;
                            right_rotate ( x ) ; //don't know whether left or right
                        }
                        x->parent->colour = BLACK ;
                        x->parent->parent->colour = RED ;
                        left_rotate ( x->parent->parent ) ;
                    }
                }
            }
            root->colour = BLACK ;
        }
        void dFix ( node* fixnode) {

            node* w ;
            while (fixnode!=root && fixnode->colour == BLACK) {
                if (fixnode == fixnode->parent->left) {
                    w = fixnode->parent->right;
                    if (w==nil) {
                        fixnode = fixnode->parent;
                    }
                    else {
                        if (w->colour == RED) {
                            w->colour = BLACK;
                            fixnode->parent->colour = RED;
                            left_rotate(fixnode->parent);
                            w = fixnode->parent->right;
                        }
                        if (w->left->colour == BLACK && w->right->colour==BLACK) {
                            w->colour = RED;
                            fixnode = fixnode->parent;
                            w = fixnode->parent->right ;
                        }
                        else {
                            if (w->right->colour == BLACK) {
                                w->left->colour = BLACK;
                                w->colour = RED;
                                right_rotate(w);
                                w = fixnode->parent->right;
                            }
                            w->colour = fixnode->parent->colour;
                            fixnode->parent->colour = BLACK;
                            w->right->colour = BLACK;
                            left_rotate(fixnode->parent);
                            fixnode = root;
                        }
                    }
                }
                else {
                    w = fixnode->parent->left;
                    if (w==nil) {
                        fixnode = fixnode->parent;
                    }
                    else {
                        if (w->colour == RED) {
                            w->colour = BLACK;
                            fixnode->parent->colour = RED;
                            right_rotate(fixnode->parent); //check left or right
                            w = fixnode->parent->left;
                        }
                        if (w->right->colour == BLACK && w->left->colour==BLACK) {
                            w->colour = RED;
                            fixnode = fixnode->parent;
                            w = fixnode->parent->left ;
                        }
                        else {
                            if (w->left->colour == BLACK) {
                                w->right->colour = BLACK;
                                w->colour = RED;
                                left_rotate(w); //check L or R
                                w = fixnode->parent->left;
                            }
                            w->colour = fixnode->parent->colour;
                            fixnode->parent->colour = BLACK;
                            w->left->colour = BLACK;
                            left_rotate(fixnode->parent); //L or R?
                            fixnode = root;
                        }
                    }
                }
            }
            fixnode->colour = BLACK;
        }
};

int main () {

    char c = 'a' ;
    int a , b ;
    int n ;
    rbtree tree ;
    while ( c!= 'q' ) {
        cout<<"Enter i to insert, d to delete, s to search, u for successor, p for predecessor, t to traverse"<<endl ;
        cin>>c ;
        if ( c == 's' ) {
            cout<<"Enter key"<<endl ;
            cin>>a ;
            tree.search ( a ) ;
        }
        if ( c == 'p' ) {
            cout<<"Enter key"<<endl ;
            cin>>a ;
            tree.predecessor ( a ) ;
        }
        if ( c == 'd' ) {
            cout<<"Enter key"<<endl ;
            cin>>a ;
            tree.del ( a ) ;
        }
        if ( c == 'u' ) {
            cout<<"Enter key"<<endl ;
            cin>>a ;
            tree.successor ( a ) ;
        }
        if ( c == 'i' ) {
            cout<<"k to enter only key, v to enter key and value"<<endl ;
            cin>>c ;
            if ( c == 'k' ) {
                cout<<"How many nodes?"<<endl ;
                cin>>n ;
                cout<<"Enter "<<n<<" keys"<<endl ;
                for ( int i = 0 ; i < n ; i++ ) {
                    cin>>a ;
                    tree.insert ( a ) ;
                }
            }
            if ( c == 'v' ) {
                cout<<"How many nodes?"<<endl ;
                cin>>n ;
                cout<<"Enter "<<n<<" keys and values"<<endl ;
                for ( int i = 0 ; i < n ; i++ ) {
                    cin>>a>>b ;
                    tree.insert ( a , b) ;
                }
            }
        }
        if ( c == 't') tree.traverse() ;
    }
}
