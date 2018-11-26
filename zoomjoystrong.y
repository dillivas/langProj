%{
	#include <stdio.h>
	#include "zoomjoystrong.h"
	float total = 0;
	int yyerror(const char* err);
%}

%union {
	int ival;
	float fval;
}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token <ival> INT
%token <fval>FLOAT

%%
program:	list_of_expr END END_STATEMENT
       	;

list_of_expr:	expr
	    |	expr list_of_expr
	;

expr:	LINE INT INT INT INT END_STATEMENT {line($2, $3, $4, $5);}
    |   POINT INT INT END_STATEMENT {point($2, $3);}
    |	CIRCLE INT INT INT END_STATEMENT {circle($2, $3, $4);}
    |	RECTANGLE INT INT INT INT END_STATEMENT {rectangle($2, $3, $4, $5);}
    |	SET_COLOR INT INT INT END_STATEMENT {set_color($2, $3, $4);}
;
%%

int main(int argc, char ** argv){
	setup();
	yyparse();
	finish();
}
int yyerror(const char* err){
	printf("%s\n", err);
}
