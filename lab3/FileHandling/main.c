/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 27 August, 2012, 7:30 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/*
 * 
 */

void parse(char* word) {
    int j = 0, k = 0;

    for (j = 0; word[j] != '\0'; j++) {
        if (word[j] == ',' || word[j] == '?' || word[j] == '.' || word[j] == '!' ||
                word[j] == ';' || word[j] == ':' || word[j] == '\'' || word[j] == '\"') {

            for (k = j; word[k] != '\0'; k++) {
                word[k] = word[k + 1];
            }
        }
    }
}

int main(int argc, char** argv) {

    FILE *inputfile;
    char inputfilename[] = "input1";
    char listOfWords1[150][50];
    char listOfWords2[150][50];
    char word[50];

    inputfile = fopen(inputfilename, "r");

    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    int i = 0;
    int j = 0;
    int n1 = 0;
    int n2 = 0;

    while (fscanf(inputfile, "%s", word) == 1) {
        parse(word);

        for (i = 0; i != n1; i++) {
            if (strcmp(listOfWords1[i], word) == 0) {
                break;
            }
        }

        if (i == n1) {
            strcpy(listOfWords1[i], word);
        }
        n1++;
    }

    for (i = 0; i != n1; i++) {
        printf("%s\n", &listOfWords1[i]);
    }
    printf("%d\n", n1);
    fclose(inputfile);

    strcpy(inputfilename, "input2");
    inputfile = fopen(inputfilename, "r");
    while (fscanf(inputfile, "%s", word) == 1) {
        parse(word);

        for (i = 0; i != n2; i++) {
            if (strcmp(listOfWords2[i], word) == 0) {
                break;
            }
        }

        if (i == n2) {
            strcpy(listOfWords2[i], word);
        }
        n2++;
    }

    for (i = 0; i != n2; i++) {
        printf("%s\n", &listOfWords2[i]);
    }
    printf("%d\n", n2);
    fclose(inputfile);

    int I = 0;
    int U = 0;
    FILE *outputfile;
    char outputfilename[] = "output.txt";
    outputfile = fopen(outputfilename, "w");

    fprintf(outputfile, "Common Words:\n");
    for (i = 0; i != n1; i++) {
        for (j = 0; j != n2; j++) {
            if (strcmp(tolower(listOfWords1[i]), tolower(listOfWords2[j])) == 0) {
                I++;
                fprintf(outputfile, "->%s\n", listOfWords2[j]);
            }
        }
    }

    U = n1 + n2 - I;
    float S = (float) I / U;
    fprintf(outputfile, "\nSimilarity of the 2 files (S) = %f\n", S);
    return (EXIT_SUCCESS);
}

