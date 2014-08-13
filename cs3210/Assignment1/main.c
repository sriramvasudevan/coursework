/**
 * Sriram V.
 * CS11B058
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


/**
 * Generate a random odd number between 3 and 159
 */
int getRandError() {
    int randval = (rand()%157) + 3;
    if (randval%2==0) {
        randval++;
    }
    return randval;
}


/**
 * Generate burst error
 */
void getBurstErrorString(char* message, int error_nos) {
    int randval = rand()%(161-error_nos);
    int i;
    for(i=randval;i<(randval+error_nos);i++) {
        if(message[i]=='0') {
            message[i] = '1';
        }
        else {
            message[i] = '0';
        }
    }
}


/**
 * Check if an element is in a list.
 */
int isIn(int* pos, int n, int val) {
    int i;
    for(i=0;i<n;i++) {
        if(pos[i]==val) {
            return 1;
        }
    }
    return 0;
}


/**
 * Generate a corrupted message
 */
void getCorruptedString(char* message, int error_nos) {
    int i;
    int* pos = (int*) malloc(error_nos*sizeof(int));
    int temp;
    for(i=0;i<error_nos;i++) {
        temp = rand()%160;
        while(isIn(pos, i, temp)) {
            temp = rand()%160;
        }
        pos[i] = temp;
    }
    for(i=0;i<160;i++) {
        if (isIn(pos, error_nos, i)) {
            if(message[i]=='0') {
                message[i] = '1';
            }
            else {
                message[i] = '0';
            }
        }
    }
    free(pos);
}


/**
 * Find log2 value of a number
 */
int countBinDigits(long value) {
    int i=0;
    long temp = value;
    while(value) {
        value>>=1;
        i++;
    }
    return i;
}


/**
 * Perform long division
 */
long longDivision(char* dividend, long divisor) {
    long subtrahend = (dividend[0]-48);
    char* i;

    for (i=(dividend+1); *i!='\0'; i++) {
        subtrahend <<= 1;
        subtrahend |= (*i - 48);
        if(subtrahend) {
            if(countBinDigits(subtrahend)>=countBinDigits(divisor)) {
                subtrahend ^= divisor;
            }
        }
    }
    return subtrahend;
}


/**
 * Calculate CRC for a message
 */
void calcCRC(char* dividend, long divisor, char* remainder) {
    long subtrahend = longDivision(dividend, divisor);

    //convert subtrahend to a string starting at remainder
    char rem[33];
    rem[0] = '\0';
    int j=1;

    if(subtrahend) {
        while(subtrahend) {
            rem[j] = ((subtrahend%2) + 48);
            subtrahend>>=1;
            j++;
        }
    }
    else {
        for(;j<33; j++) {
            rem[j] = '0';
        }
    }

    for(j=0; j<33; j++) {
        remainder[j] = rem[32-j];
    }
}


/**
 * Wrapper function for CRC
 */
void getFinalMsg(char* message, long crc) {
    char extension[] = {
        '0', '0', '0', '0', '0',
        '0', '0', '0', '0', '0',
        '0', '0', '0', '0', '0',
        '0', '0', '0', '0', '0',
        '0', '0', '0', '0', '0',
        '0', '0', '0', '0', '0',
        '0', '0', '\0'};

    char *tpoly = (char*) malloc(256*sizeof(char));
    strcpy(tpoly, message);
    strcat(tpoly, extension);

    char* remainder;
    // make remainder point to the end of the message string
    // so that the remainder will get appended during CRC
    // calculation. No need of explicit subtraction of remainder
    // then.
    for(remainder = message; *remainder!='\0'; remainder++);

    calcCRC(tpoly, crc, remainder);

    free(tpoly);
}


/**
 * Main function
 */
int main(int argc, char *argv[]) {
    /* check command line args */
    if(argc<3) {
        printf("Usage: %s <inputfile> <outputfile>\n", argv[0]);
        exit(1);
    }

    FILE *ifp;
    ifp = fopen(argv[1], "r");

    if (ifp==NULL) {
        printf("Error while opening the file %s.\n", argv[1]);
        exit(1);
    }

    FILE *ofp;
    ofp = fopen(argv[2], "w"); 

    char *message = (char*) malloc(256*sizeof(char));
    char *corrupted = (char*) malloc(256*sizeof(char));
    char crcbinary[] = {
        '1', '0', '0', '0', '0',
        '0', '1', '0', '0', '1',
        '1', '0', '0', '0', '0',
        '0', '1', '0', '0', '1',
        '0', '1', '1', '0', '1',
        '1', '1', '1', '1', '1',
        '0', '1', '1', '\0'};
    long crc = strtol(crcbinary,NULL,2);
    int i;

    while(fgets(message, 256, ifp) != NULL) {
        message = strtok(message, "\n");

        // Get Message with CRC
        fprintf(ofp, "Input: %s\n", message);
        getFinalMsg(message, crc);
        fprintf(ofp, "CRC: %s\n", message);

        // 1-bit errors
        for(i=0; i<10; i++) {
            fprintf(ofp, "Original String with CRC: %s\n", message);
            strcpy(corrupted, message);
            getCorruptedString(corrupted, 1);
            fprintf(ofp, "Corrupted String: %s\n", corrupted);
            int remainder = longDivision(corrupted, crc);
            if (remainder) {
                fprintf(ofp, "CRC Check: Failed\n");
            }
            else {
                fprintf(ofp, "CRC Check: Passed\n");
            }
        }

        // 2-bit errors
        for(i=0; i<10; i++) {
            fprintf(ofp, "Original String with CRC: %s\n", message);
            strcpy(corrupted, message);
            getCorruptedString(corrupted, 2);
            fprintf(ofp, "Corrupted String: %s\n", corrupted);
            int remainder = longDivision(corrupted, crc);
            if (remainder) {
                fprintf(ofp, "CRC Check: Failed\n");
            }
            else {
                fprintf(ofp, "CRC Check: Passed\n");
            }
        }

        // 3-bit and above odd numbered errors
        for(i=0; i<10; i++) {
            fprintf(ofp, "Original String with CRC: %s\n", message);
            strcpy(corrupted, message);
            int error_nos = getRandError();
            getCorruptedString(corrupted, error_nos);
            fprintf(ofp, "Corrupted String: %s\n", corrupted);
            fprintf(ofp, "Number of Errors: %d\n", error_nos);
            int remainder = longDivision(corrupted, crc);
            if (remainder) {
                fprintf(ofp, "CRC Check: Failed\n");
            }
            else {
                fprintf(ofp, "CRC Check: Passed\n");
            }
        }

        // 30-bit burst errors
        for(i=0; i<10; i++) {
            fprintf(ofp, "Original String with CRC: %s\n", message);
            strcpy(corrupted, message);
            getBurstErrorString(corrupted, 30);
            fprintf(ofp, "Corrupted String: %s\n", corrupted);
            int remainder = longDivision(corrupted, crc);
            if (remainder) {
                fprintf(ofp, "CRC Check: Failed\n");
            }
            else {
                fprintf(ofp, "CRC Check: Passed\n");
            }
        }
    } 

    free(message);
    free(corrupted);
    fclose(ifp);
    fclose(ofp);

    return 0;
}
