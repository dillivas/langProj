%{
#include "zoomjoystrong.tab.h"
#include <stdio.h>
#include <stdlib.h>
int num_lines = 1;
%}
%%
[0-9]+\.[0-9]+	{yylval.fval = atof(yytext);return FLOAT;}
[0-9]+		{yylval.ival = atoi(yytext);return INT;}
set_color	{return SET_COLOR;}
rectangle	{return RECTANGLE;}
circle		{return CIRCLE;}
line		{return LINE;}
point		{return POINT;}
;		{return END_STATEMENT;}
end		{return END;}
\n		++num_lines;
[ |\t|\n]	;

.	{printf("INCORRECT INPUT AT LINE %d\n", num_lines);}
	
%%

