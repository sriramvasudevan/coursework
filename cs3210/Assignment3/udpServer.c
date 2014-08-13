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

    /* check command line args */
    if(argc<2) {
        printf("usage : %s <SWP Size> \n", argv[0]);
        exit(1);
    }

    sscanf (argv[1],"%d",&max_seq_no);
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
                if(chdir("/")) {
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
            else if (!strcmp(split, "cd")) {
                split = strtok (NULL, " ");
                if(split) {
                    if(chdir(split)) {
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
                        int i, temp, no_sent, first_to_send;
                        long size;
                        char cwd[MAX_MSG];

                        // obtain file size:
                        fseek (in , 0 , SEEK_END);
                        size = ftell (in);
                        rewind (in);

                        //faking an ACK to avoid spl init code for first send.
                        first_to_send = 0;
                        sprintf(msg, "%d", atoi(argv[1])-1); 
                        strcat(msg, " ACK");

                        int flag=0;

                        while(size>ftell(in)) {
                            // printf("msg: %s\n", msg);
                            temp = atoi(strtok(msg, " "));
                            if(temp>=first_to_send) {
                                temp = temp - first_to_send + 1;
                            }
                            else {
                                temp = (max_seq_no - first_to_send) + (temp + 1);
                            }

                            //for(i=first_to_send,no_sent=0;no_sent<temp&&fgets(cwd, MAX_MSG, in)!=NULL;i=(i+1)%max_seq_no,no_sent++) {
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
                                //printf("%d - %s\n", i, slw[i]);
                                //printf("send: %d\n",i);
                                rc = sendto(sd, slw[i], MAX_MSG+11, 0, 
                                        (struct sockaddr *) &remoteCliAddr, 
                                        sizeof(remoteCliAddr));
                                if(rc<0) {
                                    printf("%s: cannot send response %s \n", msg);
                                    close(sd);
                                    exit(1);
                                }
                            }

                            first_to_send = (atoi(strtok(msg, " "))+1)%max_seq_no;

                            int j=0;
                            struct timeval tv;
                            tv.tv_sec = 0;  /* 333 msecs Timeout */
                            tv.tv_usec = 333000;
                            setsockopt(sd, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));
                            while(j<3) { //3 times, to approximate 1 sec
                                n = recvfrom(sd, msg, MAX_MSG, 0, 
                                        (struct sockaddr *) &cliAddr, &cliLen);
                                if(n<0) {
                                    for(i=first_to_send,no_sent=0;no_sent<atoi(argv[1]);i=(i+1)%max_seq_no,no_sent++) {
                                        //printf("resend: %d\n",i);
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
                                else {
                                    break;
                                }
                                j++;
                            }
                            if(j==3) {
                                printf("Client %s:%u disconnected. File transmission terminated.\n", inet_ntoa(cliAddr.sin_addr), ntohs(cliAddr.sin_port));
                                flag = 1;
                                break;
                            }
                        }
                        //Remove timer
                        struct timeval tv;
                        tv.tv_sec = 0;
                        tv.tv_usec = 0;
                        setsockopt(sd, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));
                        if(!flag) {
                            printf("File transfer successful.\n");
                        }
                        fclose(in);
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
            else if (!strcmp(split, "pwd")) {
                FILE *in;
                char cwd[MAX_MSG];
                if((in = popen(split, "r"))){
                    while(fgets(cwd, MAX_MSG, in)!=NULL){
                        rc = sendto(sd, cwd, MAX_MSG+1, 0, 
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
                split = strtok(NULL, "");
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
                    split = strtok(NULL, "");
                }
                if(!flag) {
                    FILE *in;
                    char cwd[MAX_MSG];
                    if((in = popen(cmd, "r"))) {
                        while(fgets(cwd, MAX_MSG, in)!=NULL){
                            rc = sendto(sd, cwd, MAX_MSG+1, 0, 
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


    for(j=0;j<max_seq_no;j++) {
        free(slw[j]);
    }
    free(slw);

    return 0;
}
