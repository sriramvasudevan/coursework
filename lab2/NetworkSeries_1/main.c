/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 6 August, 2012, 7:55 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "singly.h"

/*
 * Simulating a Network Buffer.
 */

int main(int argc, char** argv) {

    int choice = 0;
    char clearbuffer;

    while (1) {

        printf("**************************\n");
        printf("*          MENU          *\n");
        printf("**************************\n\n");

        printf("1. Receive a message into the buffer.\n");
        printf("2. Send a particular message from the buffer.\n");
        printf("3. Send all messages from a particular sender.\n");
        printf("4. Send all messages to a particular receiver.\n");
        printf("5. Print all messages in the buffer.\n");
        printf("6. Exit.\n\n");

        printf("Enter your choice:  ");
        scanf("%d", &choice);
        scanf("%c", &clearbuffer);

        switch (choice) {

            case 1:
                receiveMessage();
                break;

            case 2:
                sendMessage();
                break;

            case 3:
                sendAllSenderMessages();
                break;

            case 4:
                sendAllReceiverMessages();
                break;

            case 5:
                printAllMessages();
                break;

            case 6:
                exit(0);
                break;

            default:
                printf("\nInvalid choice. Please try again.\n");
                break;
        }

    }

    return (EXIT_SUCCESS);

}

