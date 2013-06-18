/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 3 September, 2012, 2:20 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/******************************************************************************
 *
 *  A Program to read in a matrix from a file and calculate its determinant.
 * 
 ******************************************************************************/


/******************************************************************************
 *  
 *  This function calculates the determinant of a matrix recursively.
 * 
 ******************************************************************************/
float calculateDeterminant(int **matrix, int matrixOrder) {
    int i = 0, j = 0, k = 0;
    float determinant = 0;

    if (matrixOrder == 1) {
        return matrix[0][0];
    }

    if (matrixOrder == 2) {
        return ( (matrix[0][0] * matrix[1][1])-(matrix[1][0] * matrix[0][1]));
    }

    for (j = 0; j < matrixOrder; j++) {

        float** tempMatrix; //The matrix to hold the minor of the element.
        
        //Initialize the values of the pointers to NULL.
        tempMatrix = (float**) malloc(matrixOrder * sizeof (float *));
        for (i = 0; i < matrixOrder; i++) {
            tempMatrix[i] = (float*) malloc(matrixOrder * sizeof (float));
        }

        //Construct the required minor for the considered element.
        int l = 0;
        for (i = 0; i < matrixOrder; i++) {

            if (i != j) {
                for (k = 0; k < matrixOrder - 1; k++) {
                    tempMatrix[k][l] = matrix[k + 1][i];
                }
                l++;
            }
        }
        
        //Calculate cofactor*element and add to determinant.
        determinant += (pow(-1, j) * matrix[0][j] * calculateDeterminant(tempMatrix, matrixOrder - 1));
    }
    
    return determinant;
}

/******************************************************************************
 *
 * The main function.
 * 
 ******************************************************************************/
int main(int argc, char** argv) {
    char inputfilename[] = "input";
    FILE *inputfile;
    int matrixOrder = 0, i = 0, j = 0;
    float** matrix;

    inputfile = fopen(inputfilename, "r");

    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    //Read the number of elements.
    fscanf(inputfile, "%f", &matrixOrder);

    //Initialize the values of the pointers to NULL.
    matrix = (float**) malloc(matrixOrder * sizeof (float *));
    for (i = 0; i < matrixOrder; i++) {
        matrix[i] = (float*) malloc(matrixOrder * sizeof (float));
    }

    //Read in the matrix from the input file.
    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            fscanf(inputfile, "%f", &matrix[i][j]);
        }
    }
    
    //Print the read in matrix.
    printf("\nThe matrix is:\n");
    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }

    //Print the output.
    printf("\nThe value of the determinant is %f.\n", calculateDeterminant(matrix, matrixOrder));
    return (EXIT_SUCCESS);
}

