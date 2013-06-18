/* 
 * File:   main.c
 * Author: sriram
 *
 * Created on 30 July, 2012, 3:08 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * Print a pattern using alphabets
 */
int main(int argc, char** argv) {
    int n;
    
    printf("\nEnter the Number of alphabets:\n");
    scanf("%d",&n); //accept value
    
    if(n>0&&n<=26)
    {
        char i=64+n; //Greatest alphabet to appear in the pattern
        for(;i>='A';i--) //each iteration prints one line of pattern
        {
                char j='A';
                
                //prints first portion of the line
                if(i==64+n) //if first iteration, don't print greatest alphabet
                for(;j<i;j++)
                        printf("%c",j);
                else //else print greatest alphabet
                    for(;j<=i;j++)
                        printf("%c",j);
        
                int line=64+n-i; //line no
                int k;
                
                //prints spaces
                for(k=0; k<2*line-1; k++)
                printf(" ");
                
                //prints last portion of the line
                for(j=i;j>='A';j--) //print in reverse
                        printf("%c",j);
        
                printf("\n"); //newline
        }
    }
    
    else
    {
        printf("\nEnter a valid number of alphabets.\n");
    }
    return (EXIT_SUCCESS);
}

