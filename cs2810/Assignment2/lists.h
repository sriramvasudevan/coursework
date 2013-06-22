using namespace std;
#ifndef LISTS_H
#define LISTS_H

//the structure which forms the basis for our linked list
struct llist {

    int value ;
    llist* next ;
};

class list {

    public:
        //constructor
        list() {
            start = new llist ;
            start->value = 0 ;
            start->next = NULL ;
            setFlag = 0 ;
        }
        int first() {
            return 1 ;
        }
        int next( int position ) {
            return position + 1 ;
        }
        int getItem( int position ) {
            if (setFlag == 0 ) return 0 ;
            llist* items = start ;
            for ( int i = 1; i < position ; i++ ) {
                items = items->next ;
                if ( items == NULL ) return -1 ;
            }
            return items->value ;

        }
        int remove ( int position ) {
            if ( setFlag == 0 ) return 0 ;
            if ( position == 1 ) {
                if ( start->next == NULL ) {
                    setFlag = 0 ;
                    return 0 ;
                }
                start = start->next ;
                return 0 ;
            }
            llist* items = start ;
            for ( int i = 1 ; i < position-1 ; i++ ) {
                items = items->next ;
                if ( items == NULL ) return -1 ;
            }
            items->next = ( items->next )->next ;
            return 0 ;

        }
        bool final ( int position ) {
            if ( setFlag == 0 ) return 1 ;
            llist* items = start ;
            for ( int i = 1 ; i < position ; i++ ) {
                items = items->next ;
                if ( items == NULL ) return 1 ;
            }
            if ( items->next == NULL ) return 1 ;
            return 0 ;
        }

        int insert ( int element, int position ) {
            if ( position == 1 ) {
                if ( setFlag == 0 ) {
                    append ( element ) ;
                    return 0 ;
                }
                llist* items = new llist ;	
                items->value = element ;
                items->next = start ;
                start = items ;
                return 1 ;
            }
            llist* items = start ;
            for ( int i = 1 ; i < position-1 ; i++ ) {
                items = items->next ;
                if ( items == NULL ) return 1 ;
            }
            llist* item = new llist ;
            item->value = element ;
            item->next = items->next ;
            items->next = item ;
            return 1 ;
        }
        int append ( int element ) {
            if ( setFlag == 0 ) {
                start->value = element ;
                setFlag = 1 ;
                return 1 ;	
            }
            llist* items = start ;
            while ( items->next != NULL ){
                items = items->next ;
            }
            llist* item = new llist ;
            items->next = item ;
            item->value = element ;
            item->next = NULL ;
            return 0 ;

        }
        int print ( ) {
            if ( setFlag == 0 ){
                cout<<"No elements"<<endl ;
                return 0 ;
            }
            int count = 1 ;
            llist* items = start ;
            while ( items != NULL ) {
                cout<<items->value<<"\t" ;
                count++ ;
                if ( count % 5 == 0 ) cout<<endl ;
                items = items->next ;
            }
            cout<<endl ;
            return 1 ; 
        }
    private:
        llist* start ;	//points to the first element
        bool setFlag ; //indicates whether the list contains elements or not
};

#endif
