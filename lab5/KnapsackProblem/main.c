/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 17 September, 2012, 2:30 PM
 */

#include <stdio.h>
#include <stdlib.h>

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

/*******************************************************************************
 *
 * This function is recursively called to enumerate all possible n-bit strings.
 * for each n-bit string we if the weight is lesser than the maximum weight,
 * and if it is, we calculate the value. The maximum value gets updated if the
 * new value is greater than the already stored maximum value.
 *
 ******************************************************************************/
void enumItemSubset(int position, int* binaryString, int noOfItems, item items[50],
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
    item items[MAXITEMS];

    //if a file has been specified.
    if (argc > 1) {
        readFromFile(argv[1], &maximumWeight, &noOfItems, items);
    }
        //no file specified.
    else {
        readFromConsole(&maximumWeight, &noOfItems, items);
    }

    //call the recursive function to enumerate all possibilities.
    enumItemSubset(0, binaryString, noOfItems, items, maximumWeight, &maximumValue, optimalList);

    //Print the output.
    printf("%d", maximumValue);
    for (i = 0; i < noOfItems; i++) {
        if (optimalList[i]) {
            printf(" %s", items[i].name);
        }
    }

    return (EXIT_SUCCESS);
}

