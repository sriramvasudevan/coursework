/* 
 * File:   main.c
 * Author: sriram
 *
 * Created on 5 August, 2012, 2:45 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*
 * Display d+1, where 2^d<N<2^(d+1); N is a natural no
 */
int main(int argc, char** argv) {
    int n,d;  //variable declarations

    printf("\nEnter N:\n");
    scanf("%d",&n); //accept values

    if(n>0)
    {
        for(d=0;pow(2,d)<=n;d++); //empty loop; terminates when 2^d>N

        printf("\nd+1=%d\n",d);  //display d
    }

    else
    {
        printf("\nN must be a natural number.");
    }
    return (EXIT_SUCCESS);
}

