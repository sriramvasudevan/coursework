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


int getFirst(char *msg, char a) {
    int i;
    for(i=0;i<MAX_MSG+10;i++) {
        if(msg[i]==a) {
            break;
        }
    }
    return i;
}


int max(int a, int b, int laf, int lfr) {
    if (lfr<laf) {
        if(a>b) {
            return a;
        }
        else {
            return b;
        }
    }
    else {
        //laf     lfra,b max_seq_no
        if((a>=lfr&&b>=lfr)||(a<=laf&&b<=laf)) {
            if(a>b) {
                return a;
            }
            else {
                return b;
            }
        }
        else {
            if(a>b) {
                return b;
            }
            else {
                return a;
            }
        }
    }
}


int main(int argc, char *argv[]) {

    int sd, rc, n, i, respLen;
    struct sockaddr_in cliAddr, remoteServAddr, respAddr;
    struct hostent *h;
    char msg[MAX_MSG+10], parse[2*MAX_MSG];
    char **slw = NULL;
    int file_recv = 0, recv = 0;
    FILE *fp;

    int max_seq_no, curr_frame;
    max_seq_no = 0;
    curr_frame = 0;

    int incoming, laf, lfr, needed, max_recv;
    int *framerecv = NULL;
    int *n_list = NULL;

    char msg_no_temp[MAX_MSG];

    /* check command line args */
    if(argc<3) {
        printf("usage : %s <server> <SWP Size>\n", argv[0]);
        exit(1);
    }

    sscanf (argv[2],"%d",&max_seq_no);
    max_seq_no = 2*max_seq_no;
    slw = (char**)malloc(sizeof(char*)*max_seq_no);
    framerecv = (int*)malloc(sizeof(int)*max_seq_no);
    n_list = (int*)malloc(sizeof(int)*max_seq_no);
    for(i=0;i<max_seq_no;i++) {
        slw[i] = (char*)malloc(sizeof(char)*(MAX_MSG+10));
        framerecv[i] = 0;
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

        rc = sendto(sd, request, MAX_MSG+1, 0, 
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
            memset(msg,0x0,MAX_MSG+10);

            /* receive message */
            respLen = sizeof(respAddr);

            struct timeval tv;
            tv.tv_sec = 1;  /* 1 Sec Timeout */
            tv.tv_usec = 0;  // Not init'ing this can cause strange errors
            setsockopt(sd, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));

            n = recvfrom(sd, msg, MAX_MSG+11, 0, 
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
                        //printf("msg: %s\n", msg);
                        // printf("init: %s needed:%d max:%d\n", msg, needed, max_recv);
                        //Avoiding strtok. It's greedy and destructive.

                        int msg_len = getFirst(msg,' ');
                        int k;
                        for(k=0;k<msg_len;k++) {
                            msg_no_temp[k] = msg[k];
                        }
                        msg_no_temp[k] = '\0';
                        incoming = atoi(msg_no_temp);

                        int next_msg_len = getFirst(msg+msg_len+1,' ');
                        for(k=0;k<next_msg_len;k++) {
                            msg_no_temp[k] = msg[k+msg_len+1];
                        }
                        msg_no_temp[k] = '\0';
                        int n_incoming = atoi(msg_no_temp);

                        //printf("laf: %d inc:%d\n",laf, incoming);
                        if((lfr<laf&&incoming<=laf&&incoming>lfr)||(lfr>=laf&&(incoming<=laf||incoming>lfr))) {

                            // bookkeeping calcs
                            if(max_recv==max(max_recv, incoming, laf, lfr)) {
                                if(!framerecv[incoming]) {
                                    needed--;
                                }
                            }
                            else {
                                if (max_recv<incoming) {
                                    needed = needed + (incoming-max_recv-1);
                                }
                                else {
                                    needed = needed + (max_seq_no-max_recv-1) + incoming;
                                }
                                //inc = 2, max_recv =2 for 0,1,2,3 ans= 0
                                //max_recv = 2, inc=3 for 0,1,2,3 ans = 0
                                //if max_recv<inc, then okay
                                //if max_recv>inc, then okay
                            }
                            max_recv = max(max_recv, incoming, laf, lfr);

                            for(k=0;k<n_incoming;k++) {
                                slw[incoming][k] = msg[k+msg_len+next_msg_len+2];
                            }
                            n_list[incoming] = n_incoming;
                            //printf("Got:%d %s\n", incoming, slw[incoming]);
                            framerecv[incoming] = 1;
                            if(!needed) {
                                //write to file
                                int i=0;
                                // This for loop parses % and adds one more in front
                                // of each one of them, since fprintf messes up single
                                // % print. %% is the escaped form of %.
                                for(i=(lfr+1)%max_seq_no;i<=max_recv;i++) {
                                    fwrite(slw[i], sizeof(char), n_list[i], fp);
                                    framerecv[i] = 0;
                                }

                                if(max_recv>lfr) {
                                    laf = (laf+(max_recv-lfr))%max_seq_no;
                                }
                                else {
                                    laf = (laf+(max_seq_no-lfr-1)+max_recv+1)%max_seq_no;
                                }
                                lfr = max_recv%max_seq_no;
                                // init: 0     long lSize;
                                //  needed:0 max:0
                                // laf: 1 lfr:3
                                // Got:0     long lSize;
                                // 
                                // 
                                // init: 1     char* buff;
                                //  needed:0 max:0
                                // laf: 1 lfr:3, should be laf: 2, lfr: 0
                                // Got:1     char* buff;

                                // send ACK to server
                                sprintf(msg, "%d", max_recv); 
                                strcat(msg, " ACK");
                                rc = sendto(sd, msg, MAX_MSG+1, 0, 
                                        (struct sockaddr *) &remoteServAddr, 
                                        sizeof(remoteServAddr));
                                if(rc<0) {
                                    printf("%s: cannot send response %s \n", msg);
                                    close(sd);
                                    exit(1);
                                }
                            }
                        }


                    }
                    else {
                        fp = fopen(strtok(NULL, ""), "wb");
                        file_recv = 1;
                        //printf("msg: %s\n", msg);
                        
                        int msg_len = getFirst(msg,' ');
                        int k;
                        for(k=0;k<msg_len;k++) {
                            msg_no_temp[k] = msg[k];
                        }
                        msg_no_temp[k] = '\0';
                        incoming = atoi(msg_no_temp);

                        int next_msg_len = getFirst(msg+msg_len+1,' ');
                        for(k=0;k<next_msg_len;k++) {
                            msg_no_temp[k] = msg[k+msg_len+1];
                        }
                        msg_no_temp[k] = '\0';
                        int n_incoming = atoi(msg_no_temp);

                        lfr = -1;
                        laf = atoi(argv[2]) -1;
                        //printf("laf: %d, inc:%d\n",laf, incoming);
                        max_recv = incoming;
                        needed = incoming;
                        if((lfr<laf&&incoming<=laf&&incoming>lfr)||(lfr>=laf&&(incoming<=laf||incoming>lfr))) {
                            for(k=0;k<n_incoming;k++) {
                                slw[incoming][k] = msg[k+msg_len+next_msg_len+2];
                            }
                            n_list[incoming] = n_incoming;
                            // printf("Got:%d %s\n", incoming, slw[incoming]);
                            framerecv[incoming] = 1;
                            if(!needed) {
                                //write to file
                                int i=0;
                                for(i=(lfr+1)%max_seq_no;i<=max_recv;i++) {
                                    fwrite(slw[i], sizeof(char), n_list[i], fp);
                                    framerecv[i] = 0;
                                }

                                laf = (laf+(max_recv-lfr))%max_seq_no;
                                lfr = max_recv%max_seq_no;

                                // send ACK to server
                                sprintf(msg, "%d", max_recv); 
                                strcat(msg, " ACK");
                                rc = sendto(sd, msg, MAX_MSG+1, 0, 
                                        (struct sockaddr *) &remoteServAddr, 
                                        sizeof(remoteServAddr));
                                if(rc<0) {
                                    printf("%s: cannot send response %s \n", msg);
                                    close(sd);
                                    exit(1);
                                }
                            }
                        }
                    }
                }
                else {
                    printf("Server: %s", msg);
                }
            }
        }/* end of server infinite loop */
    }

    for(i=0;i<max_seq_no;i++) {
        free(slw[i]);
    }
    free(n_list);
    free(framerecv);
    free(slw);

    return 0;

}
