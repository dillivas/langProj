%{
#include <stdio.h>
int num_lines = 1;
%}
%%
[0-9]+\.[0-9]+	{printf("FLOAT \n");}
[0-9]+		{printf("INT \n");}
(set_color)	{printf("SET_COLOR \n");}
(rectangle)	{printf("RECTANGLE \n");}
(circle)	{printf("CIRCLE \n");}
(line)		{printf("LINE \n");}
(point)		{printf("POINT \n");}
(;)		{printf("END_STATEMENT \n");}
(end)		{printf("END \n");}
\n		++num_lines;
[ |\t|\n]	;

.	{printf("INCORRECT INPUT AT LINE %d\n", num_lines);}
	
%%

int main(int argc, char **argv){
	yylex();
	return 0;
}
