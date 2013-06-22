/* 
 * File:   main.c
 * Author: sriram
 *
 * Created on 30 July, 2012, 2:23 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * Accept roll number and accept and display data in 3 different ways depending on a calculation
 */
int main(int argc, char** argv) {
    int x, intdisp, hexdisp;  //variable declarations
    float floatdisp;
    char chardisp, strdisp[10];

    printf("\nEnter last 3 digits of Roll No.:\n"); //accept roll no
    scanf("%d",&x);
    if (x>0)
    {
        int r=x%3;  //calculate x mod 3

        switch(r)
        {
            case 0: printf("\nEnter float, int, char, str, hex:\n");  //program 1
                    scanf("%f %d %c %s %x",&floatdisp, &intdisp, &chardisp, strdisp, &hexdisp);
                    printf("\n0x%x,%s,%c,%d,%f\n",hexdisp, strdisp, chardisp, intdisp, floatdisp);
                    break;

            case 1: printf("\nEnter float, char, int, hex, str:\n");  //program 2
                    scanf("%f %c %d %x %s",&floatdisp, &chardisp, &intdisp, &hexdisp, strdisp);
                    printf("\n%s,0x%x,%d,%c,%f\n",strdisp, hexdisp, intdisp, chardisp, floatdisp);        
                    break;

            case 2: printf("\nEnter int, float, str, char, hex:\n");  //program 3
                    scanf("%d %f %s %c %x",&intdisp, &floatdisp, strdisp, &chardisp, &hexdisp);
                    printf("\n0x%x,%c,%s,%f,%d\n",hexdisp, chardisp, strdisp, floatdisp, intdisp);
                    break;
        }
    }

    else
    {
        printf("\nRoll No. is a positive value.\n");
    }
    return (EXIT_SUCCESS);
}

