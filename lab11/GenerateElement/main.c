/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 8 November, 2012, 10:41 AM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */

/*
int generateElement(int* s, int cardinality, int v) {
    int i, addns;
    for (i = 0; i < cardinality; i++) {
        int val = v - s[i];
        if (val not in s) {
            int got = generateElement(val);
            if (got >= 0) {
                if (addns > got + 1) {
                    addns = got + 1;
                }
            }
        }
    }
    return addns;

    mergeSort(s);
    int v;
    for (v = s[0];)
    }*/
int elementOf(int element, int* set, int cardinality) {
    int i = 0;
    for (i = 0; i < cardinality; i++) {
        if (element == set[i]) {
            break;
        }
    }
    if (i == cardinality) {
        return 0;
    }
    return 1;
}

int max(int a, int b) {
    return (a > b ? a : b);
}

int generateElement(int* set, int cardinality, int value) {
    int i = 0, j = 0;

    int* minadditions;
    minadditions = (int*) malloc((value + 1) * sizeof (int));

    int* generatedset = (int*) malloc((value) * sizeof (int));
    for (i = 0; i < cardinality; i++) {
        generatedset[i] = set[i];
    }

    minadditions[0] = 0;
    for (i = 1; i < (value + 1); i++) {
        if (elementOf(i, generatedset, cardinality)) {
            minadditions[i] = 0;
        } else {
            minadditions[i] = -1;
        }
    }

    if (!elementOf(value, generatedset, cardinality)) {
        for (i = 1; i < (value + 1); i++) {
            for (j = 0; j < cardinality; j++) {
                if (generatedset[j] <= i) {
                    if ((minadditions[i - generatedset[j]] != -1) && (minadditions[generatedset[j]] != -1)) {
                        if ((!minadditions[i - generatedset[j]])&&(minadditions[i])) {
                            minadditions[i] = minadditions[generatedset[j]] + 1;
                        } else if (!minadditions[generatedset[j]]&&(minadditions[i])) {
                            minadditions[i] = minadditions[i - generatedset[j]] + 1;
                        } else if (((minadditions[max(i - generatedset[j], generatedset[j])] + 1) < minadditions[i])
                                || (minadditions[i] == -1)) {
                            minadditions[i] = minadditions[max(i - generatedset[j], generatedset[j])] + 1;
                        }
                    }
                }
            }
            if ((minadditions[i] != -1) && (!elementOf(i, generatedset, cardinality))) {
                generatedset[cardinality] = i;
                cardinality++;
            }
        }
    }

    int temporary = minadditions[value];
    free(minadditions);
    free(generatedset);
    return temporary;
}

int main(int argc, char** argv) {
    if (argc <= 1) {
        printf("\n Please provide a filename as a command line argument.\n");
        exit(-1);
    }

    FILE* inputfile;
    int* set;
    int cardinality, value, i = 0;

    inputfile = fopen(argv[1], "r");

    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    //Read in the number of vertices.
    fscanf(inputfile, "%d", &cardinality);

    //Initialize the values of the pointers to NULL.
    set = (int*) malloc(cardinality * sizeof (int));

    //Read in the graph from the input file.
    for (i = 0; i < cardinality; i++) {
        fscanf(inputfile, "%d", &set[i]);
    }

    //Read in the number of vertices.
    fscanf(inputfile, "%d", &value);

    //Close the opened file.
    fclose(inputfile);

    int minadditions = generateElement(set, cardinality, value);
    printf("Number of times we used the + operator = %d\n", minadditions);

    free(set);
    return (EXIT_SUCCESS);
}

