/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 8 November, 2012, 10:41 AM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*******************************************************************************
 *
 * Generating an Element in a Group.
 * 
 ******************************************************************************/

//A structure, tree, used to create the binary tree of additions.

typedef struct t {
    int root;
    struct t* left;
    struct t* right;
} tree;

/*******************************************************************************
 *
 * Function to find the greatest of 2 numbers.
 * 
 ******************************************************************************/
int max(int a, int b) {
    return (a > b ? a : b);
}

/*******************************************************************************
 *
 * Function to find the greatest number among an array of integers.
 * 
 ******************************************************************************/
int largestValue(int* a, int n) {
    int i, maxval;
    maxval = a[0];
    for (i = 1; i < n; i++) {
        maxval = max(maxval, a[i]);
    }
    return maxval;
}

/*******************************************************************************
 *
 * Function to check whether an element is present in a set.
 * 
 ******************************************************************************/
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

/*******************************************************************************
 *
 * Function to check whether a string is part of a list of strings. 
 * 
 ******************************************************************************/
int stringOf(char* string, char** list, int listlength) {
    int i;
    for (i = 0; i < listlength; i++) {
        if (!strcmp(string, list[i])) {
            return 1;
        }
    }
    return 0;
}

/*******************************************************************************
 *
 * Function to add elements to the list of elements associated with a 
 * particular element. Adds elements associated to number1, number2, and the
 * element under consideration itself. The list of elements generated is a post
 * order traversal of the binary tree of elements associated with the element.
 * 
 ******************************************************************************/
void addElements(int** elementsneeded, int element, int number1, int* length) {
    int number2 = max(number1, element - number1);
    number1 = element - number2;
    elementsneeded[number1];
    elementsneeded[number2];
    int i, j;
    for (i = 0, j = 0; j < length[number1]; i++, j++) {
        elementsneeded[element][i] = elementsneeded[number1][j];
    }
    for (j = 0; j < length[number2]; j++) {
        elementsneeded[element][i] = elementsneeded[number2][j];
        i++;
    }
    elementsneeded[element][i] = element;
    length[element] = (i + 1);
}

/*******************************************************************************
 *
 * Function to generate a binary tree, given its post-order traversal. 
 * 
 ******************************************************************************/
tree* constructTree(int* numbers, int* length, int* set, int cardinality) {
    tree* maintree = (tree*) malloc(sizeof (tree));
    maintree->root = numbers[*length - 1];
    if (*length > 1) {
        //If the right child is not an element of the set S.
        if (!elementOf(numbers[*length - 2], set, cardinality)) {
            --(*length);
            maintree->right = constructTree(numbers, length, set, cardinality);
            --(*length);
            maintree->left = constructTree(numbers, length, set, cardinality);
        } else {
            --(*length);
            tree* rightsubtree = (tree*) malloc(sizeof (tree));
            rightsubtree->root = numbers[*length - 1];
            rightsubtree->left = NULL;
            rightsubtree->right = NULL;
            maintree->right = rightsubtree;

            //If the left child is not an element of the set S.
            if (!elementOf(numbers[*length - 2], set, cardinality)) {
                --(*length);
                maintree->left = constructTree(numbers, length, set, cardinality);
            } else {
                --(*length);
                tree* leftsubtree = (tree*) malloc(sizeof (tree));
                leftsubtree->root = numbers[*length - 1];
                leftsubtree->left = NULL;
                leftsubtree->right = NULL;
                maintree->left = leftsubtree;
            }
        }
    } else {
        maintree->left = NULL;
        maintree->right = NULL;
    }
    return maintree;
}

/*******************************************************************************
 *
 * Function to format the output string given 2 numbers (a and b), and their
 * sum (c) in the format "a + b = c"
 * 
 ******************************************************************************/
void formatString(char* string, int a, int b, int c) {
    char displayno[10];
    strcpy(string, "");

    sprintf(displayno, "%d", a);
    strcat(string, displayno);

    strcat(string, " + ");

    sprintf(displayno, "%d", b);
    strcat(string, displayno);

    strcat(string, " = ");

    sprintf(displayno, "%d", c);
    strcat(string, displayno);
}

/*******************************************************************************
 *
 * Function to generate the output in the desired format given a binary tree.
 * 
 ******************************************************************************/
void generateOutput(tree* sum, char** output, int* outputlines) {
    char* string;
    //Allocate Memory.
    string = (char*) malloc(100 * sizeof (char));
    //If children nodes exist.
    if ((sum->left) && (sum->right)) {
        //Generate outputs for the left and right subtrees.
        generateOutput(sum->left, output, outputlines);
        generateOutput(sum->right, output, outputlines);
        //Format the output for the current node.
        formatString(string, sum->left->root, sum->right->root, sum->root);
        //Add it to the output if it doesn't exist already.
        if (!stringOf(string, output, *outputlines)) {
            strcpy(output[*outputlines], string);
            ++(*outputlines);
        }
    }
    //Free Memory.
    free(string);
}

/*******************************************************************************
 *
 * Function to print the results. 
 * 
 ******************************************************************************/
void printResult(int* set, int cardinality, int operations, int* numbers, int length) {
    if (operations > 0) {
        int i, j, outputlines = 0;
        char** output;

        //Allocate Memory.
        output = (char**) malloc((operations) * sizeof (char*));
        for (i = 0; i < (operations); i++) {
            output[i] = (char*) malloc(100 * sizeof (char));
        }
        tree* sum = (tree*) malloc(sizeof (tree));

        //Generate the binary tree, using its post-order traversal.
        sum = constructTree(numbers, &length, set, cardinality);

        //Generate the output using the binary tree.
        generateOutput(sum, output, &outputlines);
        //Print the output.
        for (i = 0; i < outputlines - 1; i++) {
            printf("%s, ", output[i]);
        }
        printf("%s", output[i]);

        //Free up allocated memory.
        free(output);
        free(sum);
    } else if (operations == -1) {
        printf("The number cannot be generated using the given set S.\n");
        return;
    } else {
        printf("The number is an element of the given set S.");
    }
    printf("\nNumber of times we used the + operator = %d\n", operations);
}

/*******************************************************************************
 *
 * Function to generate an element using the elements of a set S. 
 * 
 ******************************************************************************/
void generateElement(int* set, int cardinality, int value) {
    //Declare variables.
    const int MAXVALUE = max(largestValue(set, cardinality), value);
    int i = 0, j = 0, initialcardinality = cardinality;
    //minadditions - least no. of additions to obtain a number.
    //length - keep track of length of elements needed.
    int *minadditions, *length;
    int** elementsneeded; //To keep track of all the elements needed to generate a particular element.

    //Allocate memory.
    minadditions = (int*) malloc((MAXVALUE + 1) * sizeof (int));
    elementsneeded = (int**) malloc((MAXVALUE + 1) * sizeof (int*));
    for (i = 0; i < (MAXVALUE + 1); i++) {
        elementsneeded[i] = (int*) malloc((MAXVALUE + 1) * sizeof (int));
    }
    length = (int*) malloc((MAXVALUE + 1) * sizeof (int));
    int* generatedset = (int*) malloc((MAXVALUE + 1) * sizeof (int));

    //Initialize variables.
    for (i = 0; i < cardinality; i++) {
        generatedset[i] = set[i];
    }
    minadditions[0] = 0;
    length[0] = 0;
    for (i = 1; i < (MAXVALUE + 1); i++) {
        if (elementOf(i, generatedset, cardinality)) {
            minadditions[i] = 0;
            elementsneeded[i][0] = i;
            length[i] = 1;
        } else {
            minadditions[i] = -1;
            length[i] = 0;
        }
    }

    //If the value to be generated is not part of the set S.
    if (!elementOf(value, generatedset, cardinality)) {
        for (i = 1; i < (value + 1); i++) {
            //for all elements of the generated set.
            for (j = 0; j < cardinality; j++) {
                if ((generatedset[j] <= i) && (minadditions[generatedset[j]] != -1) && (minadditions[i - generatedset[j]] != -1)) {
                    if (elementOf(i - generatedset[j], elementsneeded[generatedset[j]], length[generatedset[j]])) {
                        if (((minadditions[generatedset[j]] + 1) < minadditions[i]) || (minadditions[i] == -1)) {
                            minadditions[i] = minadditions[generatedset[j]] + 1;
                            addElements(elementsneeded, i, generatedset[j], length);
                        }

                    } else if (elementOf(generatedset[j], elementsneeded[i - generatedset[j]], length[i - generatedset[j]])) {
                        if (((minadditions[i - generatedset[j]] + 1) < minadditions[i]) || (minadditions[i] == -1)) {
                            minadditions[i] = minadditions[i - generatedset[j]] + 1;
                            addElements(elementsneeded, i, generatedset[j], length);
                        }

                    } else {
                        if (((minadditions[i - generatedset[j]] + minadditions[generatedset[j]] + 1) < minadditions[i]) || (minadditions[i] == -1)) {
                            minadditions[i] = minadditions[i - generatedset[j]] + minadditions[generatedset[j]] + 1;
                            addElements(elementsneeded, i, generatedset[j], length);
                        }
                    }
                }
            }
            //Add element to the generated set if it can be generated.
            if ((minadditions[i] != -1) && (!elementOf(i, generatedset, cardinality))) {
                generatedset[cardinality] = i;
                cardinality++;
            }
        }
    }

    //Print results.
    printResult(set, initialcardinality, minadditions[value], elementsneeded[value], length[value]);

    //Free up dynamically initialized memory.
    free(minadditions);
    free(generatedset);
    free(elementsneeded);
}

/*******************************************************************************
 *
 * The Main function. 
 * 
 ******************************************************************************/
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

    //Read in the cardinality of the set S.
    fscanf(inputfile, "%d", &cardinality);

    //Initialize the values of the pointers to NULL.
    set = (int*) malloc(cardinality * sizeof (int));

    //Read in the elements of the set S from the input file.
    for (i = 0; i < cardinality; i++) {
        fscanf(inputfile, "%d", &set[i]);
    }

    //Read in the value to be generated.
    fscanf(inputfile, "%d", &value);

    //Close the opened file.
    fclose(inputfile);

    //Generate the element.
    generateElement(set, cardinality, value);

    //Free up dynamically initialized memory.
    free(set);
    return (EXIT_SUCCESS);
}