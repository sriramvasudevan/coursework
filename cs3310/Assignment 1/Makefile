all: 
	bison -d P1.y
	flex P1.l
	gcc -o P1 P1.tab.c lex.yy.c LinkedList.c LinkedDef.c -lfl

clean:
	rm -rf *~ *.output op/ mini/*/*.class mini/*/output mini/*/*~ *.log

test: all
	./test.sh
	./comp.sh
	./diff.sh
