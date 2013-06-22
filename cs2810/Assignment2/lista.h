using namespace std;
#ifndef LISTA_H
#define LISTA_H
class list {

    public:
        //constructor. last is the index of the last item.
        list() {
            last = 0 ;
            for ( int i = 0 ; i < 1000 ; i++ ) items[i] = 0 ;
        }
        //returns 1 because that's the first item.
        int first () {
            return 1 ;
        }
        //next index of the array
        int next( int position ) {
            return position + 1 ;
        }
        //returns the item
        int getItem( int position ) {
            return items[position] ;
        }
        //removes an item by left-shifting all the subsequent items and decrementing last
        void remove ( int position ) {
            for ( int i = position + 1 ; i <= last ; i++ ) {
                items[i-1] = items[i] ;
            }
            last-- ;
        }
        //returns 1 if position is final
        bool final ( int position ) {
            if ( last == 0 ) return 1 ;
            return ( position == last) ? 1 : 0 ;
        }
        //inserts element at position
        int insert ( int element, int position ) {
            if ( position > last ) {
                append ( element ) ;
                return 0 ;
            }
            last++ ;
            for ( int i = last ; i > position ; i-- ) {
                items[i] = items[i-1] ;	
            }
            items[position] = element ;
        }
        //appends the element
        void append ( int element ) {
            last++ ;	
            items[last] = element ;
        }
        //prints the list
        void print ( ) {
            if (last == 0 ) cout << "No elements"<<endl ;
            for ( int i = 1 ; i <= last ; i++ ) {
                cout<<items[i]<<"\t";
                if ( i%5 == 0 ) cout<<endl ;
            }
            cout<<endl ;
        }
    private:
        int items[1000] ;
        int last ;

};

#endif
