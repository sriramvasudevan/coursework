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
    char **slw = NULL;

    int max_seq_no, curr_frame;
    max_seq_no = 0;
    curr_frame = 0;
    float p;

    /* initialize random seed: */
    srand(time(NULL));

    /* check command line args */
    if(argc<3) {
        printf("usage : %s <SWP Size> <p>\n", argv[0]);
        exit(1);
    }

    sscanf (argv[1],"%d",&max_seq_no);
    p = atof(argv[2]);
    max_seq_no = 2*max_seq_no;
    slw = (char**)malloc(sizeof(char*)*max_seq_no);
    int j;
    for(j=0;j<max_seq_no;j++) {
        slw[j] = (char*)malloc(sizeof(char)*(MAX_MSG+10));
    }

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
                if(chdir("/home/sriram/test")) {
                    strcpy(msg, "No such file or directory");
                }
                else {
                    strcpy(msg, "ACK");
                }
                rc = sendto(sd, msg, MAX_MSG+1, 0, 
                        (struct sockaddr *) &remoteCliAddr, 
                        sizeof(remoteCliAddr));

                if(rc<0) {
                    printf("%s: cannot send response %s \n", msg);
                    close(sd);
                    exit(1);
                }
            }
            else if (!strcmp(split, "get")) {
                split = strtok (NULL, " ");
                if(split) {
                    FILE *in;
                    char cwd[MAX_MSG];
                    in = fopen(split, "rb");
                    //FILE *testfile;
                    //testfile = fopen("serverside", "wb");
                    if(in) {
                        int i, temp, to_send, no_sent, first_to_send, old_f2s;
                        long size;
                        char cwd[MAX_MSG];

                        // obtain file size:
                        fseek (in , 0 , SEEK_END);
                        size = ftell (in);
                        rewind (in);

                        //faking an ACK to avoid spl init code for first send.
                        first_to_send = 0;
                        sprintf(msg, "%d", max_seq_no-1); 
                        strcat(msg, " ACK");
                        to_send = 0;
                        old_f2s = 0;

                        int flag=0;

                        while(size>ftell(in)) {
                            // printf("msg: %s\n", msg);
                            temp = atoi(argv[1]) - to_send;

                            for(i=first_to_send,no_sent=0;no_sent<temp&&feof(in)==0;i=(i+1)%max_seq_no,no_sent++) {
                                memset(slw[i],0x0,MAX_MSG+10);
                                sprintf(slw[i], "%d", i); 
                                strcat(slw[i], " ");
                                //int old_len = strlen(slw[i]);
                                //int bytes_read = fread(slw[i]+old_len,1,MAX_MSG,in);
                                memset(cwd,0x0,MAX_MSG);
                                int bytes_read = fread(cwd,1,MAX_MSG,in);
                                char int_holder[MAX_MSG];
                                sprintf(int_holder, "%d", bytes_read);
                                strcat(slw[i], int_holder);
                                strcat(slw[i], " ");
                                int j=0;
                                int old_len = strlen(slw[i]);
                                for(j=0; j<bytes_read; j++) {
                                    slw[i][j+old_len] = cwd[j];
                                }
                                //fwrite(cwd, sizeof(char), bytes_read, testfile);
                                printf("send: %d\n", i); //TODO: comment
                                //printf("send: %d\n",i);
                                float r = ((float)rand()/(RAND_MAX));
                                if(r>p) {
                                    printf("pocchu da naaye: %d\n",i); //TODO: comment
                                    rc = sendto(sd, slw[i], MAX_MSG+11, 0, 
                                            (struct sockaddr *) &remoteCliAddr, 
                                            sizeof(remoteCliAddr));
                                    if(rc<0) {
                                        printf("%s: cannot send response %s \n", msg);
                                        close(sd);
                                        exit(1);
                                    }
                                }
                            }
                            printf("Newiter:\n"); //TODO: comment

                            first_to_send = i;

                            int j=0;
                            struct timeval tv;
                            tv.tv_sec = 6;  /* 333 msecs Timeout */
                            tv.tv_usec = 0;
                            setsockopt(sd, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));
                            while(j<5) { //3 times, to approximate 1 sec
                                n = recvfrom(sd, msg, MAX_MSG, 0, 
                                        (struct sockaddr *) &cliAddr, &cliLen);
                                if(n<0) {
                                    for(i=old_f2s,no_sent=0;no_sent<1;i=(i+1)%max_seq_no,no_sent++) {
                                    //for(i=old_f2s,no_sent=0;no_sent<atoi(argv[1]);i=(i+1)%max_seq_no,no_sent++) {
                                        //printf("resend: %d\n",i);
                                        printf("resend: %d\n",i); //TODO: comment
                                        float r = ((float)rand()/(RAND_MAX));
                                        if(r>p) {
                                            printf("pocchu da naaye: %d\n",i); //TODO: comment
                                            rc = sendto(sd, slw[i], MAX_MSG+11, 0, 
                                                    (struct sockaddr *) &remoteCliAddr, 
                                                    sizeof(remoteCliAddr));
                                            if(rc<0) {
                                                printf("%s: cannot send response %s \n", msg);
                                                close(sd);
                                                exit(1);
                                            }
                                        }
                                    }
                                    printf("Newiter:\n"); //TODO: comment
                                }
                                else {

                                    //Prevent ACK flooding
                                    char prev_msg[MAX_MSG];
                                    while(strstr(msg,"ACK")) {
                                        strcpy(prev_msg, msg);
                                        n = recvfrom(sd, msg, MAX_MSG, 0, 
                                                (struct sockaddr *) &cliAddr, &cliLen);
                                        if(n<0) {
                                            break;
                                        }
                                    }
                                    strcpy(msg, prev_msg);
                                    //msg now contains most recent ACK

                                    printf("recentACK: %s\n", msg); //TODO: comment

                                    temp = atoi(strtok(msg, " "));
                                    if(temp>first_to_send) {
                                        to_send = (max_seq_no-1-temp+first_to_send);
                                    }
                                    else {
                                        to_send = (first_to_send-1 - temp);
                                    }
                                    if(to_send>atoi(argv[1])||to_send<0) {
                                        to_send = atoi(argv[1]);
                                    }
                                    old_f2s= (temp+1)%max_seq_no;
                                    int j = old_f2s;
                                    int k;
                                    for(k=0;k<to_send;k++,j=(j+1)%max_seq_no) {
                                        //printf("send: %d\n",j);
                                        printf("send: %d\n", j); //TODO: comment
                                        float r = ((float)rand()/(RAND_MAX));
                                        if(r>p) {
                                            printf("pocchu da naaye: %d\n",j); //TODO: comment
                                            rc = sendto(sd, slw[j], MAX_MSG+11, 0, 
                                                    (struct sockaddr *) &remoteCliAddr, 
                                                    sizeof(remoteCliAddr));
                                            if(rc<0) {
                                                printf("%s: cannot send response %s \n", msg);
                                                close(sd);
                                                exit(1);
                                            }
                                        }
                                    }
                                    break;
                                }
                                j++;
                            }
                            if(j==5) {
                                flag = 1;
                                break;
                            }
                        }
                        char eom[MAX_MSG];
                        if(flag) {
                            strcpy(eom, "EOMTERM");
                        }
                        else {
                            strcpy(eom, "EOM");
                        }
                        rc = sendto(sd, eom, MAX_MSG+1, 0, 
                                (struct sockaddr *) &remoteCliAddr, 
                                sizeof(remoteCliAddr));
                        if(rc<0) {
                            printf("%s: cannot send response %s \n", msg);
                            close(sd);
                            exit(1);
                        }
                        j=0;
                        while(j<3) { //3 times, to approximate 1 sec
                            n = recvfrom(sd, msg, MAX_MSG, 0, 
                                    (struct sockaddr *) &cliAddr, &cliLen);
                            if(n<0) {
                                rc = sendto(sd, eom, MAX_MSG+1, 0, 
                                        (struct sockaddr *) &remoteCliAddr, 
                                        sizeof(remoteCliAddr));
                                if(rc<0) {
                                    printf("%s: cannot send response %s \n", msg);
                                    close(sd);
                                    exit(1);
                                }
                            }
                            else if(strstr(msg,"ACK")) {
                                if(!strcmp(msg,"EOMACK")) {
                                    break;
                                }
                                int eom_flag=0;
                                while(strstr(msg,"ACK")) {
                                    n = recvfrom(sd, msg, MAX_MSG, 0, 
                                            (struct sockaddr *) &cliAddr, &cliLen);
                                    if(n<0) {
                                        break;
                                    }
                                    if(!strcmp(msg,"EOMACK")) {
                                        eom_flag=1;
                                        break;
                                    }
                                }
                                if(eom_flag==1) {
                                    break;
                                }
                            }
                            j++;
                        }
                        if(j==3) {
                            flag = 1;
                        }
                        //Remove timer
                        struct timeval tv;
                        tv.tv_sec = 0;
                        tv.tv_usec = 0;
                        setsockopt(sd, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));
                        if(!flag) {
                            printf("File transfer successful.\n");
                        }
                        else {
                            printf("Client %s:%u disconnected. File transmission terminated.\n", inet_ntoa(cliAddr.sin_addr), ntohs(cliAddr.sin_port));
                        }
                        fclose(in);
                        exit(0);
                        //fclose(testfile);
                    }
                }
            }
            else if (!strcmp(split, "done")) {
                /* Respond with exit message */
                strcpy(msg, "ACK");
                rc = sendto(sd, msg, MAX_MSG+1, 0, 
                        (struct sockaddr *) &remoteCliAddr, 
                        sizeof(remoteCliAddr));

                if(rc<0) {
                    printf("%s: cannot send response %s \n", msg);
                    close(sd);
                    exit(1);
                }
                printf("Connection to client %s:%u closed.\n", inet_ntoa(cliAddr.sin_addr), ntohs(cliAddr.sin_port));
            }
            // else drop packets. :P
        }
    }/* end of server infinite loop */


    for(j=0;j<max_seq_no;j++) {
        free(slw[j]);
    }
    free(slw);

    return 0;
}
