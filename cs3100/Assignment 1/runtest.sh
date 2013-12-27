#!/bin/bash
# Shell script to run tests and generate error logs

javac Sudoku.java

for ((i=0; i<$1; i++))
do
    python randgrid.py > testfile
    java Sudoku testfile
    ## Output of the java program is no
    ## longer in the initial format that
    ## could be parsed by valid.py
    # flag=$(python valid.py output)
    # if [ $flag -eq '0' ]; then
    #     mkdir log -p
    #     cat testfile>>log/error
    #     echo "">>log/error
    #     cat output>>log/wrongop
    #     echo "">>log/wrongop
    # fi
done

rm testfile
