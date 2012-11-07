/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 15 October, 2012, 1:59 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*******************************************************************************
 * 
 * Characterizing a Relation.
 * 
 ******************************************************************************/

/*******************************************************************************
 * 
 * Function to calculate equivalence class. The adjacency matrix supplied must
 * be equivalent.
 * 
 ******************************************************************************/
void equivalenceClass(int **matrix, int matrixOrder) {
    int i = 0, j = 0, k = 0, m = 0, equivalenceClassNumber = 0;
    int** equivalenceClass;
    int n = matrixOrder;

    //Initialize the values of the pointers to NULL.
    equivalenceClass = (int**) malloc(n * sizeof (int *));
    for (i = 0; i < n; i++) {
        equivalenceClass[i] = (int*) malloc(n * sizeof (int));
    }

    //Initialize the matrix elements to zero.
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            equivalenceClass[i][j] = 0;
        }
    }

    //Iterate row-wise through the adjacency matrix.
    for (i = 0; i < matrixOrder; i++) {

        //check if the element exists already in a class.
        for (j = 0; j < equivalenceClassNumber; j++) {
            for (k = 0; k < n; k++) {
                if (equivalenceClass[j][k] == i + 1) {
                    break;
                }
            }
            if (k < n) {
                break;
            }
        }
        if (j < equivalenceClassNumber) {
            continue;
        }

        //if the element doesn't exist in an equivalence class already, add all elements associated to a new class.
        for (j = 0; j < matrixOrder; j++) {
            if (matrix[i][j]) {
                equivalenceClass[equivalenceClassNumber][m] = j + 1;
                m++;
            }
        }
        equivalenceClassNumber++;
    }

    //print the result.
    printf("\nThe equivalence classes are:\n");
    for (i = 0; i < equivalenceClassNumber; i++) {
        printf("\n%d. {", i + 1);
        for (j = 0; j < n; j++) {
            //if non-zero, then an element has been added.
            if (equivalenceClass[i][j]) {
                printf(" %d,", equivalenceClass[i][j]);
            }
        }
        printf(" }\n");
    }

    //free up the initialized memory.
    free(equivalenceClass);
}

/*******************************************************************************
 * 
 * Function to check reflexivity of a relation.
 * 
 ******************************************************************************/
int reflexive(int **matrix, int matrixOrder) {
    int i;

    for (i = 0; i < matrixOrder; i++) {
        if (matrix[i][i] == 0) {
            break;
        }
    }

    if (i < matrixOrder) {
        return 0;
    }
    return 1;
}

/*******************************************************************************
 * 
 * Function to check symmetry of a relation.
 * 
 ******************************************************************************/
int symmetric(int **matrix, int matrixOrder) {
    int i, j;

    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            if (matrix[i][j] != matrix[j][i]) {
                break;
            }
        }
        if (j < matrixOrder) {
            break;
        }
    }

    if (i < matrixOrder) {
        return 0;
    }
    return 1;
}

/*******************************************************************************
 * 
 * Function to check asymmetry of a relation.
 * 
 ******************************************************************************/
int asymmetric(int **matrix, int matrixOrder) {
    int i, j;

    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            if ((matrix[i][j] == 1) && (matrix[j][i] == 1) && (i != j)) {
                break;
            }
        }
        if (j < matrixOrder) {
            break;
        }
    }

    if (i < matrixOrder) {
        return 0;
    }
    return 1;
}

/*******************************************************************************
 * 
 * Function to check transitivity of a relation.
 * 
 ******************************************************************************/
int transitive(int **matrix, int matrixOrder) {
    int i, j, k;

    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            for (k = 0; k < matrixOrder; k++) {
                if (matrix[i][j] == 1 && matrix[j][k] == 1 && matrix[i][k] == 0) {
                    break;
                }
            }
            if (k < matrixOrder) {
                break;
            }
        }
        if (j < matrixOrder) {
            break;
        }
    }

    if (i < matrixOrder) {
        return 0;
    }
    return 1;
}

/*******************************************************************************
 * 
 * Function to check for an equivalence relation.
 * 
 ******************************************************************************/
int equivalence(int **matrix, int matrixOrder) {
    if (!(reflexive(matrix, matrixOrder) * symmetric(matrix, matrixOrder) * transitive(matrix, matrixOrder))) {
        return 0;
    }
    return 1;
}

/*******************************************************************************
 * 
 * Function to check if the relation is a partial order.
 * 
 ******************************************************************************/
int partialOrder(int **matrix, int matrixOrder) {

    if (!(reflexive(matrix, matrixOrder) * transitive(matrix, matrixOrder) * asymmetric(matrix, matrixOrder))) {
        return 0;
    }
    return 1;
}

/*******************************************************************************
 * 
 * Warshall's Algorithm, to compute the transitive closure of a relation.
 * 
 ******************************************************************************/
void warshall(int **matrix, int matrixOrder) {
    int i = 0, j = 0, k = 0;

    for (k = 0; k < matrixOrder; k++) {
        for (i = 0; i < matrixOrder; i++) {
            for (j = 0; j < matrixOrder; j++) {
                if (matrix[i][k] == 1) {
                    if (matrix[i][j] == 1 || matrix[k][j] == 1) {
                        matrix[i][j] = 1;
                    } else {

                        matrix[i][j] = 0;
                    }
                }
            }
        }
    }
}

/*******************************************************************************
 * 
 * The main function.
 * 
 ******************************************************************************/
int main(int argc, char** argv) {
    if (argc <= 1) {
        printf("\n Please provide a filename as a command line argument.\n");
        exit(-1);
    }

    FILE *inputfile;
    int matrixOrder = 0, i = 0, j = 0;
    int** matrix;

    inputfile = fopen(argv[1], "r");

    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    //Read the number of elements.
    fscanf(inputfile, "%d", &matrixOrder);

    //Initialize the values of the pointers to NULL.
    matrix = (int**) malloc(matrixOrder * sizeof (int *));
    for (i = 0; i < matrixOrder; i++) {
        matrix[i] = (int*) malloc(matrixOrder * sizeof (int));
    }

    //Read in the matrix from the input file.
    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            fscanf(inputfile, "%d", &matrix[i][j]);
        }
    }

    //Print the read in matrix.
    printf("The read in adjacency matrix is:\n");
    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }

    //equivalence relation
    printf("\nThe relation is ");
    if (!equivalence(matrix, matrixOrder)) {
        printf("not ");
    }
    printf("an equivalence relation.");
    //print equivalence class if equivalence relation
    if (equivalence(matrix, matrixOrder)) {
        equivalenceClass(matrix, matrixOrder);
    }

    //partial order
    printf("\n\nThe relation is ");
    if (!partialOrder(matrix, matrixOrder)) {
        printf("not ");
    }
    printf("a partial order.");

    //transitive closure
    warshall(matrix, matrixOrder);
    ////Print the transitive closure of the matrix.
    printf("\n\nThe transitive closure of the entered matrix is:\n");
    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }

    //free up the initialized memory.
    free(matrix);

    return (EXIT_SUCCESS);
}

