/* 
 * File:   main.c
 * Author: sriram
 *
 * Created on 30 July, 2012, 2:53 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * Find GCD and LCM of X and Y
 */
int gcd_recursive(int x, int y) //function to obtain GCD recursively
{
    if (y==1)
        return 1;
    if (y==0)
        return x;
    x%=y;
    gcd_recursive(y,x);
}

int main(int argc, char** argv) {
    int x, y; //declare variables

    printf("\nEnter X and Y:\n"); 
    scanf("%d %d", &x, &y); //accept values for x and y

    if(x>0&&y>0)
    {
        int gcd = gcd_recursive(x,y);  //find gcd
        int lcm = x*y/gcd; //find lcm

        printf("GCD:%d  LCM:%d\n", gcd, lcm); //display results
    }

    else
    {
        printf("\nX and Y must be natural numbers.");
    }
    return (EXIT_SUCCESS);
}

