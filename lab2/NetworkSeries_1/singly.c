#include <string.h>
#include <malloc.h>
#include "singly.h"

void receive()
{
    struct Packet *packet=(struct Packet*)malloc(sizeof(struct Packet));
    
    printf("\nEnter sender's address:\n");
    fgets(packet->sender,50,stdin);
    printf("\nEnter receiver's address:\n");
    fgets(packet->receiver,50,stdin);
    printf("\nEnter message:\n");
    fgets(packet->message,50,stdin);    
    
    packet->next=last;
    last = packet;
}

void del()
{
    struct Packet *temp = NULL;
    temp = last;
    last = last->next;
    free(temp);
}

void printall()
{
    struct Packet *i;
    printf("\nMessages:\n:");
    for(i=last;i!=NULL;i=i->next)
    {
        printf("-%s\n",i->message);
        
    }
}

void send()
{
    struct Packet *i;
    char str[50];
    printall();
    printf("\nEnter the message of your choice to be sent:\n");
    fgets(str,50,stdin);
    for(i=last;i!=NULL;i=i->next)
    {
        if (strcmp(i->message,str)==0)
        {
            printf("Sender:%s\nReceiver:%s\nMessage:%s\n",i->sender,i->receiver,i->message);
            
            if(i==last)
                del();
            else
            {
                struct Packet *temp=i;
                (i-1)->next = i->next;
                free(temp);
            }
            printf("Message Sent.\n");
        }
    }
    
}

void sendallsender()
{
    struct Packet *i;
    char str[50];
    
    printall();
    printf("\nEnter the sender of your choice:\n");
    fgets(str,50,stdin);
    for(i=last;i!=NULL;i=i->next)
    {
        if (strcmp(i->sender,str)==0)
        {
            printf("Sender:%s\nReceiver:%s\nMessage:%s\n",i->sender,i->receiver,i->message);
            
            if(i==last)
                del();
            else
            {
                struct Packet *temp=i;
                (i-1)->next = i->next;
                free(temp);
            }
            printf("Message Sent.\n");
        }
    }
        
}

void sendallreceiver()
{
    struct Packet *i;
    char str[50];
    printall();
    printf("\nEnter the receiver of your choice:\n");
    fgets(str,50,stdin);
    for(i=last;i!=NULL;i=i->next)
    {
        if (strcmp(i->receiver,str)==0)
        {
            printf("Sender:%s\nReceiver:%s\nMessage:%s\n",i->sender,i->receiver,i->message);
            
            if(i==last)
                del();
            else
            {
                struct Packet *temp=i;
                (i-1)->next = i->next;
                free(temp);
            }
            printf("Message Sent.\n");
        }
    }
        
}