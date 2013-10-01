#!/bin/bash

DIR='extract/'
PGI='../../../pgi.jar'
PARSER='../../../microIR_parser.jar'
TESTS='../../../miniIR/'
OP='../../../microIR/'
SUCCESS='../../../ideal.txt'

cd $DIR
tar -xf *.tar.gz

for i in *
do
    if [[ -d $i ]]
    then
        cd $i/P4/
        javac P4.java

        echo "Generating out files from miniIR..."

        for file in $TESTS/*.miniIR
        do                                                      
            TOTAL=$((TOTAL+1))
            T=`basename $file | sed s/.miniIR//`                
            java -jar $PGI < $file > $TESTS/$T.out
        done  

        echo 'Generating microIR, parsing output, generating out files and comparing...'

        TOTAL=0
        MARKS=0                                                
        for file in $TESTS/*.miniIR
        do                                                      
            FLAG=0
            TOTAL=$((TOTAL+1))
            T=`basename $file | sed s/.miniIR//`                
            java P4 < $file > $OP/$T.microIR
            java -jar $PARSER < $OP/$T.microIR > parse.out
            DIFF=`diff -B -w -i parse.out $SUCCESS`
            if [ $DIFF -eq 0 ]
            then
                echo $T parse successful
            else
                echo $T parse failed
                continue
            fi
            java -jar $PGI < $OP/$T.microIR > $OP/$T.out
            diff $TESTS/$T.out $OP/$T.out > /dev/null
            if [ $? -eq 0 ]; then                         
                echo $T passed                           
                MARKS=$((MARKS+1))
            else                                        
                echo $T failed                         
            fi 
        done  

        echo '$i Grade: $MARKS/$TOTAL'

        rm parse.out
        rm $TESTS/*.out
        rm $OP/*.out
        cd ../../
        rm -r $i

        if [[ $j -eq $f ]]
        then
            echo 'Full marks. Ready to submit!'
        else
            echo 'Need to perform more checks before submitting!'
        fi
    fi
done
