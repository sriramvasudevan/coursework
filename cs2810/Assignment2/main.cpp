/* 
 * File:   main.cpp
 * Author: sriram
 *
 * Created on 4 February, 2013, 1:26 PM
 */

#include<iostream>
#include "listd.h"

using namespace std;

//executes the purge.
void purge ( list* elements ) {

    int i = elements->first() , j ; //we use integer indexing; the specifics are taken care of by list
    while ( !elements->final(i))  { //upto the penultimate element
        j = elements->next (i) ; //j is set to the element following i
        while ( !elements->final(j) ) {
            if ( elements->getItem (i) == elements->getItem (j) ) {
                elements->remove (j) ;
            }
            else j = elements->next (j) ; //this loop executes purge upto penultimate element
        }
        if ( elements->getItem (i) == elements->getItem (j) ) elements->remove(j) ; //this loop executes purge for the last element
        if ( !elements->final(i)) i = elements->next (i) ; //next iteration
    } 
}

//used to append several items to the list
void append ( list* elements ) {

    int n, input ;
    cout << "Enter number of elements to append" << endl ;
    cin >> n ;	
    cout<< "Enter the elements" << endl ;
    for ( int i = 1 ; i <= n ; i++ ) {
        cin>>input ;
        elements->append (input) ;
    }
}
//used to insert items at given positions
void insert ( list* elements ) {

    int n, input[2] ;
    cout << "Enter number of elements to insert" << endl ;
    cin >> n ;
    cout << "For each element, enter position followed by element" << endl ;
    for ( int i = 1 ; i <= n ; i++ ) {
        cin>>input[0]>>input[1] ;
        elements->insert ( input[1] , input[0] ) ;
    }
}

void remove ( list* elements ){

    cout<<"Enter position" ;
    int n ;
    cin>>n ;
    elements->remove (n ) ;
}
int main() {

    list elements ;
    char c = 'i' ;
    while ( c != 'q' ) {
        cout << "Enter a to append elements and i to insert elements. Press q to finish inputting. To print current list, press p"<< endl ;
        cin >> c ;
        if ( c == 'p' ) elements.print() ;
        if ( c == 'a' ) append ( &elements ) ;
        if ( c == 'i' ) insert ( &elements ) ;
        if ( c== 'r' ) remove ( &elements ) ;
    }
    purge ( &elements ) ;
    cout<<"List after purging:"<<endl ;
    elements.print() ;	
    return 0 ;
}

