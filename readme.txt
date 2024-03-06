we have to apply commands as follows
	1 lex final3.l
	2 gcc lex.yy.c
	3 ./a.out v.m 
 here final3.l contanins the code
 
 
 v.m is the sample file which contains code in the language OBJECTIVE C.
 
 
lex.yy.c is the c source file which contsins the implementation of the lexical analyzer according to the rules specified
 
here we are taking a file as input by yyin()
in yyin we are setting input to the file
we are opening the file by fopen
if file ptr is NULL we are giving an error
closing the file using fclose
we are command line arguments to main in which arg[0] is ./a.out and arg[1] is the given file input name.
yylex() is used for scanning input text character by character attempting to match the input aganist the regex.


 
