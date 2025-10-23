%option noyywrap
%{
#include <stdio.h>

long total_lineas=0;
long total_palabras=0;
long total_caracteres=0;
long con_ni=0;
long con_num=0;
long con_bto=0;
long con_jo=0;
%}

%%
\n { total_lineas++; total_caracteres += yyleng; }
[ \t\r]+ { total_caracteres += yyleng; }
[0-9]+ { total_palabras++; total_caracteres += yyleng; }
[nN][iI][a-zA-Z0-9]* { total_palabras++; total_caracteres += yyleng; con_ni++; }
[nN][uU][mM][a-zA-Z0-9]* { total_palabras++; total_caracteres += yyleng; con_num++; }
[bB][a-zA-Z0-9][tT][oO] { total_palabras++; total_caracteres += yyleng; con_bto++; }
[a-zA-Z0-9][jJ][oO] { total_palabras++; total_caracteres += yyleng; con_jo++; }
[a-zA-Z0-9]+ { total_palabras++; total_caracteres += yyleng; }
. { total_caracteres += yyleng; }
%%

int main(){
yylex();
printf("Total de lineas: %ld\n", total_lineas);
printf("Total de palabras: %ld\n", total_palabras);
printf("Total de caracteres (incluidos espacios y saltos): %ld\n", total_caracteres);
printf("Palabras que inician con ni: %ld\n", con_ni);
printf("Palabras que inician con num: %ld\n", con_num);
printf("Palabras que inician con b y terminan con to: %ld\n", con_bto);
printf("Palabras que terminan con jo: %ld\n", con_jo);
return 0;
}