README
======

1. Java (javac and java) needs to be installed on the system for the program to be compiled (javac) and run (java).

2. To compile the source code:
   
   javac Sudoku.java
   
   may be used.

3. To run the program, use 

   java Sudoku filename
   
   where filename is the path to the input file containing the sudoku grid to be tested.

4. Alternatively, compile_exec.sh may be executed to permform steps 2 and 3. compile_exec.sh takes one parameter, the path to the input file.

   ./compile_exec.sh filename

   where filename is the path to the input file containing the sudoku grid to be tested.

5. The program accepts only one execution parameter, namely the file containing the sudoku grid. A sample file (named sample_input) is provided to understand the format.

6. The Python program randgrid.py may be used to generate valid grids instead. Python needs to be installed on the system to use this. 
   
   python randgrid.py > filename 
   
   writes the generated grid to filename.

7. The output of the program tells us if the input grid can lead to a valid sudoku board (using only the 3 allowed moves), and if so, also elucidates the steps that lead to the final configuration.
   The steps tell us what swaps (the moves required to implement these swaps are also printed) are required.
   (Format - "To swap (source_square, source_row, source column) and (destination_square, destination_row, destination_column)" )
   A grid with only one each of 1-9 in each major square is printed. Then the final, correct sudoku grid is also printed out (Reaching this final configuration requires only permutations within each major square).

8. The runtest.sh script can be used to run multiple tests N number of times. This requires both python and java to be installed, as it makes use of the python randgrid.py script.
   ./runtest.sh N > outputfile
   
   can be entered, where N is the number of test cases and outputfile is the file to which the output is written. 

9. The proof_of_correctness.pdf document provides the Proof of Correctness for the program.
