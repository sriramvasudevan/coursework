#include <string.h>
#include <malloc.h>
#include "packet.h"

struct singly_Packet *last = NULL;

void singly_receiveMessage() {

    struct singly_Packet *packet = (struct singly_Packet*) malloc(sizeof (struct singly_Packet));

    printf("\nEnter sender's address:  ");
    fgets(packet->sender, 50, stdin);

    printf("Enter receiver's address:  ");
    fgets(packet->receiver, 50, stdin);

    printf("Enter message:  ");
    fgets(packet->message, 50, stdin);

    packet->next = last;
    last = packet;

    printf("\nMessage Received.\n");
}

void singly_deleteLast() {

    struct singly_Packet *temporary = NULL;
    temporary = last;
    last = last->next;
    free(temporary);
}

void singly_printAllMessages() {

    struct singly_Packet *currentnode = NULL;

    printf("\nMessages:\n");

    if (last) {
        for (currentnode = last; currentnode != NULL; currentnode = currentnode->next) {

            printf("-> Sender: %s   Receiver: %s   Message: %s\n", currentnode->sender, currentnode->receiver, currentnode->message);
        }
    } 
    else {
        printf("\nNo messages present in the buffer.\n");
    }
}

void singly_sendMessage() {

    struct singly_Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char messagechoice[50];
    int flag = 0;

    singly_printAllMessages();

    if (last) {
        printf("\nEnter the message of your choice to be sent:\n");
        fgets(messagechoice, 50, stdin);

        for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
            nextnode = currentnode->next;

            if (strcmp(currentnode->message, messagechoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);

                if (currentnode == last) {
                    singly_deleteLast();
                } 
                else {
                    previousnode->next = currentnode->next;
                    free(currentnode);
                }
                currentnode = NULL;

                printf("Message Sent.\n");
            }

            if (currentnode) {
                previousnode = currentnode;
            }

        }

        if (!flag) {
            printf("\nNo messages matched your choice.\n");
        }
    }

}

void singly_sendAllSenderMessages() {

    struct singly_Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char senderchoice[50];
    int flag = 0;

    singly_printAllMessages();

    if (last) {
        printf("\nEnter the sender of your choice:\n");
        fgets(senderchoice, 50, stdin);

        for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
            nextnode = currentnode->next;

            if (strcmp(currentnode->sender, senderchoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);

                if (currentnode == last) {
                    singly_deleteLast();
                } 
                else {
                    previousnode->next = currentnode->next;
                    free(currentnode);
                }
                currentnode = NULL;

                printf("Message Sent.\n");
            }

            if (currentnode) {
                previousnode = currentnode;
            }

        }

        if (!flag) {
            printf("\nNo sender matched your choice.\n");
        }
    }

}

void singly_sendAllReceiverMessages() {

    struct singly_Packet *currentnode = NULL, *previousnode = NULL, *nextnode = NULL;
    char receiverchoice[50];
    int flag = 0;

    singly_printAllMessages();

    if (last) {
        printf("\nEnter the receiver of your choice:\n");
        fgets(receiverchoice, 50, stdin);

        for (currentnode = last; currentnode != NULL; currentnode = nextnode) {
            nextnode = currentnode->next;

            if (strcmp(currentnode->receiver, receiverchoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);

                if (currentnode == last) {
                    singly_deleteLast();
                }
                else {
                    previousnode->next = currentnode->next;
                    free(currentnode);
                }
                currentnode = NULL;

                printf("Message Sent.\n");
            }

            if (currentnode) {
                previousnode = currentnode;
            }

        }

        if (!flag) {
            printf("\nNo receiver matched your choice.\n");
        }
    }

}