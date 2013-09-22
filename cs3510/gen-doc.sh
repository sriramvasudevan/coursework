#!/bin/bash

# Custom code to make reports for all labs
cd doc/
for i in */
    do
    ./makepdf.sh $i > /dev/null;
done
cd ..
