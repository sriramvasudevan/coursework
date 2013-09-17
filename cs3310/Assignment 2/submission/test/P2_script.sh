#!/bin/bash

MARKS=0
DIR='extract/P2/'
cd $DIR

rm -rf *~ *.class base/*.class base/*~ visitor/*.class visitor/*~ syntaxtree/*.class syntaxtree/*~ 
#compile program 
javac P2.java
PUBLIC_TESTCASES=`ls ../../public/`
TOTAL=0
for file in $PUBLIC_TESTCASES;
do 
    TOTAL=$((TOTAL+2))
    echo $file
    java P2 < ../../public/$file > out.txt		
    DIFF=`diff -B -w -i out.txt ../../ideal.txt`
    if [ "$DIFF" == "" ]
    then
        MARKS=$((MARKS+2))
        echo $MARKS
    fi		
done

echo $MARKS

FLAG=0	
echo "Testing private testcase"
PRIVATE_TESTCASES=`ls ../../pass`
for file in $PRIVATE_TESTCASES;
do
    FLAG=0
    TOTAL=$((TOTAL+2))
    echo $file
    java P2 < ../../pass/$file > out.txt		
    DIFF=`diff -B -w -i out.txt ../../ideal.txt`
    if [ "$DIFF" == "" ]
    then
        FLAG=$((FLAG+1))
        #echo $MARKS
    else
        echo ../../pass/$file failed
    fi

    java P2 < ../../fail/$file > out.txt		
    DIFF=`diff -B -w -i out.txt ../../ideal_fail.txt`
    if [ "$DIFF" == "" ]
    then
        FLAG=$((FLAG+1))
        #echo $MARKS
    else
        echo ../../fail/$file failed
    fi

    if [ $FLAG == 2 ]
    then
        MARKS=$((MARKS+2))
        echo $MARKS
    fi
done			

echo Grade: $MARKS/$TOTAL
