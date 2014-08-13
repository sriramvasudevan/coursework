#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h> /* memset() */
#include <stdlib.h>
#include <unistd.h>
#include <dirent.h>

#define LOCAL_SERVER_PORT 8000
#define REMOTE_CLIENT_PORT 8500
#define MAX_MSG 100


int main(int argc, char *argv[]) {

    int sd, rc, n, cliLen;
    struct sockaddr_in cliAddr, servAddr, remoteCliAddr;
    char msg[MAX_MSG];

    /* socket creation */
    sd=socket(AF_INET, SOCK_DGRAM, 0);
    if(sd<0) {
        printf("%s: cannot open socket \n",argv[0]);
        exit(1);
    }

    /* bind local server port */
    servAddr.sin_family = AF_INET;
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY); //host to network long - 32 bits
    // network format - a.b.c.d
    servAddr.sin_port = htons(LOCAL_SERVER_PORT);
    rc = bind (sd, (struct sockaddr *) &servAddr,sizeof(servAddr));
    if(rc<0) {
        printf("%s: cannot bind port number %d \n", 
                argv[0], LOCAL_SERVER_PORT);
        exit(1);
    }

    printf("%s: waiting for data on port UDP %u\n", 
            argv[0],LOCAL_SERVER_PORT);

    /* server infinite loop */
    while(1) {

        /* init buffer */
        memset(msg,0x0,MAX_MSG);

        /* receive message */
        cliLen = sizeof(cliAddr);
        n = recvfrom(sd, msg, MAX_MSG, 0, 
                (struct sockaddr *) &cliAddr, &cliLen);

        if(n<0) {
            printf("%s: cannot receive data \n",argv[0]);
            continue;
        }

        /* set Client */
        remoteCliAddr.sin_family = AF_INET;
        remoteCliAddr.sin_addr.s_addr = cliAddr.sin_addr.s_addr;
        remoteCliAddr.sin_port = htons(REMOTE_CLIENT_PORT);

        /* Eval request and respond */
        //split msg
        char *split = NULL;
        char cmd[MAX_MSG];
        strcpy(cmd, msg);
        if(split = strtok (msg," ")) {
            if(!strcmp(split, "open")) {
                printf("Connection to client %s:%u opened.\n", inet_ntoa(cliAddr.sin_addr), ntohs(cliAddr.sin_port));
                if(chdir("/")) {
                    strcpy(msg, "No such file or directory");
                }
                else {
                    strcpy(msg, "ACK");
                }
                rc = sendto(sd, msg, MAX_MSG, 0, 
                        (struct sockaddr *) &remoteCliAddr, 
                        sizeof(remoteCliAddr));

                if(rc<0) {
                    printf("%s: cannot send response %s \n", msg);
                    close(sd);
                    exit(1);
                }
            }
            else if (!strcmp(split, "cd")) {
                split = strtok (NULL, " ");
                if(split) {
                    if(chdir(split)) {
                        strcpy(msg, "No such file or directory");
                    }
                    else {
                        strcpy(msg, "ACK");
                    }
                    rc = sendto(sd, msg, MAX_MSG, 0, 
                            (struct sockaddr *) &remoteCliAddr, 
                            sizeof(remoteCliAddr));

                    if(rc<0) {
                        printf("%s: cannot send response %s \n", msg);
                        close(sd);
                        exit(1);
                    }
                }
            }
            else if (!strcmp(split, "get")) {
                split = strtok (NULL, " ");
                if(split) {
                    FILE *in;
                    char cwd[MAX_MSG];
                    in = fopen(split, "r");
                    if(in) {
                        while(fgets(cwd, MAX_MSG, in)!=NULL){
                            rc = sendto(sd, cwd, MAX_MSG, 0, 
                                    (struct sockaddr *) &remoteCliAddr, 
                                    sizeof(remoteCliAddr));
                            if(rc<0) {
                                printf("%s: cannot send response %s \n", msg);
                                close(sd);
                                exit(1);
                            }
                        }
                        fclose(in);
                    }
                }
            }
            else if (!strcmp(split, "done")) {
                /* Respond with exit message */
                strcpy(msg, "ACK");
                rc = sendto(sd, msg, MAX_MSG, 0, 
                        (struct sockaddr *) &remoteCliAddr, 
                        sizeof(remoteCliAddr));

                if(rc<0) {
                    printf("%s: cannot send response %s \n", msg);
                    close(sd);
                    exit(1);
                }
                printf("Connection to client %s:%u closed.\n", inet_ntoa(cliAddr.sin_addr), ntohs(cliAddr.sin_port));
            }
            else if (!strcmp(split, "pwd")) {
                FILE *in;
                char cwd[MAX_MSG];
                if((in = popen(split, "r"))){
                    while(fgets(cwd, MAX_MSG, in)!=NULL){
                        rc = sendto(sd, cwd, MAX_MSG, 0, 
                                (struct sockaddr *) &remoteCliAddr, 
                                sizeof(remoteCliAddr));
                        if(rc<0) {
                            printf("%s: cannot send response %s \n", cwd);
                            close(sd);
                            exit(1);
                        }
                    }
                    pclose(in);
                }
            }
            else if (!strcmp(split, "ls")) {
                int flag=0;
                split = strtok(NULL, " ");
                while (split != NULL) {
                    if(split[0]!='-') {
                        flag = 1;
                        break;
                    }
                    int i;
                    for(i=1;split[i]!='\0';i++) {
                        if(split[i]!='a' && split[i]!='f' && split[i]!='l' &&
                                split[i]!='h' && split[i]!='r' && split[i]!='s' && split[i]!='t') {
                            break;
                        }
                    }
                    if(split[i]!='\0') {
                        flag=1;
                        break;
                    }
                    split = strtok(NULL, " ");
                }
                if(!flag) {
                    FILE *in;
                    char cwd[MAX_MSG];
                    if((in = popen(cmd, "r"))) {
                        while(fgets(cwd, MAX_MSG, in)!=NULL){
                            rc = sendto(sd, cwd, MAX_MSG, 0, 
                                    (struct sockaddr *) &remoteCliAddr, 
                                    sizeof(remoteCliAddr));
                            if(rc<0) {
                                printf("%s: cannot send response %s \n", cwd);
                                close(sd);
                                exit(1);
                            }
                        }
                        pclose(in);
                    }
                }
            }
            // else drop packets. :P
        }
    }/* end of server infinite loop */

    return 0;
}
