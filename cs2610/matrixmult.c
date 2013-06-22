#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main() {
	int a[10][20] , b[20][30], i , j , k , random , limit = 536870911 ;
	long long int c[10][30];	
	srand(999999) ;
	printf ( "%d\n" , sizeof(long int) ) ;
	FILE *fptr ;
	fptr = fopen ( "matrix.txt", "w" ) ;
	for ( i = 0 ; i <= 199 ; i++ ) {
		random = rand()%limit ;
		fprintf ( fptr ,  "%d\n" , random ) ;
		a[i/20][i%20] = random ;
	}
	for ( i = 0 ; i <= 599 ; i++ ) {
		random = rand()%limit ;
		fprintf ( fptr, "%d\n", random ) ;
		b[i/30][i%30] = random ;
	} 
	for ( i = 0 ; i <= 9 ; i++ ) {
		for ( j = 0 ; j <= 29 ; j++ ) {
			c[i][j] = 0 ;
			for ( k = 0 ; k <= 19 ; k++ ) {
				c[i][j] += (long long int)a[i][k] * b[k][j] ;
			}
			fprintf ( fptr , "%lld\n" , c[i][j] ) ; 
		}
	}	
}
