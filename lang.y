%{
#include <stdio.h>
#include <stdlib.h>

struct vector {
	int *array;
	int size;
	int capacity;
};

void new();
void delete();
void resize();
void print();
void add(int el);
int yylex(void);
int yyerror(char* s);

struct vector v;
%}
%token ID CONST LET INTEGER CHARACTER STRING READ WRITE IF THEN ELSE AND OR NOT IS ISNOT BEGIN_T END FOR WHILE DO
%token PE ME TE DE MDE PP MM LE GE
%token '=' '<' '>' '+' '-' '*' '/' '%'
%token ':' ',' ';' '(' ')' '[' ']'
%start program

%%

assignment_u_op: PP	{add(1);}
	| MM	{add(2);}
	;
assignment_b_op: '='	{add(3);}
	| PE	{add(4);}
	| ME	{add(5);}
	| TE	{add(6);}
	| DE	{add(7);}
	| MDE	{add(8);}
	;
arithmetic_p_op: '*'	{add(9);}
	| '/'	{add(10);}
	| '%'	{add(11);}
	;
arithmetic_s_op: '+' {add(12);}
	| '-' {add(13);}
	;
relational_op: '<'	{add(14);}
	| LE	{add(15);}
	| '>'	{add(16);}
	| GE	{add(17);}
	| IS	{add(18);}
	| ISNOT	{add(19);}
	;
array_element_type: ID {add(20);}
	| CONST {add(21);}
	;
array_or_not: {add(22);}
	| '[' array_element_type ']' {add(23);}
	;
id: ID array_or_not {add(24);}
	;
simple_type: INTEGER {add(25);}
	| CHARACTER {add(26);}
	| STRING {add(27);}
	;
array_initialisation: {add(28);}
	| CONST {add(29);}
	;
complex_type: {add(30);}
	| '[' array_initialisation ']' {add(31);}
	;
type: simple_type complex_type {add(32);}
	;
id_element_list: {add(33);}
	| ',' id_list {add(34);}
	;
id_list: ID id_element_list {add(35);}
	;
simple_declaration: id_list ':' type {add(36);}
	;
compound_declaration_element: {add(37);}
	| ',' compound_declaration {add(38);}
	;
compound_declaration: simple_declaration compound_declaration_element {add(39);}
	;
declaration: LET compound_declaration ';' {add(40);}
	;
factor: id {add(41);}
	| CONST {add(42);}
	| '(' expression ')' {add(43);}
	;
term_element: {add(44);}
	| arithmetic_p_op term {add(45);}
	;
term: factor term_element {add(46);}
	;
expression_element: {add(47);}
	| arithmetic_s_op expression {add(48);}
	;
expression: term expression_element {add(49);}
	;
expression_list_element: {add(50);}
	| ',' expression_list {add(51);}
	;
expression_list: expression expression_list_element {add(52);}
	;
condition_element: relational_op expression {add(53);}
	;
condition: expression condition_element {add(54);}
	;
c_factor: condition {add(55);}
	| NOT '(' condition ')' {add(56);}
	;
c_factor_element: {add(57);}
	| AND c_term {add(58);}
	;
c_term: c_factor c_factor_element {add(59);}
	;
c_expression_element: {add(60);}
	| OR c_expression {add(61);}
	;
c_expression: c_term c_expression_element {add(62);}
	;
assignment_stmt_element: assignment_u_op {add(63);}
	| assignment_b_op expression {add(64);}
	;
assignment_stmt: id assignment_stmt_element ';' {add(65);}
	;
io_stmt: READ '(' id ')' ';' {add(66);}
	| WRITE '(' expression_list ')' ';' {add(67);}
	;
simple_stmt: assignment_stmt {add(68);}
	| io_stmt {add(69);}
	;
compound_stmt: BEGIN_T stmt_list END {add(70);}
	;
statement: simple_stmt {add(71);}
	| structured_statement {add(72);}
	;
stmt_list_element: {add(73);}
	| stmt_list {add(74);}
	;
stmt_list: statement stmt_list_element {add(75);}
	;
structured_statement: compound_stmt {add(76);}
	| if_stmt {add(77);}
	| for_stmt {add(78);}
	| while_stmt {add(79);}
	;
if_stmt_element: {add(80);}
	| ELSE compound_stmt {add(81);}
	;
if_stmt: IF c_expression THEN compound_stmt if_stmt_element {add(82);}
	;
for_stmt: FOR assignment_stmt ',' c_expression ',' assignment_stmt DO compound_stmt {add(83);}
	;
while_stmt: WHILE c_expression DO compound_stmt {add(84);}
	;
line: declaration {add(85);}
	| statement {add(86);}
	;
lines_element: {add(87);}
	| lines {add(88);}
	;
lines: line lines_element {add(89);}
	;
program: lines {add(90);}
	;
%%

void new() {
	v.capacity = 5;
	v.array = (int*) malloc(v.capacity * sizeof(int));
	v.size = 0;
}

void delete() {
	free(v.array);
}

void resize() {
	v.capacity *= 2;
	v.array = (int*) realloc(v.array, v.capacity * sizeof(int));
}

void print() {
	int i;
	for (i = 0; i < v.size; ++i) {
		printf("%d ", v.array[v.size - i - 1]);
	}
	printf("\n");
}

void add(int el) {
	if (v.size == v.capacity) {
		resize();
	}
	v.array[v.size] = el;
	v.size++;
}

yyerror(char *s) {
	printf("%s\n", s);
}

extern FILE *yyin;
int main(int argc, char **argv)
{
	if (argc > 1) {
		yyin = fopen(argv[1], "r");
	} else {
		yyin = stdin;
	}
	if (!yyparse()) {
		printf("The production string is:\n");
		print();
	} 

}
