/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 1 October, 2012, 3:14 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*******************************************************************************
 * 
 * The Convex Hull Problem.
 * 
 ******************************************************************************/

//Structure definition of the item

typedef struct pt {
    int xcoordinate;
    int ycoordinate;
    struct pt* next;
} point;

/*
void convexHull() {
    s=slope(a,seed);
    if x(a)>x(seed)
    max(s);
    hull.append(a)
}

jarvis(S)
   pointOnHull = leftmost point in S
   i = 0
   repeat
      P[i] = pointOnHull
      endpoint = S[0]         // initial endpoint for a candidate edge on the hull
      for j from 1 to |S|-1
         if (endpoint == pointOnHull) or (S[j] is on left of line from P[i] to endpoint)
            endpoint = S[j]   // found greater left turn, update endpoint
      i = i+1
      pointOnHull = endpoint
   until endpoint == P[0]      // wrapped around to first hull point
 */

/*******************************************************************************
 *
 * Function to read in input from a file.
 * 
 ******************************************************************************/
void readFromFile(char* file, point* lastPoint) {
    FILE *inputfile;
    int i = 0, j = 0;
    char* startCase;
    point *currentPoint = (point*) malloc(sizeof (point)), *previousPoint = lastPoint;

    inputfile = fopen(file, "r");

    //check for file opening error.
    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    //Read the case.
    fscanf(inputfile, "%s", startCase);
    
    while(strcmp("NewCase", startCase) == 0) {
        fscanf(inputfile, "%d", currentPoint->xcoordinate);
        fscanf(inputfile, "%d", currentPoint->ycoordinate);
        currentPoint->next = previousPoint;
        
    }

    if (strcmp("NewCase", startCase) == 0) {
        for (currentPoint = lastPoint, previousPoint = lastPoint; currentPoint != NULL; currentPoint = currentPoint->next, previousPoint = previousPoint->next) {
            point *currentPoint = (point*) malloc(sizeof (point));
            fscanf(inputfile, "%d", currentPoint->xcoordinate);
            fscanf(inputfile, "%d", currentPoint->ycoordinate);
            currentPoint->next = previousPoint;
            fscanf(inputfile, "%s", startCase);
            if (strcmp("EndCase", startCase) == 0) {
                break;
            }

        }
    }

    fclose(inputfile);
}

int main(int argc, char** argv) {
    if (argc <= 1) {
        printf("\n Please provide a filename as a command line argument.\n");
        exit(-1);
    }
    point *lastPoint = (point*) malloc(sizeof (point));
    readFromFile(argv[1], lastPoint);
    return (EXIT_SUCCESS);
}

