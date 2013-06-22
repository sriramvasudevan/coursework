using namespace std;
#ifndef LISTS_H
#define LISTS_H

struct dlist {

    int value ;
    dlist* next ;
    dlist* prev ;
};

class list {

    public:
        list() {
            start = new dlist ;
            start->value = 0 ;
            start->next = start ;
            setFlag = 0 ;
            start->prev = start ;
        }
        int first() {
            return 1 ;
        }
        int next( int position ) {
            return position + 1 ;
        }
        int getItem( int position ) {
            if (setFlag == 0 ) return 0 ;
            if (position == 1 ) return start->value ;
            dlist* items = start ;
            for ( int i = 1; i < position ; i++ ) {
                items = items->next ;
                if ( items == start ) return -1 ;
            }
            return items->value ;

        }
        int remove ( int position ) {
            if ( setFlag == 0 ) return 0 ;
            if ( position == 1 ) {
                if ( start->next == start ) {
                    setFlag = 0 ;
                    return 0 ;
                }
                (start->next)->prev = start->prev ;
                (start->prev)->next = start->next ;
                start = start->next ;
                return 0 ;
            }
            dlist* items = start ;
            for ( int i = 1 ; i < position ; i++ ) {
                items = items->next ;
                if ( items == start ) return -1 ;
            }
            (items->prev)->next = items->next ;
            (items->next)->prev = items->prev ;
            return 0 ;

        }
        bool final ( int position ) {
            if ( setFlag == 0 ) return 1 ;
            dlist* items = start ;
            for ( int i = 1 ; i < position ; i++ ) {
                items = items->next ;
                if ( items == start ) return 1 ;
            }
            if ( items->next == start ) return 1 ;
            return 0 ;
        }

        int insert ( int element, int position ) {
            if ( position == 1 ) {
                if ( setFlag == 0 ) {
                    append ( element ) ;
                    return 0 ;
                }
                dlist* items = new dlist ;	
                items->value = element ;
                items->next = start ;
                items->prev = start->prev ;
                start->prev = items ;
                (items->prev)->next = items ;
                start = items ;
                return 1 ;
            }
            dlist* items = start ;
            for ( int i = 1 ; i < position-1 ; i++ ) {
                items = items->next ;
                if ( items == start ) return 1 ;
            }
            dlist* item = new dlist ;
            item->value = element ;
            item->next = items->next ;
            item->prev = items ;
            (items->next)->prev = item ;
            items->next = item ;
            return 1 ;
        }
        int append ( int element ) {
            if ( setFlag == 0 ) {
                start->value = element ;
                setFlag = 1 ;
                return 1 ;	
            }
            dlist* items = start ;
            while ( items->next != start ){
                items = items->next ;
            }
            dlist* item = new dlist ;
            item->next = items->next ;
            item->prev = items ;
            (items->next)->prev = item ;
            items->next = item ;
            item->value = element ;
            return 0 ;

        }
        int print ( ) {
            if ( setFlag == 0 ) {
                cout<<"No elements"<<endl ;
                return 0 ;
            }
            int count = 1 ;
            dlist* items = start->next ;
            cout<<start->value<<"\t" ;
            while ( items != start ) {
                cout<<items->value<<"\t" ;
                count++ ;
                if ( count % 5 == 0 ) cout<<endl ;
                items = items->next ;
            }
            cout<<endl ;
            return 1 ;
        }
    private:
        dlist* start ;	
        bool setFlag ;
};

#endif
