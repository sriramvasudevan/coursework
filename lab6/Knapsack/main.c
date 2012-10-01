/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 17 September, 2012, 2:30 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//constants.
#define MAX 150
#define MAXITEMS 50

/*******************************************************************************
 * 
 *  Program to identify the optimalList items to steal, to maximize the total value
 *  of the stolen items.
 * 
 ******************************************************************************/

//Structure definition of the item

typedef struct it {
    char name[MAX];
    int weight;
    int value;
} item;
item mergedArray[MAXITEMS];

/*******************************************************************************
 *
 * The merge sort algorithm.
 * 
 ******************************************************************************/
void mergeSort(item items[MAXITEMS], int begin, int end) {
    int middle = (begin + end) / 2;
    int mergedArrayLength = 0;
    float ratioFirstItem, ratioSecondItem;

    //terminating condition - only one element.
    if (begin == end) {
        return;
    }

    //terminating condition - array of 2 elements.
    if (end == begin + 1) {
        ratioFirstItem = (float) items[begin].value / (float) items[begin].weight;
        ratioSecondItem = (float) items[end].value / (float) items[end].weight;

        //swap the elements if the ratio of the first element is lesser than the ratio of the second.
        if (ratioFirstItem <= ratioSecondItem) {
            item *temporary = (item*) malloc(sizeof (item));
            *temporary = items[begin];
            items[begin] = items[end];
            items[end] = *temporary;
            free(temporary);
        }
    }

    //sort the 2 split arrays.
    mergeSort(items, begin, middle);
    mergeSort(items, middle + 1, end);

    int i = begin, j = middle + 1;

    //merge the 2 sorted arrays into a new array.
    while (i <= middle && j <= end) {
        ratioFirstItem = (float) items[i].value / (float) items[i].weight;
        ratioSecondItem = (float) items[j].value / (float) items[j].weight;

        //copy the element of the first array into the new array.
        if (ratioFirstItem >= ratioSecondItem) {
            mergedArray[mergedArrayLength] = items[i];
            i++;
            mergedArrayLength++;
        } 
        
        //copy the element of the second array into the new array.
        else {
            mergedArray[mergedArrayLength] = items[j];
            j++;
            mergedArrayLength++;
        }
    }
    
    //copy the remaining elements into the new array.
    if (i <= middle) {
        while (i <= middle) {
            mergedArray[mergedArrayLength] = items[i];
            i++;
            mergedArrayLength++;
        }
    } else {
        while (j <= end) {
            mergedArray[mergedArrayLength] = items[j];
            j++;
            mergedArrayLength++;
        }
    }

    j = 0;
    
    //replace the 2 arrays with the fully sorted array.
    for (i = begin; i <= end; i++, j++) {
        items[i] = mergedArray[j];
    }

}

/*******************************************************************************
 *
 * The greedy algorithm function.
 * 
 ******************************************************************************/
void greedyAlgorithm(int noOfItems, int maximumWeight, item items[MAXITEMS], int *maximumValue, int* optimalList) {
    int i = 0;
    *maximumValue = 0;
    for (i = 0; i < noOfItems; i++) {
        if (items[i].weight <= maximumWeight) {
            optimalList[i] = 1;  //save the element by means of a bit string.
            maximumWeight -= items[i].weight;
            *maximumValue += items[i].value;
        } else {
            optimalList[i] = 0;
        }
    }
}

/*******************************************************************************
 *
 * This function is recursively called to enumerate all possible n-bit strings.
 * for each n-bit string we if the weight is lesser than the maximum weight,
 * and if it is, we calculate the value. The maximum value gets updated if the
 * new value is greater than the already stored maximum value.
 *
 ******************************************************************************/
void enumItemSubset(int position, int* binaryString, int noOfItems, item items[MAXITEMS],
        int maximumWeight, int *maximumValue, int* optimalList) {
    int i = 0, weight = 0, value = 0;

    //if n-bit string is generated.
    if (noOfItems == position) {
        for (i = 0; i < noOfItems; i++) {
            weight += items[i].weight * binaryString[i];
        }

        if (weight <= maximumWeight) {
            for (i = 0; i < noOfItems; i++) {
                value += items[i].value * binaryString[i];
            }

            if (value>*maximumValue) {
                *maximumValue = value;
                for (i = 0; i < noOfItems; i++) {
                    optimalList[i] = binaryString[i];
                }
            }
        }

        return;
    }

    //add a 0 to the bit string.
    binaryString[position] = 0;
    enumItemSubset(position + 1, binaryString, noOfItems, items, maximumWeight,
            maximumValue, optimalList);

    //add a 1 to the bit string.
    binaryString[position] = 1;
    enumItemSubset(position + 1, binaryString, noOfItems, items, maximumWeight,
            maximumValue, optimalList);


}

/*******************************************************************************
 *
 * Function to read in input from a file.
 * 
 ******************************************************************************/
void readFromFile(char* file, int *maximumWeight, int *noOfItems, item items[50]) {
    FILE *inputfile;
    int i = 0, j = 0;

    inputfile = fopen(file, "r");
    //check for file opening error.
    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.\n");
        exit(-1);
    }

    //Read the maximum weight.
    fscanf(inputfile, "%d", maximumWeight);

    //Read the number of items.
    fscanf(inputfile, "%d", noOfItems);

    //Read in the item data from the file.
    for (i = 0; i < *noOfItems; i++) {
        fscanf(inputfile, "%s", &items[i].name);
        fscanf(inputfile, "%d", &items[i].weight);
        fscanf(inputfile, "%d", &items[i].value);
    }
    fclose(inputfile);
}

/*******************************************************************************
 *
 * Function to read in input from the console, in case the file is absent.
 * 
 ******************************************************************************/
void readFromConsole(int *maximumWeight, int *noOfItems, item items[50]) {
    int i = 0;
    printf("\nEnter the total weight that the thief can carry:  ");
    scanf("%d", maximumWeight);
    printf("Enter the number of items:  ");
    scanf("%d", noOfItems);
    printf("Enter the items:\n");

    for (i = 0; i < *noOfItems; i++) {
        printf("Item Name: ");
        scanf("%s", &items[i].name);

        printf("Item Weight: ");
        scanf("%d", &items[i].weight);

        printf("Item Value: ");
        scanf("%d", &items[i].value);

        printf("\n");
    }
}

int main(int argc, char** argv) {
    int maximumValue = 0, maximumWeight = 0, noOfItems = 0;
    int binaryString[MAXITEMS], optimalList[MAXITEMS];
    int i = 0;
    int noOfFiles = 0;
    item items[MAXITEMS];

    //if a file has been specified.
    if (argc > 2) {
        char nameOfFile[200];
        char fileNumber[5];
        noOfFiles = atoi(argv[1]);
        for (i = 1; i <= noOfFiles; i++) {
            strcpy(nameOfFile, "");
            strcat(nameOfFile, argv[2]);
            strcat(nameOfFile, "_");
            sprintf(fileNumber, "%d", i);
            strcat(nameOfFile, fileNumber);
            strcat(nameOfFile, ".txt");
            readFromFile(nameOfFile, &maximumWeight, &noOfItems, items);

            maximumValue = 0;
            //call the recursive function to enumerate all possibilities.
            enumItemSubset(0, binaryString, noOfItems, items, maximumWeight, &maximumValue, optimalList);

            //Print the output.
            printf("%d", maximumValue);
            int I = 0;
            for (I = 0; I < noOfItems; I++) {
                if (optimalList[I]) {
                    printf(" %s", items[I].name);
                }
            }

            printf(" : ");

            //Run the greedy algorithm to generate the new bit string.
            maximumValue = 0;
            mergeSort(items, 0, noOfItems - 1);
            greedyAlgorithm(noOfItems, maximumWeight, mergedArray, &maximumValue, optimalList);

            //print the output.
            printf("%d", maximumValue);
            for (I = 0; I < noOfItems; I++) {
                if (optimalList[I]) {
                    printf(" %s", mergedArray[I].name);
                }
            }

            printf("\n");

        }
    }
    
    //no file specified.
    else {
        readFromConsole(&maximumWeight, &noOfItems, items);

        //call the recursive function to enumerate all possibilities.
        enumItemSubset(0, binaryString, noOfItems, items, maximumWeight, &maximumValue, optimalList);

        //Print the output.
        printf("%d", maximumValue);
        for (i = 0; i < noOfItems; i++) {
            if (optimalList[i]) {
                printf(" %s", items[i].name);
            }
        }

        printf(" : ");

        mergeSort(items, 0, noOfItems - 1);
        greedyAlgorithm(noOfItems, maximumWeight, mergedArray, &maximumValue, optimalList);

        printf("%d", maximumValue);
        for (i = 0; i < noOfItems; i++) {
            if (optimalList[i]) {
                printf(" %s", mergedArray[i].name);
            }
        }

        printf("\n");

    }

    return (EXIT_SUCCESS);
}