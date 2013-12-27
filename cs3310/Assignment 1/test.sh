#! /bin/bash

for i in test/*
do
    folder=op/${i:5:-5}
    mkdir -p $folder
    ./P1 < $i > $folder/${i:5}
    javac $folder/${i:5}
    cd $folder
    java ${i:5:-5}> output
    cd ../../
done
