/* 
 * File:   main.c
 * Author: sriram
 *
 * Created on 30 July, 2012, 2:34 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * Add all natural numbers below N that are multiples of X or Y 
 */
int main(int argc, char** argv) {
    int n,x,y,i;  //variable declarations
    long sum=0;
    
    printf("\nEnter N, X and Y:\n");
    scanf("%d %d %d",&n, &x, &y);  //accept values
    
    if(n>0&&x>0&&y>0)
    {
        for(i=1;i<n;i++)
        {
                if ((i%x==0)||(i%y==0))  //check if multiple of x or y
                    sum+=i;
        }
        
        printf("\nsum=%ld\n",sum); //display result
    }
    
    else
    {
        printf("\nEntered Values aren't natural numbers.\n");
    }
    return (EXIT_SUCCESS);
}

