#!/bin/bash

DIR='extract/'
PGI='../../../pgi.jar'
TESTS='../../../miniJava/'
OP='../../../miniIR/'

cd $DIR
tar -xf *.tar.gz

for i in *
do
    if [[ -d $i ]]
    then
        echo "Generating out files from Java."                                        
        cd ../miniJava/
        for file in *.java
        do
            javac $file;
            T=`basename $file | sed s/.java//`;                         
            java $T > $T.out;                                          
            rm *.class
        done
        cd ../$DIR

        echo "Generating out files from miniIR and comparing with expected output"           

        cd $i/P3/
        javac P3.java

        f=0
        j=0                                                
        for file in $TESTS/*.java                                
        do                                                      
            f=$((f+1))
            T=`basename $file | sed s/.java//`                
            java P3 < $file > $OP/$T.miniIR                   
            java -jar $PGI < $OP/$T.miniIR  > $OP/$T.out
            diff  $OP/$T.out $OP/$T.out  > /dev/null
            if [ $? -eq 0 ]; then                         
                echo $T passed                           
                j=$((j+1))
            else                                        
                echo $T failed                         
            fi 
        done  

        echo "Grade: $j/$f"

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
