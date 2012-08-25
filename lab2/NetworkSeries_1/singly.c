#include <string.h>
#include <malloc.h>
#include "packet.h"

struct Packet *last = NULL;

void receiveMessage() {

    struct Packet *packet = (struct Packet*) malloc(sizeof (struct Packet));

    printf("\nEnter sender's address:  ");
    fgets(packet->sender, 50, stdin);

    printf("\nEnter receiver's address:  ");
    fgets(packet->receiver, 50, stdin);

    printf("\nEnter message:  ");
    fgets(packet->message, 50, stdin);

    packet->next = last;
    last = packet;
    
    printf("\nMessage Received.");
}

void deleteLast() {

    struct Packet *temporary = NULL;
    temporary = last;
    last = last->next;
    free(temporary);
}

void printAllMessages() {

    struct Packet *currentnode = NULL;

    printf("\nMessages:\n");
    for (currentnode = last; currentnode != NULL; currentnode = currentnode->next) {

        printf("-> Sender: %s Receiver: %s Message: %s\n", currentnode->sender, currentnode->receiver, currentnode->message);
    }
}

void sendMessage() {

    struct Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char messagechoice[50];

    printAllMessages();
    printf("\nEnter the message of your choice to be sent:\n");
    fgets(messagechoice, 50, stdin);

    for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
        nextnode = currentnode->next;

        if (strcmp(currentnode->message, messagechoice) == 0) {

            printf("-> Sender:%s\nReceiver:%s\nMessage:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);

            if (currentnode == last) {
                deleteLast();
            }
            
            else {
                previousnode->next = currentnode->next;
                free(currentnode);
                currentnode = NULL;
            }
            
            printf("Message Sent.\n");
        }

        if (currentnode) {
            previousnode = currentnode;
        }

    }

}

void sendAllSenderMessages() {

    struct Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char senderchoice[50];

    printAllMessages();
    printf("\nEnter the sender of your choice:\n");
    fgets(senderchoice, 50, stdin);

    for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
        nextnode = currentnode->next;
        
        if (strcmp(currentnode->sender, senderchoice) == 0) {

            printf("-> Sender:%s\nReceiver:%s\nMessage:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);

            if (currentnode == last) {
                deleteLast();
            }
            
            else {
                previousnode->next = currentnode->next;
                free(currentnode);
                currentnode = NULL;
            }

            printf("Message(s) Sent.\n");
        }

        if (currentnode) {
            previousnode = currentnode;
        }

    }

}

void sendAllReceiverMessages() {

    struct Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char receiverchoice[50];

    printAllMessages();
    printf("\nEnter the receiver of your choice:\n");
    fgets(receiverchoice, 50, stdin);

    for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
        nextnode = currentnode->next;
        
        if (strcmp(currentnode->receiver, receiverchoice) == 0) {
            printf("-> Sender:%s\nReceiver:%s\nMessage:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);
            
            if (currentnode == last) {
                deleteLast();
            }
            
            else {
                previousnode->next = currentnode->next;
                free(currentnode);
                currentnode = NULL;
            }
            
            printf("Message(s) Sent.\n");
        }

        if (currentnode) {
            previousnode = currentnode;
        }

    }

}