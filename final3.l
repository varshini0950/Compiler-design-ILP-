%{
	#include <stdio.h>
%}

%%
"char"                { printf("T_DATATYPE\n"); }
"unsigned char"              { printf("T_DATATYPE\n"); }
"signed char"            {printf("T_DATATYPE\n"); }
"int"              {printf("T_DATATYPE\n"); }
"SampleClass *"              {printf("T_DATATYPE\n"); }
"signed int"            {printf("T_DATATYPE\n"); }
"unsigned int"               { printf("T_DATATYPE\n"); }
"short"          { printf("T_DATATYPE\n"); }
"unsigned short"          { printf("T_DATATYPE\n"); }
"long"             { printf("T_DATATYPE\n"); }
"unsigned long"             { printf("T_DATATYPE\n"); }
"float"           { printf("T_DATATYPE\n"); }
"double"           { printf("T_DATATYPE\n"); }
"long double"                { printf("T_DATATYPE\n"); }
"CGFloat"              { printf("T_DATATYPE\n"); }
"const"            {printf("T_DATATYPE\n"); }
"struct"              {printf("T_DATATYPE\n"); }
"union"            {printf("T_DATATYPE\n"); }
"NSString *"               { printf("T_DATATYPE\n"); }
"NSString"               { printf("T_DATATYPE\n"); }
"object"          { printf("T_DATATYPE\n"); }
"enum"          { printf("T_DATATYPE\n"); }
"NSSet"             { printf("T_DATATYPE\n"); }
"NSDictionary"             { printf("T_DATATYPE\n"); }
"bool"           { printf("T_DATATYPE\n"); }
"NSNumber *"           { printf("T_DATATYPE\n"); }
"NSAutoreleasePool *"             { printf("T_DATATYPE\n"); }
"NSNumber"             { printf("T_DATATYPE\n"); }
"NSArray"           { printf("T_DATATYPE\n"); }
"init"           { printf("T_DATATYPE\n"); }
"void"           { printf("T_DATATYPE\n"); }
"IF"                { printf("T_STATEMENT\n"); }
"else"              { printf("T_STATEMENT\n"); }
"END-IF"            {printf("T_STATEMENT\n"); }
"return"              {printf("T_STATEMENT\n"); }
"case"            {printf("T_STATEMENT\n"); }
"while"               { printf("wT_STATEMENT\n"); }
"for"          { printf("T_STATEMENT\n"); }
"switch"          { printf("T_STATEMENT\n"); }
"break"             { printf("T_STATEMENT\n"); }
"continue"             { printf("T_STATEMENT\n"); }
"do"           { printf("T_STATEMENT\n"); }
"default"           { printf("T_STATEMENT\n"); }
[\']([a-zA-Z]|[1-9])[\'] {printf("T_CharConst:%s\n", yytext);}
 /* [\"]([a-zA-Z]|[1-9]|[\\t]|[" "]|[\\n])+[\"]|[\']([a-zA-Z]|[1-9]|[\\t]|[" "]|[\\n])+[\'] {printf("T_StringConst:%s\n", yytext);} */
\"([^\"\\]|\\.)*\" {printf("T_StringConst:%s\n", yytext);} 
-?[0-9]+[u]|[0-9]+[U] {printf("T_unsignedconst:%s\n",yytext);}
-?[0-9]+[l]|[0-9]+[L] {printf("T_longconst:%s\n",yytext);}
-?[0-9]+[u][l]|[0-9]+[U][L]|[0-9]+[L][U]|[0-9]+[L][U] {printf("T_unsignedlongconst:%s\n",yytext);}
-?[0][0-7]+ {printf("T_octalConst:%s\n",yytext);}
-?[0][x][0-9A-F]+|[0][X][0-9A-F]+ {printf("T_hexadecimalConst:%s\n",yytext);}
-?[0-9]+ {printf("T_IntConst:%s\n",yytext);}
-?[0-9]+\.[0-9]+  {printf("%s\tT_FloatConst \n",yytext);}
"="                         {printf("T_OPERATOR\n"); }
"<"                         {printf("T_OPERATOR\n"); }
">"                         {printf("T_OPERATOR\n"); }
"/"                         {printf("T_OPERATOR\n"); }
"%"                         {printf("T_OPERATOR\n"); }
"\)"                         {printf("T_OPERATOR\n"); }
":"                         {printf("T_OPERATOR\n"); }
"_"                         {printf("T_OPERATOR\n"); }

"?"                         {printf("T_OPERATOR\n"); }
"\,"                         {printf("T_OPERATOR\n"); }
"\("                         {printf("T_OPERATOR\n"); }
"\+\+"                         {printf("T_OPERATOR\n"); }
"--"                         {printf("T_OPERATOR\n"); }
"=="                         {printf("T_OPERATOR\n"); }
"\!="                         {printf("T_OPERATOR\n"); }
"<="                         {printf("T_OPERATOR\n"); }
">="                         {printf("T_OPERATOR\n"); }
"&&"                         {printf("T_OPERATOR\n"); }
"\|\|"                         {printf("T_OPERATOR\n"); }
"!"                         {printf("T_OPERATOR\n"); }
"&"                         {printf("T_OPERATOR\n"); }
"\|"                         {printf("T_OPERATOR\n"); }
"\^"                         {printf("T_OPERATOR\n"); }
"~"                         {printf("T_OPERATOR\n"); }
"-"                         {printf("T_OPERATOR\n"); }
"<<"                         {printf("T_OPERATOR\n"); }
">>"                         {printf("T_OPERATOR\n"); }
"-="                         {printf("T_OPERATOR\n"); }
"\+="                         {printf("T_OPERATOR\n"); }
"\%="                         { printf("T_OPERATOR\n"); }
"<<="                         {printf("T_OPERATOR\n"); }
">>="                         {printf("T_OPERATOR\n"); }
"\^="                         {printf("T_OPERATOR\n"); }
"\|="                         {printf("T_OPERATOR\n"); }
"\["            { printf("T_OPERATOR\n"); }
"\#"            { printf("T_OPERATOR\n"); }
"\]" { printf("T_OPERATOR\n"); }
"\@"            { printf("T_OPERATOR\n"); }
"\""            { printf("T_OPERATOR\n"); }
"\'"            { printf("T_OPERATOR\n"); }
"\{"           { printf("T_OPERATOR\n"); }
"\}"           { printf("T_OPERATOR\n"); }
";"                         { printf("T_OPERATOR\n"); }
"\."                        { printf("T_OPERATOR\n"); }

"//".*                       { printf("T_COMMENT\n"); }
"/*"(.*)"*/" 			{ printf("T_COMMENT\n"); }

[A-Za-z][A-Za-z0-9-]*        { printf("T_IDENTIFIER: %s\n", yytext); }
.|\n ;

%%

int yywrap(void) { return 1; }
int main(int argc, char *argv[]) {
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        fprintf(stderr, "Error opening file.\n");
        return 1;
    }

    yyin = file; // Set input to the file
    yylex();     // Perform lexical analysis
     fclose(file);
    return 0;
}
