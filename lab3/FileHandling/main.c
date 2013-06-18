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

/******************************************************************************
 * Program to read in words from 2 files, and compute the similarity of the
 * 2 files.
 ******************************************************************************/

/******************************************************************************
 *This function parses the word and removes symbols from the beginning and end 
 * of the word.
 ******************************************************************************/
void parse(char* word) {

    char* lastchar = &word[strlen(word) - 1];
    char* firstchar = &word[0];

    if (*lastchar == ',' || *lastchar == '?' || *lastchar == '.' || *lastchar == '!' ||
            *lastchar == ';' || *lastchar == ':' || *lastchar == '\'' || *lastchar == '\"') {

        *lastchar = '\0';
    }

    if (*firstchar == ',' || *firstchar == '?' || *firstchar == '.' || *firstchar == '!' ||
            *firstchar == ';' || *firstchar == ':' || *firstchar == '\'' || *firstchar == '\"') {

        for (; *firstchar != '\0'; firstchar++) {
            *firstchar = *(firstchar + 1);
        }
    }

}

/*******************************************************************************
 *This function extracts words from the file. 
 *****************************************************************************/
void extractWords(FILE *inputfile, char listOfWords[150][50], int *length) {

    char word[50];
    int i;
    while (fscanf(inputfile, "%s", word) == 1) {
        parse(word);

        for (i = 0; i != *length; i++) {
            if (strcmp(listOfWords[i], word) == 0) {
                break;
            }
        }

        if (i == *length) {
            strcpy(listOfWords[i], word);
            (*length)++;
        }

    }
}

void findSimilarity(char listOfWords1[150][50], int n1,
                    char listOfWords2[150][50], int n2, char *outputfilename) {
    int i = 0, j =0, I = 0, U = 0;
    FILE *outputfile;
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
    fclose(outputfile);
}

int main(int argc, char** argv) {

    char inputfilename[] = "input1";
    char outputfilename[] = "output.txt";
    
    FILE *inputfile;
    char listOfWords1[150][50], listOfWords2[150][50], word[50];
    int n1 = 0, n2 = 0;

    inputfile = fopen(inputfilename, "r");

    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    extractWords(inputfile, listOfWords1, &n1);

    printf("The first list contains %d words.\n", n1);
    fclose(inputfile);

    strcpy(inputfilename, "input2");
    inputfile = fopen(inputfilename, "r");

    extractWords(inputfile, listOfWords2, &n2);

    printf("The second file contains %d words.\n", n2);
    fclose(inputfile);
    
    findSimilarity(listOfWords1, n1, listOfWords2, n2, outputfilename);

    printf("The result has been written to the output file successfully.\n");
    return (EXIT_SUCCESS);
}

