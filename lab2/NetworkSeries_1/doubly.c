#include <string.h>
#include <malloc.h>
#include "packet.h" //Contains the structure definition of the circular, doubly linked list packet node.

struct doubly_Packet *current = NULL;  //Pointer to keep track of the last node in the linked list.


/***************************************************************************/
/*  This function creates a new node, accepts values for it from the user  */
/*               and adds it at the end of the linked list.                */
/***************************************************************************/
void doubly_receiveMessage() {

    //create a new node.
    struct doubly_Packet *packet = (struct doubly_Packet*) malloc(sizeof (struct doubly_Packet));

    //Accept values for the node from the user.
    printf("\nEnter sender's address:  ");
    fgets(packet->sender, 50, stdin);

    printf("Enter receiver's address:  ");
    fgets(packet->receiver, 50, stdin);

    printf("Enter message:  ");
    fgets(packet->message, 50, stdin);

    if (current) {
        //Add node links for the new node.
        packet->prev = current;
        packet->next = current->next;
        
        //Modify existing links for the adjacent nodes.
        current->next = packet;
        (packet->next)->prev = packet;

        current = packet;
    } 
    else {                    //If it is the first node being added to the list.
        current = packet;
        //Make the 2 pointers refer to the new node itself.
        packet->prev = current;
        packet->next = current;
    }

    printf("\nMessage Received.");
}


/*********************************************************************************/
/*  This function is used to delete the node that the 'current' pointer points   */
/*  to. The deletion of the 'current' pointer is a special case of node deletion */
/*                      in a circular, doubly linked list.                       */
/*********************************************************************************/
void doubly_deleteCurrent() {

    struct doubly_Packet *temporary = NULL;
    temporary = current;

    if (current->next == current) {        //If it is the only node in the list.
        free(current);
        current = NULL;
    } 
    else {
        //Modify the node links of the adjacent nodes.
        (current->prev)->next = current->next;
        (current->next)->prev = current->prev;

        current = current->next;
        free(temporary);
    }
}


/*********************************************************************************/
/*        This function prints all the messages stored in the buffer.            */
/*********************************************************************************/
void doubly_printAllMessages() {

    printf("\nMessages:\n");

    //Print messages only if they exist.
    if (current) {
        struct doubly_Packet *currentnode = current->next;  //currentnode is the first node added to the list.
        do {

            printf("-> Sender: %s   Receiver: %s   Message: %s\n", currentnode->sender,
                                                                   currentnode->receiver,
                                                                   currentnode->message);

            currentnode = currentnode->next;  //point to next node.
        } while (currentnode != current->next);  //until it comes back to the same node where it started.
    }
    else {
        printf("\nNo messages present in the buffer.\n");
    }
}


/*********************************************************************************/
/*   This function is used to search for a message in the buffer, and send it.   */
/*********************************************************************************/
void doubly_sendMessage() {

    //Pointers to track nodes.
    struct doubly_Packet *currentnode = current, *nextnode = NULL, *loopstart = NULL;
    char messagechoice[50]; //String to accept user's choice.
    int flag = 0; //Flag to check if the user's message exists.

    doubly_printAllMessages();         //Print all messages.

    //Execute only if messages exist in the buffer.
    if (current) {
        printf("\nEnter the message of your choice to be sent:\n");
        fgets(messagechoice, 50, stdin);

        do {
            nextnode = currentnode->next;
            loopstart = current;           //loopstart keeps track of the starting node of the loop.

            if (strcmp(currentnode->message, messagechoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender,
                                                                    currentnode->receiver,
                                                                    currentnode->message);

                if (currentnode == current) {                      //Special case.
                    doubly_deleteCurrent();
                }
                else {
                    (currentnode->prev)->next = currentnode->next; //Modify adjacent nodes' pointers.
                    (currentnode->next)->prev = currentnode->prev;
                    free(currentnode);
                }

                printf("Message Sent.\n");
            }

            currentnode = nextnode;
        } while (currentnode != loopstart);

        if (!flag) {
            printf("\nNo messages matched your choice.\n");
        }
    }

}


/*********************************************************************************/
/*   This function searches by sender, and sends all messages by that sender.    */
/*********************************************************************************/
void doubly_sendAllSenderMessages() {

    //Pointers to keep track of nodes.
    struct doubly_Packet *currentnode = current, *nextnode = NULL, *loopstart = NULL;
    char senderchoice[50];  //String to store user's choice.
    int flag = 0;  //Flag to check if the user's choice exists in the buffer.

    doubly_printAllMessages();   //Print all messages.

    //Execute only if messages exist in the buffer.
    if (current) {
        printf("\nEnter the sender of your choice:\n");
        fgets(senderchoice, 50, stdin);

        do {
            nextnode = currentnode->next;
            loopstart = current;  //loopstart keeps track of the starting node of the loop.

            if (strcmp(currentnode->sender, senderchoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender,
                                                                    currentnode->receiver,
                                                                    currentnode->message);

                if (currentnode == current) {                   //Special case.
                    doubly_deleteCurrent();
                }
                else {
                    (currentnode->prev)->next = currentnode->next;  //Modify the adjacent nodes' pointers.
                    (currentnode->next)->prev = currentnode->prev;
                    free(currentnode);
                }

                printf("Message Sent.\n");
            }

            currentnode = nextnode;
        } while (currentnode != loopstart);

        if (!flag) {
            printf("\nNo sender matched your choice.\n");
        }
    }

}


/**********************************************************************************/
/*  This function searches by receiver, and sends all messages by that receiver.  */
/**********************************************************************************/
void doubly_sendAllReceiverMessages() {

    //Pointers to keep track of nodes.
    struct doubly_Packet *currentnode = current, *nextnode = NULL, *loopstart = NULL;
    char receiverchoice[50]; //String to store user's choice.
    int flag = 0;  //Flag to check if user's choice exists in the buffer.

    doubly_printAllMessages();  //Print all messages.

    //Execute only if messages exist in the buffer.
    if (current) {
        printf("\nEnter the receiver of your choice:\n");
        fgets(receiverchoice, 50, stdin);

        do {
            nextnode = currentnode->next;
            loopstart = current;  //loopstart keeps track of the starting node of the loop.

            if (strcmp(currentnode->receiver, receiverchoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender,
                                                                    currentnode->receiver,
                                                                    currentnode->message);

                if (currentnode == current) {                       //Special case.
                    doubly_deleteCurrent();
                } 
                else {
                    (currentnode->prev)->next = currentnode->next;      //Modify adjacent nodes' pointers.
                    (currentnode->next)->prev = currentnode->prev;
                    free(currentnode);
                }

                printf("Message Sent.\n");
            }

            currentnode = nextnode;
        } while (currentnode != loopstart);

        if (!flag) {
            printf("\nNo receiver matched your choice.\n");
        }
    }

}