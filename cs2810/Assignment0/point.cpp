#include<iostream>
#include<cmath>
#define PI 3.1415926

using namespace std ;

//class point has x and y coordinates of a point and various functions to manipulate it. x and y are stored in Cartesian format. 
//Depending on the input/output parameters, appropriate conversions are done
class point{
    public:
        point() {
            x = 0 ;
            y = 0 ;
        }
        void setPoint ( float a, float b , char mode ) {
            if ( mode == 'c' ) { //sets cartesian
                x = a ;
                y = b ;
            }
            if ( mode == 'p' ) { //converts polar to cartesian
                x = a * cos ( b ) ;
                y = a * sin ( b ) ;
            }
        }
        //makes the point its conjugate
        void conjugate () {
            y = - y ;
        }
        //returns the two coordinates as a float array 
        float* getPoint ( char mode ) {
            float* value = new float[2];
            if ( mode == 'c' ) {
                value[0] = x ;
                value[1] = y ;
            }
            if ( mode == 'p' ) {
                value[0] = sqrt ( x*x + y*y ) ;
                value[1] = (180 / PI ) * atan ( y / x ) ;
            }
            return value ;
        }


    private:
        float x , y ;

};


int main() {
    cout<<"How many points do you wish to create?"<<endl ;
    int n, a , b ;
    char c='a' ;
    cin>> n ;
    cout<<"For each point, enter which p for polar and c for complex/normal coordinates, followed by the two coordinates."<<endl ;
    point pt[n] ;
    for ( int i = 0 ; i < n ; i++ ) {
        while ( c != 'p' && c != 'c' )
            cin>>c;
        cin>>a>>b ;
        pt[i].setPoint ( a , b , c ) ;
        c='a';
    }
    float* val ;
    for ( int j = 0 ; j < n ; j++ ) {
        val = pt[j].getPoint ( 'p' ) ;
        cout<<val[0]<<"\t"<<val[1]<<endl ;
    }
}
//distance function
float distance ( point a , point b ) {
    float* ap , *bp ;
    ap = a.getPoint ( 'c' ) ;
    bp = a.getPoint ( 'c' ) ;
    return sqrt ( ( bp[1] - ap[1] ) * ( bp[1] - ap[1] ) - ( bp[2] - ap[2] ) * ( bp[2] - ap[2] ) ) ;
}
