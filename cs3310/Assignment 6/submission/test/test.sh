#!/bin/bash

DIR='extract/'
KGI='../../../kgi.jar'
TESTS='../../../miniRA/'
OP='../../../MIPS/'

cd $DIR
tar -xf *.tar.gz

for i in *
do
    if [[ -d $i ]]
    then
        cd $i/P6/
        javac P6.java

        echo "Generating out files from miniRA..."

        for file in $TESTS/*.miniRA
        do                                                      
            TOTAL=$((TOTAL+1))
            T=`basename $file | sed s/.miniRA//`
            java -jar $KGI < $file > $TESTS/$T.out
        done  

        echo 'Generating MIPS, generating out files and comparing...'

        sudo cp ../../../spim .
        sudo cp ../../../usr/ . -r
        TOTAL=0
        MARKS=0                                                
        for file in $TESTS/*.miniRA
        do                                                      
            TOTAL=$((TOTAL+1))
            T=`basename $file | sed s/.miniRA//`                
            java P6 < $file > $OP/$T.s
            sudo ./spim -file $OP/$T.s | tail -n +2 > $OP/$T.out
            diff $TESTS/$T.out $OP/$T.out > /dev/null
            if [ $? -eq 0 ]; then                         
                echo $T passed                           
                MARKS=$((MARKS+1))
            else                                        
                echo $T failed                         
            fi 
        done  

        echo $i Grade: $MARKS/$TOTAL

        # rm $TESTS/*.out
        # rm $OP/*.out
        cd ../../
        sudo rm -r $i

        if [[ $MARKS -eq $TOTAL ]]
        then
            echo 'Full marks. Ready to submit!'
        else
            echo 'Need to perform more checks before submitting!'
        fi
    fi
done
