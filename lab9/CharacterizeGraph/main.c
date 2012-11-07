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
 * Characterizing a Graph.
 * 
 ******************************************************************************/

/*******************************************************************************
 * 
 * Function to ensure that a graph is undirected.
 * 
 ******************************************************************************/
void symmetric(int **graph, int number_of_vertices) {
    int i, j;

    for (i = 0; i < number_of_vertices; i++) {
        for (j = 0; j < number_of_vertices; j++) {
            if (graph[i][j] != graph[j][i]) {
                graph[i][j] = 1;
                graph[j][i] = 1;
            }
        }
        if (j < number_of_vertices) {
            break;
        }
    }
}

/*******************************************************************************
 * 
 * Function that implements Depth First Search to assign parities.
 * 
 ******************************************************************************/
void depthFirstSearch(int* vertex_traversed, int previous_vertex, int vertex_number, int node_parity, int* cycles, int **graph, int number_of_vertices) {
    int i, j, k;
    vertex_traversed[vertex_number] = node_parity; //set the vertex as traversed, by setting its parity.
    for (i = 0; i < number_of_vertices; i++) {
        if ((graph[vertex_number][i]) && (i != vertex_number) && (i != previous_vertex)) { //if an adjacent vertex
            if (!vertex_traversed[i]) {
                //run DFS with the untraversed adjacent vertex as the root.
                depthFirstSearch(vertex_traversed, vertex_number, i, -1 * node_parity, cycles, graph, number_of_vertices);
            } else {
                if (vertex_traversed[vertex_number] == vertex_traversed[i]) { //if the adjacent vertices have the same parity, then an odd cycle is formed.
                    cycles[1]++;
                } else {
                    cycles[0]++; //else an odd cycle is formed.
                }
            }
        }
    }
}

/*******************************************************************************
 * 
 * Function that checks the connectivity of the graph.
 * 
 * Output:
 * Connected: 1
 * Else: 0
 *  
 ******************************************************************************/
int connectedGraph(int* vertex_traversed, int **graph, int number_of_vertices) {
    int i;
    for (i = 0; i < number_of_vertices; i++) {
        if (!vertex_traversed[i]) {
            return 0;
        }
    }
    return 1;
}

/*******************************************************************************
 * 
 * Function that checks for cycles in a graph.
 * 
 * Output:
 * Acyclic: 0
 * If atleast one odd Cycle exists: -1
 * Else: 1
 * 
 ******************************************************************************/
int cyclicGraph(int* cycles) {
    if (!(cycles[0] + cycles[1])) {
        return 0;
    }
    if (cycles[1]) {
        return -1;
    } else {
        return 1;
    }
}

/*******************************************************************************
 * 
 * Function that analyzes the graph to check for connectivity and cycles.
 * 
 ******************************************************************************/
void analyzeGraph(int* vertex_traversed, int **graph, int number_of_vertices, int* is_connected, int* is_cyclic) {
    int i;
    int* cycles;
    cycles = (int*) malloc(2 * sizeof (int));

    //initialize the values to zero.
    for (i = 0; i < 2; i++) {
        cycles[i] = 0;
    }
    //2nd argument of depthFirstSearch() must be -1, 3rd zero, and the 4th can be any non-zero integer, within integer range.
    depthFirstSearch(vertex_traversed, -1, 0, 1, cycles, graph, number_of_vertices);
    *is_connected = connectedGraph(vertex_traversed, graph, number_of_vertices);
    *is_cyclic = cyclicGraph(cycles);

    free(cycles);
}

/*******************************************************************************
 * 
 * Function to free up initialized memory.
 * 
 ******************************************************************************/
void freeMemory(int **graph, int number_of_vertices, int* vertex_traversed) {
    int i;
    for (i = 0; i < number_of_vertices; i++) {
        free(graph[i]);
    }
    free(graph);
    free(vertex_traversed);
}

/*******************************************************************************
 * 
 * Print the graph that is passed as an argument.
 * 
 ******************************************************************************/
void printMatrix(int **graph, int number_of_vertices) {
    int i, j;
    printf("The read in adjacency matrix is:\n");
    for (i = 0; i < number_of_vertices; i++) {
        for (j = 0; j < number_of_vertices; j++) {
            printf("%d ", graph[i][j]);
        }
        printf("\n");
    }
}

/*******************************************************************************
 * 
 * Print the graph characteristics.
 * 
 ******************************************************************************/
void printResult(int is_connected, int is_cyclic) {
    printf("\nThe graph is:\n");
    if (is_connected) {
        printf("1. connected.\n");
    } else {
        printf("1. disconnected.\n");
    }
    if (is_cyclic) {
        printf("2. cyclic.\n");
    } else {
        printf("2. acyclic.\n");
    }
    if ((is_connected) && (!is_cyclic)) {
        printf("3. a tree.\n");
    } else {
        printf("3. not a tree\n");
    }
    if (is_cyclic == -1) {
        printf("4. not bipartite.\n");
    } else {
        printf("4. bipartite.\n");
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
    int number_of_vertices = 0, is_connected = 0, is_cyclic = 0;
    int i = 0, j = 0;
    int** graph;
    int* vertex_traversed;

    inputfile = fopen(argv[1], "r");

    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    //Read in the number of vertices.
    fscanf(inputfile, "%d", &number_of_vertices);

    //Initialize the values of the pointers to NULL.
    graph = (int**) malloc(number_of_vertices * sizeof (int *));
    for (i = 0; i < number_of_vertices; i++) {
        graph[i] = (int*) malloc(number_of_vertices * sizeof (int));
    }
    vertex_traversed = (int*) malloc(number_of_vertices * sizeof (int));

    //Read in the graph from the input file.
    for (i = 0; i < number_of_vertices; i++) {
        for (j = 0; j < number_of_vertices; j++) {
            fscanf(inputfile, "%d", &(graph[i][j]));
        }
        vertex_traversed[i] = 0;
    }

    //Close the opened file.
    fclose(inputfile);

    //Ensure the graph is undirected.
    symmetric(graph, number_of_vertices);

    //Print the read in graph.
    printMatrix(graph, number_of_vertices);

    //Analyze the graph to check for connectivity and cycles.
    analyzeGraph(vertex_traversed, graph, number_of_vertices, &is_connected, &is_cyclic);

    //Print the results.
    printResult(is_connected, is_cyclic);

    //Free up the initialized memory.
    freeMemory(graph, number_of_vertices, vertex_traversed);

    return (EXIT_SUCCESS);
}