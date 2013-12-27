#! /bin/bash

for i in mini/*
do
    cd $i
    javac ${i:5}.java
    java ${i:5} > output
    cd ../../
done
