
a.exe: y.tab.c lex.yy.c y.tab.h
	cc lex.yy.c y.tab.c

lex.yy.c: lex.as.l y.tab.h
	flex lex.as.l

y.tab.c: yacc.as.y
	bison -y -d yacc.as.y
  
clean:
	rm a.exe lex.yy.c y.tab.c y.tab.h
  