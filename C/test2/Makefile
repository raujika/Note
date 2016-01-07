all:Name

Name.tab.c Name.tab.h: Name.y
	bison -d Name.y

lex.yy.c: Name.l Name.tab.h
	flex Name.l

Name: lex.yy.c Name.tab.c Name.tab.h
	gcc -o Name Name.tab.c lex.yy.c -lfl

clean:
	rm Name Name.tab.c lex.yy.c Name.tab.h

