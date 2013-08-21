#! /bin/bash

flag=0
for i in op/*
do
    result=$(diff $i/output mini/${i:3}/output)
    if [[ $result != "" ]]
    then
        echo "Mismatch in outputs. Diff written to "${i:3}".log"
        diff $i/output mini/${i:3}/output > ${i:3}.log
        flag=1
    fi
done

if [[ $flag -eq 0 ]]
then
    echo "All tests passed"
fi
