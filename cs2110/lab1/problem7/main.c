/* 
 * File:   main.c
 * Author: sriram
 *
 * Created on 30 July, 2012, 3:53 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * Print string in reverse recursively
 */
void reverse(char* string, int length) //function to swap first and last chars of string recursively
{
    if(length<=0) //terminating condition
        return;

    //swap characters
    char temp=*string;
    *string=*(string+length);
    *(string+length)=temp;

    reverse(++string, length-=2); //decrease length by 2 to remove first and last chars
}

int main(int argc, char** argv) {
    char string1[30]; //declare variables

    printf("\nEnter the string:\n");
    fgets(string1,30,stdin); //accept values

    int length;
    for(length=0;string1[length]!='\0';length++); //calculate length with empty loop
    length--; //value of last index of string

    reverse(string1,length);  //reverse string
    printf("\n%s\n",string1); //display result

    return (EXIT_SUCCESS);
}

