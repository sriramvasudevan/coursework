/* 
 * File:   main.c
 * Author: vsriram
 *
 * Created on 14 November, 2012, 2:12 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include<string.h>

/*******************************************************************************
 * 
 * Program to optimize backing up of movies using as few CDs as possible.
 * 
 *******************************************************************************/

//structure film, that holds the details of one film.

typedef struct m {
    int size;
    char name[100];
    int cd;
} film;

/*******************************************************************************
 * 
 * This function sorts using selection sort in descending order of movie size.
 * 
 *******************************************************************************/
void sort(film* movies, int n) {
    int i, j, position;
    film maxsize;
    for (i = 0; i < n - 1; i++) {
        maxsize = movies[i];
        position = i;
        //obtain maximum sized movie
        for (j = i + 1; j < n; j++) {
            if (movies[j].size > maxsize.size) {
                maxsize = movies[j];
                position = j;
            }
        }
        //swap with ith movie.
        film temporary = movies[i];
        movies[i] = maxsize;
        movies[position] = temporary;
    }
}

/*******************************************************************************
 * 
 * Function to copy movie data from one array to another.
 * 
 *******************************************************************************/
void copyList(film* movies, film* moviescopy, int n) {
    int i;
    for (i = 0; i < n; i++) {
        moviescopy[i] = movies[i];
    }
}

/*******************************************************************************
 * 
 * Function to save movie data in the original array from the duplicate array.
 * 
 *******************************************************************************/
void saveList(film* movies, film* moviescopy, int n) {
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            if (!strcmp(movies[i].name, moviescopy[j].name)) {
                movies[i] = moviescopy[j];
                break;
            }
        }
    }
}

/*******************************************************************************
 * 
 * The Next Fit Algorithm
 * 
 *******************************************************************************/
int nextFit(film* movies, int n) {
    int j = 0, i = 0, cd = 700;
    for (i = 0; i < n; i++) {
        if (movies[i].size <= cd) {
            movies[i].cd = j + 1;
            cd -= movies[i].size;
        } else {
            j++;
            cd = 700;
            movies[i].cd = j + 1;
            cd -= movies[i].size;
        }
    }
    return (j + 1);
}

/*******************************************************************************
 * 
 * The First Fit Algorithm
 * 
 *******************************************************************************/
void firstFit(film* movies, int n) {
    int i = 0, j = 0, k = 0, placed = 0;
    int* cd;
    cd = (int*) malloc(n * sizeof (int));
    for (i = 0; i < n; i++) {
        cd[i] = 700;
    }
    for (i = 0; i < n; i++) {
        placed = 0;
        for (k = 0; k < (j + 1); k++) {
            if (movies[i].size <= cd[k]) {
                movies[i].cd = k + 1;
                cd[k] -= movies[i].size;
                placed = 1;
                break;
            }
        }
        if (!placed) {
            j++;
            movies[i].cd = j + 1;
            cd[j] -= movies[i].size;
        }
    }
    free(cd);
}

/*******************************************************************************
 * 
 * The First Fit Decreasing Algorithm
 * 
 *******************************************************************************/
void firstFitDecreasing(film* movies, int n) {
    film* moviescopy;
    moviescopy = (film*) malloc(n * sizeof (film));
    copyList(movies, moviescopy, n);
    sort(moviescopy, n);
    firstFit(moviescopy, n);
    saveList(movies, moviescopy, n);
    free(moviescopy);
}

/*******************************************************************************
 * 
 * The Best Fit Algorithm
 * 
 *******************************************************************************/
void bestFit(film* movie, int n) {
    int i = 0, j = 0, k = 0, slack, id, s;
    int* cd;
    cd = (int*) malloc(n * sizeof (int));
    for (i = 0; i < n; i++) {
        cd[i] = 700;
    }
    for (i = 0; i < n; i++) {
        slack = 701;
        id = -1;
        for (k = 0; k < (j + 1); k++) {
            if (movie[i].size <= cd[k]) {
                s = cd[k] - movie[i].size;
                if (slack > s) {
                    slack = s;
                    id = k;
                }
            }
        }
        if (id == -1) {
            j++;
            movie[i].cd = j + 1;
            cd[j] -= movie[i].size;
        } else {
            movie[i].cd = (id + 1);
            cd[id] -= movie[i].size;
        }
    }
    free(cd);
}

/*******************************************************************************
 * 
 * The Best Fit Decreasing Algorithm
 * 
 *******************************************************************************/
void bestFitDecreasing(film* movies, int n) {
    //create a temporary copy so as to not disturb original order
    film* moviescopy;
    moviescopy = (film*) malloc(n * sizeof (film));
    copyList(movies, moviescopy, n);

    sort(moviescopy, n);
    bestFit(moviescopy, n);
    saveList(movies, moviescopy, n);
    free(moviescopy);
}

/*******************************************************************************
 * 
 * Function to compute factorial of a number.
 * 
 *******************************************************************************/
long factorial(int n) {
    int i = 0;
    long factorialvalue = 1;
    for (i = 2; i <= n; i++) {
        factorialvalue *= i;
    }
    return factorialvalue;
}

/*******************************************************************************
 * 
 * Function to generate a random number from a to b-1 (both inclusive)
 * 
 *******************************************************************************/
int randNumber(int a, int b) {
    srand(time(NULL));
    int r;
    r = rand();
    int randomnumber = (r % (b - a)) + a; //generates random nos from a to b-1 (both inclusive)
    return randomnumber;
}

/*******************************************************************************
 * 
 * Function to randomize the list of movies.
 * 
 *******************************************************************************/
void randomList(film* movie, int n) {
    int i, j;
    for (i = 0; i < n; i++) {
        j = randNumber(i, n);
        film temporary = movie[i];
        movie[i] = movie[j];
        movie[j] = temporary;
    }
}

/*******************************************************************************
 * 
 * The Randomized Bruteforce Algorithm
 * 
 *******************************************************************************/
void randomBruteForce(film* movies, int n) {
    int i, j;
    int best = n, cdnos;
    //create a temporary copy so as to not disturb original order
    film* moviescopy;
    moviescopy = (film*) malloc(n * sizeof (film));
    int val = 10 * factorial(n) * n * n;
    copyList(movies, moviescopy, n); //copy to temporary list
    for (i = 0; i < val; i++) {
        randomList(moviescopy, n); //randomize movie list
        cdnos = nextFit(moviescopy, n);
        if (cdnos < best) {
            best = cdnos;
            saveList(movies, moviescopy, n); //save data to original list.
        }
    }
}

/*******************************************************************************
 * 
 * Function to choose the appropriate algorithm using the 1st argument.
 * 
 *******************************************************************************/
void chooseAlgorithm(char* choice, film* movies, int n) {
    if (!strcmp(choice, "--nf")) {
        int t = nextFit(movies, n);
    } else if (!strcmp(choice, "--ff")) {
        firstFit(movies, n);
    } else if (!strcmp(choice, "--ffd")) {
        firstFitDecreasing(movies, n);
    } else if (!strcmp(choice, "--bf")) {
        bestFit(movies, n);
    } else if (!strcmp(choice, "--bfd")) {
        bestFitDecreasing(movies, n);
    } else if (!strcmp(choice, "--rbf")) {
        randomBruteForce(movies, n);
    } else {
        printf("\nYour first argument isn't valid.\n");
        exit(-1);
    }
}

/*******************************************************************************
 * 
 * Function to print the results in the desired format.
 * 
 *******************************************************************************/
void printResult(char* choice, film* movies, int n) {
    char algo[50];
    //Set Algo Name
    if (!strcmp(choice, "--nf")) {
        strcpy(algo, "Next Fit Algorithm");
    } else if (!strcmp(choice, "--ff")) {
        strcpy(algo, "First Fit Algorithm");
    } else if (!strcmp(choice, "--ffd")) {
        strcpy(algo, "First Fit Decreasing Algorithm");
    } else if (!strcmp(choice, "--bf")) {
        strcpy(algo, "Best Fit Algorithm");
    } else if (!strcmp(choice, "--bfd")) {
        strcpy(algo, "Best Fit Decreasing Algorithm");
    } else if (!strcmp(choice, "--rbf")) {
        strcpy(algo, "Randomized Bruteforce Algorithm");
    }

    int i;
    printf("%s\n", algo);
    for (i = 0; i < n; i++) {
        printf("%s : CD%d\n", movies[i].name, movies[i].cd);
    }
}

/*******************************************************************************
 * 
 * The main function.
 * 
 *******************************************************************************/
int main(int argc, char** argv) {
    //If all arguments aren't provided
    if (argc < 3) {
        printf("\nPlease provide the right number of arguments.\n");
        exit(-1);
    }
    //If 1st argument is in incorrect format
    if (argv[1][0] != '-' || argv[1][1] != '-') {
        printf("\nPlease provide correct arguments.\n");
        exit(-1);
    }

    FILE* inputfile;
    inputfile = fopen(argv[2], "r");
    int movienos, i;

    if (inputfile == NULL) {
        printf("\nThere was an error in opening the file.");
        exit(-1);
    }

    //Read in movie Nos.
    fscanf(inputfile, "%d", &movienos);

    //Allocate memory
    film* movies;
    movies = (film*) malloc(movienos * sizeof (film));

    //Initialize Values
    for (i = 0; i < movienos; i++) {
        fscanf(inputfile, "%s", movies[i].name);
        fscanf(inputfile, "%d", &movies[i].size);
    }

    fclose(inputfile);

    chooseAlgorithm(argv[1], movies, movienos);
    printResult(argv[1], movies, movienos);

    //Deallocate memory
    free(movies);
    return (EXIT_SUCCESS);
}
