#!/bin/bash

DIR='extract/'
PGI='../../../pgi.jar'
KGI='../../../kgi.jar'
PARSER='../../../miniRA_parser.jar'
TESTS='../../../microIR/'
OP='../../../miniRA/'
SUCCESS='../../../ideal.txt'

cd $DIR
tar -xf *.tar.gz

for i in *
do
    if [[ -d $i ]]
    then
        cd $i/P5/
        javac P5.java

        echo "Generating out files from microIR..."

        for file in $TESTS/*.microIR
        do                                                      
            TOTAL=$((TOTAL+1))
            T=`basename $file | sed s/.microIR//`                
            java -jar $PGI < $file > $TESTS/$T.out
        done  

        echo 'Generating miniRA, parsing output, generating out files and comparing...'

        TOTAL=0
        MARKS=0                                                
        for file in $TESTS/*.microIR
        do                                                      
            TOTAL=$((TOTAL+2))
            T=`basename $file | sed s/.microIR//`                
            java P5 < $file > $OP/$T.miniRA
            java -jar $PARSER < $OP/$T.miniRA > parse.out
            DIFF=`diff -B -w -i parse.out $SUCCESS`
            if [ "$DIFF" == "" ]
            then
                MARKS=$((MARKS+1))
                echo $T parse successful
            else
                echo $T parse failed
                continue
            fi
            java -jar $KGI < $OP/$T.miniRA > $OP/$T.out
            diff $TESTS/$T.out $OP/$T.out > /dev/null
            if [ $? -eq 0 ]; then                         
                echo $T passed                           
                MARKS=$((MARKS+1))
            else                                        
                echo $T failed                         
            fi 
        done  

        echo $i Grade: $MARKS/$TOTAL

        rm parse.out
        rm $TESTS/*.out
        rm $OP/*.out
        cd ../../
        rm -r $i

        if [[ $MARKS -eq $TOTAL ]]
        then
            echo 'Full marks. Ready to submit!'
        else
            echo 'Need to perform more checks before submitting!'
        fi
    fi
done
