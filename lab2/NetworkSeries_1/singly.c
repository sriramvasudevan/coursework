#include <string.h>
#include <malloc.h>
#include "packet.h" //Contains the structure definition of the singly linked list packet node.

struct singly_Packet *last = NULL; //Pointer to keep track of the last node in the linked list.


/***************************************************************************/
/*  This function creates a new node, accepts values for it from the user  */
/*               and adds it at the end of the linked list.                */
/***************************************************************************/
void singly_receiveMessage() {

    //Create a new node.
    struct singly_Packet *packet = (struct singly_Packet*) malloc(sizeof (struct singly_Packet));

    //Accept values.
    printf("\nEnter sender's address:  ");
    fgets(packet->sender, 50, stdin);

    printf("Enter receiver's address:  ");
    fgets(packet->receiver, 50, stdin);

    printf("Enter message:  ");
    fgets(packet->message, 50, stdin);

    //Create links between the nodes.
    packet->next = last;
    last = packet;

    printf("\nMessage Received.\n");
}


/*********************************************************************************/
/*  This function is used to delete the node that the 'last' pointer points to.  */
/*  The deletion of the 'last' pointer is a special case of node deletion in a   */
/*                                singly linked list.                            */
/*********************************************************************************/
void singlyDeleteLast() {

    struct singly_Packet *temporary = NULL; //Temporary pointer to keep track of the 'last' pointer.
    temporary = last;
    last = last->next;  //Point last to the new last node.
    free(temporary);
}


/*********************************************************************************/
/*        This function prints all the messages stored in the buffer.            */
/*********************************************************************************/
void singly_printAllMessages() {

    struct singly_Packet *currentnode = NULL;

    printf("\nMessages:\n");
    
    //print messages only if they exist in the buffer.
    
    if (last) {
        for (currentnode = last; currentnode != NULL; currentnode = currentnode->next) {

            printf("-> Sender: %s   Receiver: %s   Message: %s\n", currentnode->sender,
                                                                   currentnode->receiver,
                                                                   currentnode->message);
        }
    }
    else {
        printf("\nNo messages present in the buffer.\n");
    }
}


/*********************************************************************************/
/*   This function is used to search for a message in the buffer, and send it.   */
/*********************************************************************************/
void singly_sendMessage() {

    //pointers to track nodes.
    struct singly_Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char messagechoice[50];  //string to store user's choice.
    int flag = 0; //flag to check if a matching message exists in the buffer.

    singly_printAllMessages();           //print all messages.

    //Execute only if messages exist in the buffer.
    if (last) {
        printf("\nEnter the message of your choice to be sent:\n");
        fgets(messagechoice, 50, stdin);

        for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
            nextnode = currentnode->next;                                 //pointer to next node.

            //If the user's message matches a node's message:
            
            if (strcmp(currentnode->message, messagechoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender,
                                                                    currentnode->receiver,
                                                                    currentnode->message);

                if (currentnode == last) {                           //Special case.
                    singlyDeleteLast();
                }
                else {
                    previousnode->next = currentnode->next;          //Modify the pointer links in the list.
                    free(currentnode);
                }
                currentnode = NULL;

                printf("Message Sent.\n");
            }

            if (currentnode) {
                //Set the new previous node to the current node, only if it exists.
                previousnode = currentnode;
            }

        }

        if (!flag) {
            printf("\nNo messages matched your choice.\n");
        }
    }

}


/*********************************************************************************/
/*   This function searches by sender, and sends all messages by that sender.    */
/*********************************************************************************/
void singly_sendAllSenderMessages() {

    //pointers to track nodes.
    struct singly_Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char senderchoice[50];  //string to store user's choice.
    int flag = 0; //flag to check if a matching message exists in the buffer.

    singly_printAllMessages();  //Print all messages in the buffer.

    //Execute only if messages exist in the buffer.
    if (last) {
        printf("\nEnter the sender of your choice:\n");
        fgets(senderchoice, 50, stdin);

        for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
            nextnode = currentnode->next;

            if (strcmp(currentnode->sender, senderchoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender,
                                                                    currentnode->receiver,
                                                                    currentnode->message);

                if (currentnode == last) {             //Special case.
                    singlyDeleteLast();
                }
                else {
                    previousnode->next = currentnode->next;  //Modify the pointer links in the list.
                    free(currentnode);
                }
                currentnode = NULL;

                printf("Message Sent.\n");
            }

            if (currentnode) {
                //Set the new previous node to the current node, only if it exists.
                previousnode = currentnode;
            }

        }

        if (!flag) {
            printf("\nNo sender matched your choice.\n");
        }
    }

}


/**********************************************************************************/
/*  This function searches by receiver, and sends all messages by that receiver.  */
/**********************************************************************************/
void singly_sendAllReceiverMessages() {

    //pointers to track nodes.
    struct singly_Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char receiverchoice[50];  //string to store user's choice.
    int flag = 0;  //flag to check if a matching message exists in the buffer.

    singly_printAllMessages();  //Print all messages in the buffer.

    //Execute only if messages exist in the buffer.
    if (last) {
        printf("\nEnter the receiver of your choice:\n");
        fgets(receiverchoice, 50, stdin);

        for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
            nextnode = currentnode->next;

            if (strcmp(currentnode->receiver, receiverchoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender,
                                                                    currentnode->receiver, 
                                                                    currentnode->message);

                if (currentnode == last) {                          //Special case.
                    singlyDeleteLast();
                } else {
                    previousnode->next = currentnode->next;  //Modify the pointer links in the list.
                    free(currentnode);
                }
                currentnode = NULL;

                printf("Message Sent.\n");
            }

            if (currentnode) {
                //Set the new previous node to the current node, only if it exists.
                previousnode = currentnode;
            }

        }

        if (!flag) {
            printf("\nNo receiver matched your choice.\n");
        }
    }

}