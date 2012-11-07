/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 29 October, 2012, 2:09 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */

typedef struct n {
    int degree;
    int index;
    int colour;
} node;

/*******************************************************************************
 *
 * The merge sort algorithm.
 * 
 ******************************************************************************/
void mergeSort(node* vertices, int begin, int end, node* mergedArray) {
    int middle = (begin + end) / 2;
    int mergedArrayLength = 0;
    
    //terminating condition - only one element.
    if (begin == end) {
        return;
    }

    //terminating condition - array of 2 elements.
    if (end == begin + 1) {

        if (vertices[begin].degree <= vertices[end].degree) {
            node *temporary = (node*) malloc(sizeof (node));
            *temporary = vertices[begin];
            vertices[begin] = vertices[end];
            vertices[end] = *temporary;
            free(temporary);
        }
    }

    //sort the 2 split arrays.
    mergeSort(vertices, begin, middle, mergedArray);
    mergeSort(vertices, middle + 1, end, mergedArray);

    int i = begin, j = middle + 1;

    //merge the 2 sorted arrays into a new array.
    while (i <= middle && j <= end) {

        //copy the element of the first array into the new array.
        if (vertices[i].degree >= vertices[j].degree) {
            mergedArray[mergedArrayLength] = vertices[i];
            i++;
            mergedArrayLength++;
        }//copy the element of the second array into the new array.
        else {
            mergedArray[mergedArrayLength] = vertices[j];
            j++;
            mergedArrayLength++;
        }
    }

    //copy the remaining elements into the new array.
    if (i <= middle) {
        while (i <= middle) {
            mergedArray[mergedArrayLength] = vertices[i];
            i++;
            mergedArrayLength++;
        }
    } else {
        while (j <= end) {
            mergedArray[mergedArrayLength] = vertices[j];
            j++;
            mergedArrayLength++;
        }
    }

    j = 0;

    //replace the 2 arrays with the fully sorted array.
    for (i = begin; i <= end; i++, j++) {
        vertices[i] = mergedArray[j];
    }

}

/*******************************************************************************
 * 
 * DFS Algorithm
 * 
 ******************************************************************************/
void DFS(node* vertices, int previous_vertex, int vertex_number, int node_parity, int **graph, int matrixOrder) {
    int i, j, k;
    vertices[vertex_number].colour = node_parity; //set the vertex as traversed, by setting its parity.
    for (i = 0; i < matrixOrder; i++) {
        if ((graph[vertex_number][i]) && (i != vertex_number) && (i != previous_vertex)) { //if an adjacent vertex
            if (!vertices[i].colour) {
                //run DFS with the untraversed adjacent vertex as the root.
                DFS(vertices, vertex_number, i, -1 * node_parity, graph, matrixOrder);
            }
        }
    }
}

/*******************************************************************************
 * 
 * DFS Improved Algorithm
 * 
 ******************************************************************************/
void DFSimproved(node* vertices, int **matrix, int matrixOrder) {
    int i, j, k, partition1 = 0, partition0 = 0, edges = 0, newedges = 0;
    DFS(vertices, -1, 0, 1, matrix, matrixOrder);

    for (i = 0; i < matrixOrder; i++) {
        if (vertices[i].colour == 1) {
            for (j = 0; j < matrixOrder; j++) {
                if ((matrix[i][j]) && (i != j)) {
                    if (vertices[j].colour == 1) {
                        partition1++;
                    } else if (vertices[j].colour == -1) {
                        partition0++;
                    }
                }
            }
            if (partition1 > partition0) {
                for (j = 0; j < matrixOrder; j++) {
                    if ((matrix[i][j]) && (vertices[j].colour == 1) && (i != j)) {
                        newedges = edges;
                        for (k = 0; k < matrixOrder; k++) {
                            if ((matrix[j][k]) && (j != k)) {
                                if (vertices[k].colour == 1) {
                                    newedges++;
                                } else if (vertices[k].colour == -1) {
                                    newedges--;
                                }
                            }
                        }
                        if (newedges > edges) {
                            vertices[j].colour = -1;
                            edges = newedges;
                        }
                    }
                }
            }
            partition1 = 0;
            partition0 = 0;
        }
    }
}

/*******************************************************************************
 * 
 * Greedy-based Algorithm
 * 
 ******************************************************************************/
void greedyPartition(node* vertices, int** matrix, int matrixOrder) {
    int i, j, partition1 = 0, partition2 = 0;
    
    for (i = 0; i < matrixOrder; i++) {
            for (j = 0; j < matrixOrder; j++) {
                if ((matrix[i][j]) && (i != j)) {
                    if (vertices[j].colour == 1) {
                        partition1++;
                    } else if (vertices[j].colour == -1) {
                        partition2++;
                    }
                }
            }
            if (partition1 > partition2) {
                vertices[i].colour = -1;
            } else {
                vertices[i].colour = 1;
            }
            partition1 = 0;
            partition2 = 0;
        }
}

/*******************************************************************************
 * 
 * Function to ensure that the graph is undirected.
 * 
 ******************************************************************************/
void symmetric(int **matrix, int matrixOrder) {
    int i, j;
    for (i = 0; i < matrixOrder; i++) {
        for (j = i + 1; j < matrixOrder; j++) {
            if (matrix[i][j] != matrix[j][i]) {
                matrix[i][j] = matrix[j][i] = 1;
            }
        }
    }
}

/*******************************************************************************
 * 
 * Function to print output.
 * 
 ******************************************************************************/
void printOutput(node* vertices, int** matrix, int matrixOrder, char* string) {
    int i, j;
    long edges = 0;

    //Print nodes
    printf("Nodes in Partition 1 (Printing node numbers):\n");
    for (i = 0; i < matrixOrder; i++) {
        if (vertices[i].colour == 1) {
            printf("%d ", vertices[i].index);
        }
    }

    //Count edges
    for (i = 0; i < matrixOrder; i++) {
        if (vertices[i].colour == 1) {
            for (j = 0; j < matrixOrder; j++) {
                if ((matrix[i][j]) && (i != j)) {
                    if (vertices[j].colour == -1) {
                        edges++;
                    }
                }
            }
        }
    }

    printf("\n\nNumber of bridges using %s: %ld\n\n", string, edges);

    //Initialise to zero
    for (i = 0; i < matrixOrder; i++) {
        vertices[i].colour = 0;
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
    int matrixOrder = 0, i = 0, j = 0, edges = 0;
    int** matrix;
    node* vertices;
    node* mergedArray;

    inputfile = fopen(argv[1], "r");

    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    //Read the number of elements.
    fscanf(inputfile, "%d", &matrixOrder);

    //Initialize the values of the pointers to NULL.
    matrix = (int**) malloc(matrixOrder * sizeof (int *));
    vertices = (node*) malloc(matrixOrder * sizeof (node));
    mergedArray = (node*) malloc(matrixOrder * sizeof (node));

    //Initialise to zero.
    for (i = 0; i < matrixOrder; i++) {
        matrix[i] = (int*) malloc(matrixOrder * sizeof (int));
        vertices[i].degree = 0;
        vertices[i].colour = 0;
    }

    //Read in the matrix from the input file.
    for (i = 0; i < matrixOrder; i++) {
        vertices[i].index = i;
        for (j = 0; j < matrixOrder; j++) {
            fscanf(inputfile, "%d", &matrix[i][j]);
        }
    }

    fclose(inputfile);

    //Ensure graph is undirected.
    symmetric(matrix, matrixOrder);

    //Calculate degrees
    for (i = 0; i < matrixOrder; i++) {
        for (j = 0; j < matrixOrder; j++) {
            if (matrix[i][j]) {
                vertices[i].degree++;
            }
        }
    }

    //DFS Algorithm:
    DFS(vertices, -1, 0, 1, matrix, matrixOrder);
    printOutput(vertices, matrix, matrixOrder, "DFS");

    //DFS Improved Algorithm:
    DFSimproved(vertices, matrix, matrixOrder);
    printOutput(vertices, matrix, matrixOrder, "DFS Improved");

    //Applying Merge Sort for the above Greedy-based Algorithm:
    mergeSort(vertices, 0, matrixOrder, mergedArray);
    greedyPartition(vertices, matrix, matrixOrder);
    printOutput(vertices, matrix, matrixOrder, "Greedy-based Algorithm");

    free(vertices);
    free(matrix);
    return (EXIT_SUCCESS);
}
