/* 
 * File:   main.c
 * Author: sriram
 *
 * Created on 30 July, 2012, 4:12 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

/*
 * Check if string is palindrome
 */
void palindrome(char* string, int length) //function to compare first and last chars of string recursively
{
    if(length<=0) //terminating condition
    {
        printf("\n1\n"); //A Palindrome!
        return;
    }
    
    //compare characters
    if (isalpha(*string)&&isalpha(*(string+length))) //If first and last characters are alphabets
    {
        if (tolower(*string)==tolower(*(string+length))) //If they match
                palindrome(++string, length-=2); //decrease length by 2 to remove first and last chars
        else
        {
                printf("\n0\n"); //Not a palindrome
                return;
        }
    }
    
    else
    {
        if ((!isalpha(*string))&&(!isalpha(*(string+length)))) //Both aren't alphabets
            palindrome(++string, length-=2); //Remove both chars
        else if isalpha(*string) //Only first char is alphabet
            palindrome(string, --length); //Remove last char
        else //Last char is alphabet
            palindrome(++string, --length); //Remove first char, and set relative length
            
    }
}

int main(int argc, char** argv) {
    char string[30]; //declare variables
    
    printf("\nEnter the string:\n");
    fgets(string,30,stdin); //accept values
    
    int length;
    for(length=0;string[length]!='\0';length++); //calculate length with empty loop
    length--; //value of last index of string
    
    palindrome(string,length);  //check if palindrome
    
    return (EXIT_SUCCESS);
}

