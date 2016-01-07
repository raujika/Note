%{
#define YYSTYPE double
extern int yylex();
void yyerror(char*);
%}

%token NUMBER

%%
lines
		:
    | lines expression '\n'	{ printf(" = %lf\n", $2); }
		;

expression
    : term									{ $$ = $1; }
    | expression '+' term		{ $$ = $1 + $3; }
    | expression '-' term		{ $$ = $1 - $3; }
    ;
    
term
    : factor								{ $$ = $1; }
    | term '*' factor				{ $$ = $1 * $3; }
    | term '/' factor				{ $$ = $1 / $3; }
    ;
    
factor
		: NUMBER								{ $$ = $1; }
    | group									{ $$ = $1; }
    ;
    
group
		: '(' expression ')'		{ $$ = $2; }
    ;
    
%%
void yyerror(char* msg)
{
	printf("error\n") ;
	exit(1) ;
}
int main(int argc, char** argv)
{
  yyparse();
  return 0;
}
