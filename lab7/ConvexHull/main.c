/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 1 October, 2012, 3:14 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/*******************************************************************************
 * 
 * The Convex Hull Problem.
 * 
 ******************************************************************************/

//Structure definition of the item

typedef struct pt {
    int xcoordinate;
    int ycoordinate;
} point;

int count = 0;
point leftMost;

float angle(point a, point b, int convexHullInc) {
    float angle = atan((a.ycoordinate - b.ycoordinate) / (float) (a.xcoordinate - b.xcoordinate));
    // tan value is for angle formed by vector from b to a.
    if (convexHullInc) {
        if (a.xcoordinate == b.xcoordinate && a.ycoordinate > b.ycoordinate) {
            if (angle < 0) {
                angle = -1 * angle;
            }
        } else if (a.xcoordinate == b.xcoordinate && a.ycoordinate < b.ycoordinate) {
            if (angle > 0) {
                angle = -1 * angle;
            }
        }
    } else {
        if (a.xcoordinate == b.xcoordinate && a.ycoordinate > b.ycoordinate) {
            if (angle > 0) {
                angle = -1 * angle;
            }
        } else if (a.xcoordinate == b.xcoordinate && a.ycoordinate < b.ycoordinate) {
            if (angle < 0) {
                angle = -1 * angle;
            }
        }
    }
    return angle;
}

float distance(point a, point b) {
    float distance_sq = (float) pow((b.xcoordinate - a.xcoordinate), 2) + (float) pow((b.ycoordinate - a.ycoordinate), 2);
    return (sqrt(distance_sq));
}

void distanceSort(point collinearArray[100], int k, point seed) {
    if (k == 1) {
        return;
    }

    if (k == 2) {
        if (distance(collinearArray[0], seed) > distance(collinearArray[1], seed)) {
            point *temporary = (point*) malloc(sizeof (point));
            *temporary = collinearArray[0];
            collinearArray[0] = collinearArray[1];
            collinearArray[1] = *temporary;
            free(temporary);
        }
        return;
    }

    distanceSort(collinearArray, k / 2, seed);
    distanceSort(collinearArray + k / 2, k, seed);

    int i = 0, j = k / 2;
    int mergedArrayLength = 0;
    point mergedArray[100];

    while (i < k / 2 && j < k) {
        if (distance(collinearArray[i], seed) < distance(collinearArray[j], seed)) {
            mergedArray[mergedArrayLength] = collinearArray[i];
            i++;
            mergedArrayLength++;
        } else {
            mergedArray[mergedArrayLength] = collinearArray[j];
            j++;
            mergedArrayLength++;
        }
    }
    if (i < k / 2) {
        while (i < k / 2) {
            mergedArray[mergedArrayLength] = collinearArray[i];
            i++;
            mergedArrayLength++;
        }
    } else {
        while (j < k) {
            mergedArray[mergedArrayLength] = collinearArray[j];
            j++;
            mergedArrayLength++;
        }
    }

    j = 0;
    for (i = 0; i < k; i++, j++) {
        collinearArray[i] = mergedArray[j];
    }
}

void addToHull(point collinearArray[100], int k, point hull[100], int *count) {
    int i = 0;
    for (; i < k; i++, (*count)++) {
        hull[*count] = collinearArray[i];
    }
}

void convexHullDecreasing(point points[100], int noOfPoints, point seed, point hull[100]) {
    float s = 0, maxangle;
    point nextpoint;
    int i = 0, flag = 0, flag2 = 0;

    for (i = 0; i < noOfPoints; i++) {
        if ((!isnan(angle(points[i], seed, 0))) && (points[i].xcoordinate < seed.xcoordinate)) {
            maxangle = angle(points[i], seed, 0);
            nextpoint = points[i];
            flag2 = 1;
            break;
        }
    }

    for (i = 0; i < noOfPoints; i++) {
        if (points[i].xcoordinate <= seed.xcoordinate) {
            if (!isnan(angle(points[i], seed, 0))) {
                s = angle(points[i], seed, 0);
                if (s > maxangle) {
                    flag = 1;
                    maxangle = s;
                    nextpoint = points[i];
                } else if (s == maxangle) {
                    if (nextpoint.xcoordinate < seed.xcoordinate) {
                        if (distance(points[i], seed) < distance(nextpoint, seed)) {
                            flag = 1;
                            nextpoint = points[i];
                        } else if (distance(points[i], seed) == distance(nextpoint, seed)) {
                            flag = 1;
                        }
                    } else if (nextpoint.xcoordinate == seed.xcoordinate) {
                        if (nextpoint.ycoordinate < seed.ycoordinate) {
                            if (distance(points[i], seed) < distance(nextpoint, seed)) {
                                flag = 1;
                                nextpoint = points[i];
                            }
                        } else {
                            flag = 1;
                            nextpoint = points[i];
                        }
                    } else {
                        flag = 1;
                        nextpoint = points[i];
                    }
                }
            }
        }
    }


    if ((flag == 1) && (flag2 == 1)) {
        if ((nextpoint.xcoordinate != hull[0].xcoordinate) || (nextpoint.ycoordinate != hull[0].ycoordinate)) {
            hull[count] = nextpoint;
            count++;
            convexHullDecreasing(points, noOfPoints, nextpoint, hull);
        } else {
            return;
        }
    } else {
        return;
    }


}

void convexHullIncreasing(point points[100], int noOfPoints, point seed, point hull[100]) {
    float s = 0, maxangle;
    point nextpoint;
    int i = 0, flag = 0, flag2 = 0;

    for (i = 0; i < noOfPoints; i++) {
        if ((!isnan(angle(points[i], seed, 1))) && (points[i].xcoordinate > seed.xcoordinate)) {
            maxangle = angle(points[i], seed, 1);
            nextpoint = points[i];
            flag2 = 1;
            break;
        }
    }
    for (i = 0; i < noOfPoints; i++) {
        if (points[i].xcoordinate >= seed.xcoordinate) {
            if (!isnan(angle(points[i], seed, 1))) {
                s = angle(points[i], seed, 1);
                if (s > maxangle) {
                    flag = 1;
                    maxangle = s;
                    nextpoint = points[i];
                } else if (s == maxangle) {
                    if (nextpoint.xcoordinate > seed.xcoordinate) {
                        if (distance(points[i], seed) < distance(nextpoint, seed)) {
                            flag = 1;
                            nextpoint = points[i];
                        } else if (distance(points[i], seed) == distance(nextpoint, seed)) {
                            flag = 1;
                        }
                    } else if (nextpoint.xcoordinate == seed.xcoordinate) {
                        if (nextpoint.ycoordinate > seed.ycoordinate) {
                            if (distance(points[i], seed) < distance(nextpoint, seed)) {
                                flag = 1;
                                nextpoint = points[i];
                            }
                        } else {
                            flag = 1;
                            nextpoint = points[i];
                        }
                    } else {
                        flag = 1;
                        nextpoint = points[i];
                    }
                }
            }
        }
    }
    if ((flag == 1) && (flag2 == 1)) {
        hull[count] = nextpoint;
        count++;
        convexHullIncreasing(points, noOfPoints, nextpoint, hull);
    } else {
        convexHullDecreasing(points, noOfPoints, seed, hull);

    }
}

point leftMostPoint(point points[100], int noOfPoints) {
    int i = 0;
    point leftMost = points[0];
    for (i = 0; i < noOfPoints; i++) {
        if (points[i].xcoordinate < leftMost.xcoordinate) {
            leftMost = points[i];
        } else if (points[i].xcoordinate == leftMost.xcoordinate) {
            if (points[i].ycoordinate < leftMost.ycoordinate) {
                leftMost = points[i];
            }
        }
    }
    return leftMost;
}

void printResult(point hull[100], int count) {
    int i;
    for (i = 0; i < count - 1; i++) {
        printf("%d %d ", hull[i].xcoordinate, hull[i].ycoordinate);
    }
    printf("%d %d\n", hull[i].xcoordinate, hull[i].ycoordinate);
}

/*******************************************************************************
 *
 * Function to read in input from a file.
 * 
 ******************************************************************************/
void readFromFile(char* file, point points[100], int *noOfPoints) {
    FILE *inputfile;
    int i = 0, j = 0;
    char startCase[100];
    point hull[100];

    inputfile = fopen(file, "r");

    //check for file opening error.
    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    fscanf(inputfile, "%s", startCase);

    while (strcmp(startCase, "NewCase") == 0) {
        fscanf(inputfile, "%s", startCase);
        while (strcmp(startCase, "NewCase")) {
            if (strcmp(startCase, "TheEnd")) {
                points[*noOfPoints].xcoordinate = atoi(startCase);

                fscanf(inputfile, "%s", startCase);
                points[*noOfPoints].ycoordinate = atoi(startCase);

                (*noOfPoints)++;
                fscanf(inputfile, "%s", startCase);
            } else {
                break;
            }
        }
        hull[0] = leftMostPoint(points, *noOfPoints);
        ++count;
        convexHullIncreasing(points, *noOfPoints, hull[0], hull);
        printResult(hull, count);
        *noOfPoints = 0;
        count = 0;
    }

    fclose(inputfile);
}

int main(int argc, char** argv) {
    if (argc <= 1) {
        printf("\n Please provide a filename as a command line argument.\n");
        exit(-1);
    }

    point points[100], hull [100];
    int noOfPoints = 0, i = 0;

    readFromFile(argv[1], points, &noOfPoints);

    return (EXIT_SUCCESS);
}

