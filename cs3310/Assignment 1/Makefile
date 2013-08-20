make: 
	bison -d P1.y
	flex P1.l
	gcc -o P1 P1.tab.c lex.yy.c LinkedList.c -lfl
