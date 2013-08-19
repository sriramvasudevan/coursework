from random import random

count = [0,0,0,
         0,0,0,
         0,0,0]
grid = []

for i in range(0,9):
    row = []
    for j in range(0,9):
        val = int(random()*9)+1
        if count[val-1]>=9:
            while(count[val-1]>=9):
                val = int(random()*9)+1
        row.append(val)
        count[val-1] += 1
    grid.append(row)

for row in grid:
    for e in row:
        print e,
    print
