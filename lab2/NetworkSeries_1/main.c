/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 6 August, 2012, 7:55 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "singly.c"

/*
 * Simulating a Network Buffer
 */

int main(int argc, char** argv) {
    char cont='y';
    int choice=0;
    
    while(cont=='y')
    {
        printf("******MENU******\n");
        printf("1. Receive message into buffer\n");
        printf("2. Send a particular message from buffer\n");
        printf("3. Send all messages from a particular sender\n");
        printf("4. Send all messages from a particular receiver\n");
        printf("5. Print all messages from buffer\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        switch(choice)
        {
            case 1:
                receive();
                break;
            case 2:
                send();
                break;
            case 3:
                sendallsender();
                break;
            case 4:
                sendallreceiver();
                break;
            case 5:
                printall();
                break;
            default:
                printf("Invalid choice. Try again.\n");    
        }
    }
    return (EXIT_SUCCESS);
}

