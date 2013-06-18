/* 
 * File:   main.c
 * Author: sriram
 *
 * Created on 30 July, 2012, 3:27 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * Find binomial coefficient recursively
 */
long binomial(int n, int r) //recursive function to compute nCr
{
    //terminating cases
    if (n<r) 
        return 0;
    if (r==0||r==n)
        return 1;
    if(r==1||r==n-1)
        return n;
    
    //nCr=(n-1Cr)+(n-1Cr-1)
    long sum=binomial(n-1,r)+binomial(n-1,r-1);
    return sum;
}

int main(int argc, char** argv) {
    int n,r; //declare variables
    
    printf("\nEnter n and r for nCr calculation:\n");
    scanf("%d %d",&n,&r); //accept values
    
    if(n>=0&&r>=0)
    {
        long coeff=binomial(n,r);
        printf("\n%ld\n",coeff); //display result
    }
    
    else
    {
        printf("\nn and r cannot be negative numbers.\n");
    }
    return (EXIT_SUCCESS);
}

