/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 6 August, 2012, 7:55 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "singly.h"
#include "doubly.h"

/*
 * Simulating a Network Buffer.
 */

void menu(int* choice) {
    char clearbuffer;

    printf("\n****************************\n");
    printf("*           MENU           *\n");
    printf("****************************\n\n");

    printf("1. Receive a message into the buffer.\n");
    printf("2. Send a particular message from the buffer.\n");
    printf("3. Send all messages from a particular sender.\n");
    printf("4. Send all messages to a particular receiver.\n");
    printf("5. Print all messages in the buffer.\n");
    printf("6. Exit.\n\n");

    printf("Enter your choice:  ");
    scanf("%d", choice);
    scanf("%c", &clearbuffer);
}

void singly_menu(int* choice) {

    while (1) {
        menu(choice);

        switch (*choice) {
            case 1:
                singly_receiveMessage();
                break;

            case 2:
                singly_sendMessage();
                break;

            case 3:
                singly_sendAllSenderMessages();
                break;

            case 4:
                singly_sendAllReceiverMessages();
                break;

            case 5:
                singly_printAllMessages();
                break;

            case 6:
                exit(0);
                break;

            default:
                printf("\nInvalid choice. Please try again.\n");
                break;
        }

    }

}

void doubly_menu(int* choice) {

    while (1) {
        menu(choice);

        switch (*choice) {
            case 1:
                doubly_receiveMessage();
                break;

            case 2:
                doubly_sendMessage();
                break;

            case 3:
                doubly_sendAllSenderMessages();
                break;

            case 4:
                doubly_sendAllReceiverMessages();
                break;

            case 5:
                doubly_printAllMessages();
                break;

            case 6:
                exit(0);
                break;

            default:
                printf("\nInvalid choice. Please try again.\n");
                break;
        }

    }

}

int main(int argc, char** argv) {

    int choice = 0;

    while (1) {

        printf("\n****************************\n");
        printf("* DATA STRUCTURE SELECTION *\n");
        printf("****************************\n\n");

        printf("1. Singly linked list.\n");
        printf("2. Circular doubly linked list.\n");
        printf("3. Exit.\n");

        printf("Enter your choice:  ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                singly_menu(&choice);
                break;
            case 2:
                doubly_menu(&choice);
                break;
            case 3:
                exit(0);
                break;
            default:
                printf("\nInvalid choice. Please try again.\n");
                break;
        }

    }

    return (EXIT_SUCCESS);

}

