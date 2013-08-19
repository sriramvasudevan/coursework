import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 * Program to check if a 9x9 input grid is a valid sudoku grid, and if so print
 * the steps to convert it into a known, correct solution.
 * 
 * @author Sriram V.
 * 
 */
public class Sudoku {

    // Global variables
    // The input grid - grid[a][b][c] => square a, row b, col c
    static int[][][] grid  = new int[9][3][3];
    // Keeps a count of no. of 1-9 in each 3x3 grid.
    static int[][]   count = new int[9][9];

    /**
     * The main function
     * 
     * @param args
     * 
     */
    public static void main(String[] args) {
        loadGrid(args);
        System.out.println("The input Sudoku is:\n");
        printGrid();
        checkGrid();

        System.out
                .println("\nThe Sudoku is valid. Steps to get a grid with only one each of 1-9 in each major cell:");

        // get rid of excesses square (ie., 3x3 grid) by square.
        for (int sq = 0; sq < 9; sq++) {
            for (int i = 0; i < 9; i++) {
                if (count[sq][i] > 1) {
                    removeExcess(i + 1, sq);
                }
            }
        }

        // At the end of this loop, each square will have only one each of 1-9.
        // Permute within each square to get the hardcoded solution.
        System.out.println("\nResult of above steps:\n");
        printGrid();
        System.out
                .println("\nAfter permutations within each 3x3 grid, we get the following grid:\n");
        printSol();
    }

    /**
     * Loads the grid present in the input file passed as an argument into grid[
     * ][ ][ ]
     * 
     * @param args
     *            The input file
     * 
     */
    static void loadGrid(String[] args) {
        try {
            BufferedReader inputfile = new BufferedReader(new FileReader(
                    args[0]));
            String line;
            String[] no_list;
            int temp;

            for (int i = 0; i < 9; i++) {
                // Read file line by line
                if ((line = inputfile.readLine()) == null) {
                    break;
                }
                no_list = line.split(" ");
                for (int j = 0; j < 9; j++) {
                    temp = Integer.parseInt(no_list[j]);
                    if (temp >= 1 && temp <= 9) {
                        // Store read values into appropriate positions in
                        // grid[][][]
                        grid[(i / 3) * 3 + (j / 3)][i % 3][j % 3] = temp;
                    }
                    else {
                        // Invalid sudoku grid
                        System.out
                                .println("\nNumbers must lie within 1 and 9.");
                        System.exit(-1);
                    }
                }
            }
            inputfile.close();
        }
        catch (IOException e) {
            // Handle exceptions
            e.printStackTrace();
        }
    }

    /**
     * Check if the input grid is a valid sudoku grid.
     */
    static void checkGrid() {
        int[] total = new int[9];
        // Initialise count[][] and count total number of each digit from 1-9
        for (int sq = 0; sq < 9; sq++) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    count[sq][grid[sq][i][j] - 1]++;
                    total[grid[sq][i][j] - 1]++;
                }
            }
        }
        for (int i = 0; i < 9; i++) {
            if (total[i] != 9) {
                // Invalid sudoku grid
                System.out
                        .println("\nNot a valid sudoku solution. There must be nine of each of the integers from 1 to 9.");
                System.exit(0);
            }
        }
    }

    /**
     * Find the i,j coordinates of the first occurrence of a given value in a
     * given square.
     * 
     * @param sq
     *            3x3 grid
     * @param val
     *            value
     * @return An array containing sq, i,j coords and the value
     */
    static int[] findPos(int sq, int val) {
        int[] temp = new int[4];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (grid[sq][i][j] == val) {
                    temp[0] = sq;
                    temp[1] = i;
                    temp[2] = j;
                    temp[3] = val;
                    return temp;
                }
            }
        }

        return temp;
    }

    /**
     * The wrapper function to deal with the swapping of 2 cells. Swaps the two
     * directly (to save on computation time), prints valid moves to enable this
     * swap and updates the relevant counters.
     * 
     * @param initial
     *            initial coords
     * @param fin
     *            final coords
     */
    static void swap(int[] initial, int[] fin) {
        // swap routine
        int temp = grid[initial[0]][initial[1]][initial[2]];
        grid[initial[0]][initial[1]][initial[2]] = grid[fin[0]][fin[1]][fin[2]];
        grid[fin[0]][fin[1]][fin[2]] = temp;

        // generate moves
        System.out.println();
        getMoves(initial, fin);
        System.out.println("-----------------");

        // Update counters
        count[initial[0]][initial[3] - 1]--;
        count[initial[0]][fin[3] - 1]++;
        count[fin[0]][initial[3] - 1]++;
        count[fin[0]][fin[3] - 1]--;
    }

    /**
     * Removes excess occurrences of a given value in a given square.
     * 
     * @param val
     *            value
     * @param sq
     *            3x3 square
     */
    static void removeExcess(int val, int sq) {
        // Since all excesses have been removed from previous squares,
        // the corresponding deficits (that existed as a result of the excesses)
        // should have also been removed.
        // Hence, all previous squares are completely satisfied.
        // Thus, we start checks only on later squares.
        for (int sqn = sq + 1; sqn < 9; sqn++) {
            // If sqn is deficient in the val
            if (count[sqn][val - 1] == 0) {
                int j;
                int excess_val = 0;

                // find a suitable value in sqn to swap with (sq,val)
                for (j = 0; j < 9; j++) {
                    // If sqn has an excess
                    if (count[sqn][j] > 1) {
                        // if sq is deficient in this, this value is chosen for
                        // the swap.
                        if (count[sq][j] == 0) {
                            swap(findPos(sq, val), findPos(sqn, j + 1));
                            break;
                        }
                        // else store the value in excess_val
                        else {
                            excess_val = j + 1;
                        }
                    }
                }
                // j==9 if no swap occured
                if (j == 9) {
                    // This second check is needed because
                    // excess_val will be 0 if sqn is fully satisfied.
                    // (no swap would have occured then)
                    if (excess_val > 0) {
                        // sqn has an excess which sq isn't deficient in.
                        swap(findPos(sq, val), findPos(sqn, excess_val));
                        // This swap would have introduced an excess in
                        // excess_val
                        // in square sq ( as sq wasn't deficient in it)
                        // Hence resolve this case of excess in sq
                        removeExcess(excess_val, sq);
                    }
                }

                if (count[sq][val - 1] == 1) {
                    // All excesses of val in sq taken care of
                    return;
                }
            }
        }
    }

    /**
     * Prints grid[ ][ ][ ] in the form of a sudoku grid.
     */
    static void printGrid() {
        for (int i = 0; i < 9; i++) {
            if (i % 3 == 0) {
                System.out.println("-------------------------");
            }
            for (int j = 0; j < 9; j++) {
                if (j % 3 == 0) {
                    System.out.print("| ");
                }
                System.out.print(grid[(i / 3) * 3 + (j / 3)][i % 3][j % 3]
                        + " ");
            }
            System.out.println("|");
        }
        System.out.println("-------------------------");
    }

    /**
     * Function to decide which direction to move in along a row (left/right) or
     * column (up/down)
     * 
     * @param pos
     *            initial position
     * @param dest
     *            destination
     * @return -1, 1 or 0
     */
    static int findDir(int pos, int dest) {
        if (dest - pos == 1 || dest - pos == -2) {
            return 1; // right or down
        }
        else if (dest - pos == -1 || dest - pos == 2) {
            return -1; // left or up
        }
        return 0;
    }

    /**
     * Wrapper function for findDir to pass the necessary parameters, depending
     * on the choice of row or column. Decides the direction in which to move
     * the source cell, to get it closer to the destination cell.
     * 
     * @param pos
     *            initial position
     * @param dest
     *            destitination
     * @param row
     *            row or column
     * @return -1, 1 or 0
     */
    static int findRowDir(int pos, int dest, boolean row) {
        if (row) {
            return findDir(pos % 3, dest % 3);
        }
        return findDir(pos / 3, dest / 3);
    }

    /**
     * Prints the steps to move a cell to the border of the grid in which it is
     * currently, depending on the direction in which the cell is to be moved.
     * 
     * @param coords
     *            coordinates
     * @param dir
     *            direction
     * @param row
     *            row or column
     */
    static void moveToBorder(int[] coords, int dir, boolean row) {
        if (dir == 1) {
            // right or down
            if (row) {
                // right
                if (coords[2] != 2) {
                    // If the cell is not on the required border - 3rd column of
                    // 3x3 grid
                    System.out.println("Swap (" + coords[1] + ", " + coords[2]
                            + ") and (" + coords[1] + ", " + 2 + ") in square "
                            + coords[0] + ".");
                    coords[2] = 2;
                }
            }
            else {
                // down
                if (coords[1] != 2) {
                    // If the cell is not on the required border - 3rd row of
                    // 3x3 grid
                    System.out.println("Swap (" + coords[1] + ", " + coords[2]
                            + ") and (" + 2 + ", " + coords[2] + ") in square "
                            + coords[0] + ".");
                    coords[1] = 2;
                }
            }
        }
        else if (dir == -1) {
            // left or up
            if (row) {
                // left
                if (coords[2] != 0) {
                    // If the cell is not on the required border - 1st column of
                    // 3x3 grid
                    System.out.println("Swap (" + coords[1] + ", " + coords[2]
                            + ") and (" + coords[1] + ", " + 0 + ") in square "
                            + coords[0] + ".");
                    coords[2] = 0;
                }
            }
            else {
                // up
                if (coords[1] != 0) {
                    // If the cell is not on the required border - 1st row of
                    // 3x3 grid
                    System.out.println("Swap (" + coords[1] + ", " + coords[2]
                            + ") and (" + 0 + ", " + coords[2] + ") in square "
                            + coords[0] + ".");
                    coords[1] = 0;
                }
            }
        }
    }

    /**
     * Prints out the steps to shift a row(column) left/right (up/down)
     * depending on the direction specified. Assumes the coords are on the
     * appropriate border.
     * 
     * @param coords
     *            coordinates
     * @param dir
     *            direction
     * @param row
     *            row or column
     */
    static void shiftList(int[] coords, int dir, boolean row) {
        // Output the cyclic row/column shift move
        if (dir != 0) {
            System.out.print("Shift ");
            if (row) {
                // calculate the row on a 1-9 basis for the 9x9 grid
                int rowno = coords[1] + (coords[0] / 3) * 3;
                System.out.print("row " + rowno);
                if (dir == 1) {
                    System.out.print(" right.");
                }
                else {
                    System.out.print(" left.");
                }
            }
            else {
                // calculate the column on a 1-9 basis for the 9x9 grid
                int colno = coords[2] + (coords[0] % 3) * 3;
                System.out.print("column " + colno);
                if (dir == 1) {
                    System.out.print(" down.");
                }
                else {
                    System.out.print(" up.");
                }
            }
            System.out.println();
        }

        // Update the coords appropriately.
        if (dir == 1) {
            if (row) {
                if (coords[0] % 3 == 2) {
                    // To handle the cyclic case - extreme right
                    // to extreme left grid shift.
                    coords[0] = (coords[0] / 3) * 3;
                }
                else {
                    coords[0] += 1;
                }
                coords[2] = 0;
            }
            else {
                if (coords[0] / 3 == 2) {
                    // To handle the cyclic case - bottom
                    // to top grid shift.
                    coords[0] = coords[0] % 3;
                }
                else {
                    coords[0] += 3;
                }
                coords[1] = 0;
            }
        }
        else if (dir == -1) {
            if (row) {
                if (coords[0] % 3 == 0) {
                    // To handle the cyclic case - extreme left
                    // to extreme right grid shift.
                    coords[0] = coords[0] + 2;
                }
                else {
                    coords[0] -= 1;
                }
                coords[2] = 2;
            }
            else {
                if (coords[0] / 3 == 0) {
                    // To handle the cyclic case - top
                    // to bottom grid shift.
                    coords[0] = coords[0] + 6;
                }
                else {
                    coords[0] -= 3;
                }
                coords[1] = 2;
            }
        }

    }

    /**
     * Wrapper function to print the moves to swap init[ ] and fin[ ] cells.
     * 
     * @param init
     *            initial coords
     * @param fin
     *            final coords
     */
    static void getMoves(int[] init, int[] fin) {
        // Arrays to store copies of init and fin
        // to not mess up init and fin's values
        int[] row_coords = new int[4];
        int[] col_coords = new int[4];
        int dir = 0;

        System.out.println("To swap (" + init[0] + ", " + init[1] + ", "
                + init[2] + ") and (" + fin[0] + ", " + fin[1] + ", " + fin[2]
                + "):");

        // initialise direction to move in, horizontally.
        int row_dir = findRowDir(init[0], fin[0], true);
        dir = row_dir;
        // initialise row_coords with initial position of source
        System.arraycopy(init, 0, row_coords, 0, init.length);

        // Move init horizontally, to get it into a 3x3 grid that is
        // in the same column as the grid in which fin is.
        shiftGrid(row_coords, fin, fin[0], dir, true);

        // initialise direction to move in, vertically.
        int col_dir = findRowDir(init[0], fin[0], false);
        dir = col_dir;
        // initialise column_coords with current position of source
        // (stored in row_coords)
        System.arraycopy(row_coords, 0, col_coords, 0, row_coords.length);

        // Move init vertically, to get it into the same 3x3 grid
        // that fin is in.
        shiftGrid(col_coords, fin, fin[0], dir, false);

        // Reverse direction to move in, vertically
        col_dir = -1 * col_dir;
        // Reverse direction to move in, horizontally
        row_dir = -1 * row_dir;

        // Swap init and fin
        if (col_coords[1] != fin[1] || col_coords[2] != fin[2]) {
            System.out.println("Swap (" + col_coords[1] + ", " + col_coords[2]
                    + ") and (" + fin[1] + ", " + fin[2] + ") in square "
                    + fin[0] + ".");
        }
        else {
            // Special case. Happens when fin is on the border, and a shift can
            // move
            // it out of the square. We need to suppress the greedy nature of
            // fin
            // to stick to its position for one shift.
            if (col_dir != 0) {
                // shift vertically into adjacent grid
                shiftList(col_coords, col_dir, false);
                // compute new direction (U/D)
                col_dir = findRowDir(col_coords[0], init[0], false);
            }
            else {
                if (row_dir != 0) {
                    // shift horizontally into the adjacent grid
                    shiftList(row_coords, row_dir, true);
                    // compute new direction (L/R)
                    row_dir = findRowDir(row_coords[0], init[0], true);
                    col_coords = row_coords;
                }
            }

        }

        // Retrace path traversed by init till before the swap

        // Move fin vertically, to get it into a 3x3 grid that is
        // in the same row as the grid in which init is.
        shiftGrid(col_coords, fin, init[0], col_dir, false);

        // Shift fin to the cell in which init was, before starting with
        // the vertical moves.
        if (row_coords[1] != col_coords[1] || row_coords[2] != col_coords[2]) {
            System.out.println("Swap (" + col_coords[1] + ", " + col_coords[2]
                    + ") and (" + row_coords[1] + ", " + row_coords[2]
                    + ") in square " + row_coords[0] + ".");
        }

        // Move fin horizontally, to get it into the same 3x3 grid
        // that init is in.
        shiftGrid(row_coords, fin, init[0], row_dir, true);

        // Swap init and fin
        if (row_coords[1] != init[1] || row_coords[2] != init[2]) {
            System.out.println("Swap (" + row_coords[1] + ", " + row_coords[2]
                    + ") and (" + init[1] + ", " + init[2] + ") in square "
                    + init[0] + ".");
        }
    }

    /**
     * Prints a correct, known sudoku solution that all valid sudoku grids can
     * be converted into.
     */
    static void printSol() {
        // A hardcoded solution into which all valid input grids resolve.
        int[] sol = new int[] { 9, 3, 7, 8, 6, 5, 4, 1, 2, 5, 4, 2, 7, 1, 3, 8,
                6, 9, 1, 8, 6, 9, 2, 4, 5, 3, 7, 3, 7, 9, 5, 4, 8, 6, 2, 1, 2,
                8, 1, 3, 7, 6, 9, 5, 4, 6, 4, 5, 2, 1, 9, 3, 7, 8, 1, 8, 3, 2,
                5, 6, 7, 9, 4, 6, 9, 7, 4, 3, 8, 1, 2, 5, 4, 5, 2, 7, 9, 1, 8,
                6, 3 };

        // load solution into grid[][][]
        for (int sq = 0; sq < 9; sq++) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    grid[sq][i][j] = sol[(sq * 9) + (i * 3) + j];
                }
            }
        }
        printGrid();
    }

    /**
     * Function to shift coords[ ] into a grid in the same row/column as the 3x3
     * grid 'dest'. Direction to shift in is given by dir, row/column by the
     * boolean row.
     * 
     * @param coords
     *            current coords
     * @param fin
     *            final coord
     * @param dest
     *            destination coord
     * @param dir
     *            direction
     * @param row
     *            row or column
     */
    static void shiftGrid(int[] coords, int[] fin, int dest, int dir,
            boolean row) {
        // Book-keeping variables for row/column
        // print statement display purposes
        int disp = 0;
        int a = 2, b = 1;
        int coordval = 0, finval = 0;
        if (row) {
            a = 1;
            b = 2;
        }
        while (dir != 0) {
            // move init to the border of current grid
            moveToBorder(coords, dir, row);

            if (row) {
                coordval = coords[0] / 3;
                finval = fin[0] / 3;
            }
            else {
                coordval = coords[0] % 3;
                finval = fin[0] % 3;
            }

            // In same row/column
            if ((coords[a] == fin[a]) && (coordval == finval)) {
                // In this case, the shiftList will affect fin's position
                if (dir == 1) {
                    // Shift fin left/up, so that the impending right/down
                    // shift will bring it back to its original position
                    int temp = fin[b] - 1;
                    int temp2 = fin[2];
                    if (temp == -1) {
                        // border of 3x3 grid case
                        // no choice but to shift right/down
                        disp = 1;
                    }
                    else {
                        if (row) {
                            temp2 = temp;
                            temp = fin[1];
                        }
                        System.out.println("Swap (" + fin[1] + ", " + fin[2]
                                + ") and (" + temp + ", " + temp2
                                + ") in square " + fin[0] + ".");
                    }
                }
                else if (dir == -1) {
                    // Shift fin right/down, so that the impending left/up
                    // shift will bring it back to its original position
                    int temp = fin[b] + 1;
                    int temp2 = fin[2];
                    if (temp == 3) {
                        // border of 3x3 grid case
                        // no choice but to shift left/up
                        disp = -1;
                    }
                    else {
                        if (row) {
                            temp2 = temp;
                            temp = fin[1];
                        }
                        System.out.println("Swap (" + fin[1] + ", " + fin[2]
                                + ") and (" + temp + ", " + temp2
                                + ") in square " + fin[0] + ".");
                    }
                }
            }

            // shift horizontally/vertically into the adjacent grid
            shiftList(coords, dir, row);

            // if fin's displacement couldn't be prevented
            if (disp != 0) {
                int temp = fin[b] + disp;
                int temp2 = fin[2];
                if (row) {
                    temp2 = temp;
                    temp = fin[1];
                }
                // bring back fin to it's initial position
                System.out.println("Swap (" + temp + ", " + temp2 + ") and ("
                        + fin[1] + ", " + fin[2] + ") in square " + fin[0]
                        + ".");
                disp = 0;
            }

            // compute new direction (L/R or U/D)
            dir = findRowDir(coords[0], dest, row);
        }
    }
}