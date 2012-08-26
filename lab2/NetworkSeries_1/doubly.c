#include <string.h>
#include <malloc.h>
#include "packet.h"

struct doubly_Packet *current = NULL;

void doubly_receiveMessage() {

    struct doubly_Packet *packet = (struct doubly_Packet*) malloc(sizeof (struct doubly_Packet));

    printf("\nEnter sender's address:  ");
    fgets(packet->sender, 50, stdin);

    printf("Enter receiver's address:  ");
    fgets(packet->receiver, 50, stdin);

    printf("Enter message:  ");
    fgets(packet->message, 50, stdin);

    if (current) {
        packet->prev = current;
        packet->next = current->next;

        current->next = packet;
        (packet->next)->prev = packet;

        current = packet;
    } 
    else {
        current = packet;
        packet->prev = current;
        packet->next = current;
    }

    printf("\nMessage Received.");
}

void doubly_deleteCurrent() {

    struct doubly_Packet *temporary = NULL;
    temporary = current;

    if (current->next == current) {
        free(current);
        current = NULL;
    } 
    else {
        (current->prev)->next = current->next;
        (current->next)->prev = current->prev;

        current = current->next;
        free(temporary);
    }
}

void doubly_printAllMessages() {

    printf("\nMessages:\n");

    if (current) {
        struct doubly_Packet *currentnode = current->next;
        do {

            printf("-> Sender: %s   Receiver: %s   Message: %s\n", currentnode->sender, currentnode->receiver, currentnode->message);

            currentnode = currentnode->next;
        } while (currentnode != current->next);
    }
    else {
        printf("\nNo messages present in the buffer.\n");
    }
}

void doubly_sendMessage() {

    struct doubly_Packet *currentnode = current, *nextnode = NULL, *loopstart = NULL;
    char messagechoice[50];
    int flag = 0;

    doubly_printAllMessages();

    if (current) {
        printf("\nEnter the message of your choice to be sent:\n");
        fgets(messagechoice, 50, stdin);

        do {
            nextnode = currentnode->next;
            loopstart = current;

            if (strcmp(currentnode->message, messagechoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);

                if (currentnode == current) {
                    doubly_deleteCurrent();
                }
                else {
                    (currentnode->prev)->next = currentnode->next;
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

void doubly_sendAllSenderMessages() {

    struct doubly_Packet *currentnode = current, *nextnode = NULL, *loopstart = NULL;
    char senderchoice[50];
    int flag = 0;

    doubly_printAllMessages();

    if (current) {
        printf("\nEnter the sender of your choice:\n");
        fgets(senderchoice, 50, stdin);

        do {
            nextnode = currentnode->next;
            loopstart = current;

            if (strcmp(currentnode->sender, senderchoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);

                if (currentnode == current) {
                    doubly_deleteCurrent();
                }
                else {
                    (currentnode->prev)->next = currentnode->next;
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

void doubly_sendAllReceiverMessages() {

    struct doubly_Packet *currentnode = current, *nextnode = NULL, *loopstart = NULL;
    char receiverchoice[50];
    int flag = 0;

    doubly_printAllMessages();

    if (current) {
        printf("\nEnter the receiver of your choice:\n");
        fgets(receiverchoice, 50, stdin);

        do {
            nextnode = currentnode->next;
            loopstart = current;

            if (strcmp(currentnode->receiver, receiverchoice) == 0) {

                flag = 1;
                printf("-> Sender:%s   Receiver:%s   Message:%s\n", currentnode->sender, currentnode->receiver, currentnode->message);

                if (currentnode == current) {
                    doubly_deleteCurrent();
                } 
                else {
                    (currentnode->prev)->next = currentnode->next;
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