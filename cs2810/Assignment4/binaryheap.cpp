/* 
 * File:   main.cpp
 * Author: sriram
 *
 * Created on 6 March, 2013, 5:50 PM
 */

#include <cstdlib>
#include<iostream>
#include<string>
#include<cmath>

#define MAXSIZE 1000
using namespace std ;

class heap {
    public:
        //Constructor function. Initialises size of the heap to 0.
        heap() { 
            size = 0 ;
        }
        //extractMin function. Removes and returns the least element and then reorders the heap.
        int extractMin () {
            //Checks if heap is empty
            if ( size == 0 ) {
                cout<<"Heap is empty."<<endl ;
                return 0 ;
            }
            int toReturn = elements[0] ;
            size -- ;			
            elements[0] = elements[size] ;
            heapify_topbottom( 0 ) ; //decreases the size, puts the last element on top and calls heapify to make it into heap order
            return toReturn ; //returns the minimum value
        }
        //insert function. Takes argument input and inserts it into the heap while maintaining the heap's properties
        void insert ( int input ) {
            elements[size] = input ; //inserts the input value	
            heapify_bottomtop ( size ) ;//maintains heap order
            size ++ ; //increments the size
        }
        //prints the heap
        void print ( ) {

            int nLevels = lg ( size ) + 1 ;
            int nElements ; //used to store the number of elements in each row
            int maxTabs = pow ( 2 , nLevels ) ; //maxTabs is the number of elements in the last row
            int currElement = 0 ;
            for ( int i = 0 ; i < nLevels ; i++ ) { //prints out all the elements, level by level 
                nElements = pow ( 2 , i ) ;
                while ( nElements -- && currElement < size ) {
                    for ( int j = 1 ; j <= maxTabs / ( pow ( 2 , i )+ 1 ) ; j++ ) 
                        cout<<"\t" ;
                    cout<<elements[currElement] ;
                    currElement++ ;
                }
                cout<<endl ;
            }
        }
    private:

        //checks for heap order of elements[index] with its parent and does necessary repairs
        int heapify_bottomtop ( int index ) {

            int temp ; // for swapping
            if ( index == 0 ) return 0 ; //if we are at the top of the heap, we are done
            if ( elements[index] < elements[(index - 1)/2] ) { //checks for heap order between index and its parent
                swap ( index , ( index - 1 ) / 2 ) ; //if there is a violation, swap
                heapify_bottomtop ( (index-1)/2) ;//and recursively call heapify for the parent
            }	
            return 1 ;
        }
        //checks for heap order of elements[index] with its children and does necessary repairs
        int heapify_topbottom ( int index ) {

            if ( 2*index + 1 >= size ) return 0 ;//if it is a leaf node, we are done 
            if ( 2*index + 2 == size ) {//if it has only a left child, we do a  swap if necessary and we are done
                if ( elements[2*index + 1] < elements[index] ) 
                    swap ( index , 2*index + 1 ) ;
                return 0 ;
            }
            //for an internal node, we find the lesserChild and check for heap order property
            int lesserChild = ( elements[2*index + 2] < elements[2*index + 1] ) ? 2*index+2 : 2*index+1 ; 
            if ( elements[lesserChild] < elements[index] ) {
                swap ( index , lesserChild ) ; //if there is a violation, we swap
                heapify_topbottom ( lesserChild ) ; //and recursively call heapify for the child
            }
            return 1 ;
        }
        //swaps elements[i] with elements[j]
        void swap ( int i , int j ) {

            int temp = elements [i] ;
            elements [i] = elements [j] ;
            elements[j] = temp ;
        }
        //log function. returns floor of log to the base 2 of n. used for printing
        int lg ( int n ) {
            int toReturn = 0 ;
            n /= 2 ;
            while ( n > 0 ) {
                toReturn ++ ;
                n /= 2 ;
            }
            return toReturn ;
        }
        //the array containing the heap
        int elements[MAXSIZE] ;
        //the size. It is equal to the number of elements in the heap. It is the index of insertion of next element since 
        //the heap begins from index 0
        int size ;
};

int main ( ) {
    heap minheap ;
    char c = 'a' ;
    int input, n ;
    while ( c != 'q' ) { //while loop to take user commands
        cout<<"Enter i to insert, m to insert multiple elements, e to extract minimum element, p to print the current heap and q to exit program."<<endl ;
        cin>>c ;
        if ( c == 'i' ) {
            cout<<"Enter the element to insert!"<<endl ;
            cin>>input ;
            minheap.insert (input) ;
        }
        if ( c == 'm' ) {
            cout<<"How many elements do you want to insert?"<<endl ;
            cin>>n ;
            cout<<"Enter "<<n<<" elements separated by spaces."<<endl ;
            while ( n-- ) {
                cin>>input ;
                minheap.insert (input) ;
            }
        }
        if ( c == 'e' ) 
            cout<<"The minimum element is "<<minheap.extractMin()<<endl ;
        if ( c == 'p' ) 
            minheap.print() ;
    }
    return 1 ;
}
