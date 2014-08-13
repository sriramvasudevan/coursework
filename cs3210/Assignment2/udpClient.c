#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h> /* memset() */
#include <stdlib.h>
#include <sys/time.h>

#define REMOTE_SERVER_PORT 8000
#define LOCAL_CLIENT_PORT 8500
#define MAX_MSG 100


int main(int argc, char *argv[]) {

    int sd, rc, n, i, respLen;
    struct sockaddr_in cliAddr, remoteServAddr, respAddr;
    struct hostent *h;
    char msg[MAX_MSG];
    int file_recv = 0, recv = 0;
    FILE *fp;

    /* check command line args */
    if(argc<2) {
        printf("usage : %s <server> \n", argv[0]);
        exit(1);
    }

    /* get server IP address (no check if input is IP address or DNS name */
    h = gethostbyname(argv[1]);
    if(h==NULL) {
        printf("%s: unknown host '%s' \n", argv[0], argv[1]);
        exit(1);
    }

    printf("%s: sending data to '%s' (IP : %s) \n", argv[0], h->h_name,
            inet_ntoa(*(struct in_addr *)h->h_addr_list[0]));

    remoteServAddr.sin_family = h->h_addrtype;
    memcpy((char *) &remoteServAddr.sin_addr.s_addr, 
            h->h_addr_list[0], h->h_length);
    remoteServAddr.sin_port = htons(REMOTE_SERVER_PORT);

    /* socket creation */
    sd = socket(AF_INET,SOCK_DGRAM,0);
    if(sd<0) {
        printf("%s: cannot open socket \n",argv[0]);
        exit(1);
    }

    /* bind any port */
    cliAddr.sin_family = AF_INET;
    cliAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    cliAddr.sin_port = htons(LOCAL_CLIENT_PORT);

    rc = bind(sd, (struct sockaddr *) &cliAddr, sizeof(cliAddr));
    if(rc<0) {
        printf("%s: cannot bind port\n", argv[0]);
        exit(1);
    }

    char request[MAX_MSG];
    printf("Type 'open' to start receiving information.\n");

    while(strcmp(request,"done")) {
        fgets (request, MAX_MSG, stdin);
        request[strlen(request)-1] = '\0';

        rc = sendto(sd, request, strlen(argv[i])+1, 0, 
                (struct sockaddr *) &remoteServAddr, 
                sizeof(remoteServAddr));

        if(rc<0) {
            printf("%s: could not send '%s' \n",argv[0],request);
            close(sd);
            exit(1);
        }

        /* waiting for response */
        /* infinite loop */
        while(1) {
            /* init buffer */
            memset(msg,0x0,MAX_MSG);

            /* receive message */
            respLen = sizeof(respAddr);

            struct timeval tv;
            tv.tv_sec = 2;  /* 30 Secs Timeout */
            tv.tv_usec = 0;  // Not init'ing this can cause strange errors
            setsockopt(sd, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));

            n = recvfrom(sd, msg, MAX_MSG, 0, 
                    (struct sockaddr *) &respAddr, &respLen);

            if(n<0) {
                if(file_recv) {
                    file_recv=0;
                    fclose(fp);
                    printf("%s: File saved successfully.\n",argv[0]);
                }

                if (recv) { //received messages from server till now. No more incoming.
                    recv = 0;
                }
                else {
                    printf("%s: not receiving data. Try again.\n",argv[0]);
                }
                break;
            }

            //if here => some message received. So set recv = 1
            recv = 1;

            /* print received message if not ACK*/
            if(strcmp(msg, "ACK")) {
                if(!strcmp(strtok(request, " "), "get")) {
                    if(file_recv) {
                        fprintf(fp, msg);
                    }
                    else {
                        fp = fopen(strtok(NULL, " "), "w");
                        file_recv = 1;
                    }
                }
                else {
                    printf("Server: %s", msg);
                }
            }
        }/* end of server infinite loop */
    }

    return 1;

}
