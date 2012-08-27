/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 6 August, 2012, 7:55 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "singly.h" //Includes Singly linked list function definitions.
#include "doubly.h" //Includes Circular, Doubly linked list function definitions.

/*********************************************************************************************/
/*                          A Network Buffer Simulator, that uses:                           */
/*                               1. Singly linked lists                                      */
/*                               2. Circular, doubly linked lists.                           */
/*********************************************************************************************/


/*********************************************************************************************/
/*   The menu function is used to display a menu with 6 options. The same menu is used for   */
/*     both singly and circular, doubly linked lists. The function takes one argument, a     */
/*   pointer, that is used to hold the value of the choice given by the user in this menu.   */
/*********************************************************************************************/
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
    scanf("%c", &clearbuffer); //Used to clear the buffer. If it isn't used, '\n'
                               //is taken as input by fgets() from buffer.
}


/*********************************************************************************************/
/*                            Menu for the Singly linked list option.                        */
/*                     Takes an int pointer, the menu choice, as an argument.                */
/*********************************************************************************************/
void singly_menu(int* choice) {

    while (1) {
        menu(choice);                             //Get the menu choice from the user.

        switch (*choice) {
            case 1:
                singly_receiveMessage();          //To receive a message.
                break;

            case 2:
                singly_sendMessage();             //To send a message.
                break;

            case 3:
                singly_sendAllSenderMessages();   //To send messages by sender.
                break;

            case 4:
                singly_sendAllReceiverMessages(); //To send messages by receiver.
                break;

            case 5:
                singly_printAllMessages();        //To print all messages.
                break;

            case 6:
                exit(0);                          //To exit the program.
                break;

            default:
                printf("\nInvalid choice. Please try again.\n");
                break;
        }

    }

}


/*********************************************************************************************/
/*                       Menu for the Circular, Doubly linked list option.                   */
/*                     Takes an int pointer, the menu choice, as an argument.                */
/*********************************************************************************************/
void doubly_menu(int* choice) {

    while (1) {
        menu(choice); //Get the menu choice from the user.

        switch (*choice) {
            case 1:
                doubly_receiveMessage();           //To receive a message.
                break;

            case 2:
                doubly_sendMessage();              //To send a message.
                break;

            case 3:
                doubly_sendAllSenderMessages();    //To send messages by sender.
                break;

            case 4:
                doubly_sendAllReceiverMessages();  //To send messages by receiver.
                break;

            case 5:
                doubly_printAllMessages();         //To print all messages.
                break;

            case 6:
                exit(0);                           //To exit the program.
                break;

            default:
                printf("\nInvalid choice. Please try again.\n");
                break;
        }

    }

}


/*********************************************************************************************/
/*                                    The main function.                                     */
/*********************************************************************************************/
int main(int argc, char** argv) {

    int choice = 0;                                  //Variable to accept user's choice.

    while (1) {
        
        //Main Menu
        
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
                singly_menu(&choice);                //Call singly linked list menu.
                break;
            case 2:
                doubly_menu(&choice);                //Call circular, doubly linked list menu.
                break;
            case 3:
                exit(0);                             //Exit the program.
                break;
            default:
                printf("\nInvalid choice. Please try again.\n");
                break;
        }

    }

    return (EXIT_SUCCESS);

}

