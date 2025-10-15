%{
#include <stdio.h>
#include <stdlib.h>

int line_num = 1;
int comment_count = 0;
%}

DIGIT    [0-9]
LETTER   [a-zA-Z_]
IDENT    {LETTER}({LETTER}|{DIGIT})*
INTEGER  {DIGIT}+
FLOAT    {DIGIT}+\.{DIGIT}+

%%

"//".*    { 
    printf("Linea %d: TOKEN_COMENTARIO -> %s\n", line_num, yytext); 
    comment_count++;
}

"/*"([^*]|("*"+[^*/]))*"*"+"/" { 
    printf("Linea %d: TOKEN_COMENTARIO_BLOQUE -> %s\n", line_num, yytext); 
    comment_count++;
}

int|main|return|include|using|namespace|std|cout|cin|endl    { 
    printf("Linea %d: TOKEN_PALABRA_RESERVADA -> %s\n", line_num, yytext); 
}

char|double|float|bool|void|auto    { 
    printf("Linea %d: TOKEN_TIPO_DATO -> %s\n", line_num, yytext); 
}

{IDENT}    { 
    printf("Linea %d: TOKEN_IDENTIFICADOR -> %s\n", line_num, yytext); 
}

{INTEGER}  { printf("Linea %d: TOKEN_CONSTANTE_ENTERA -> %s\n", line_num, yytext); }
{FLOAT}    { printf("Linea %d: TOKEN_CONSTANTE_FLOTANTE -> %s\n", line_num, yytext); }

"+"|"-"|"*"|"/"|"="|"+="|"-="|"*="|"/="    { 
    printf("Linea %d: TOKEN_OPERADOR_ARITMETICO -> %s\n", line_num, yytext); 
}

"<<"|">>"|"<"|">"|"=="|"!="    { 
    printf("Linea %d: TOKEN_OPERADOR_LOGICO -> %s\n", line_num, yytext); 
}

"#"|"<"|">"|"("|")"|"{"|"}"|";"|","|"&"    { 
    printf("Linea %d: TOKEN_SIMBOLO_ESPECIAL -> %s\n", line_num, yytext); 
}

\"(\\.|[^"\\])*\"   { printf("Linea %d: TOKEN_CADENA_TEXTO -> %s\n", line_num, yytext); }

\n         { line_num++; }
[ \t]+     
.          

%%

int main(int argc, char *argv[]) {
    if(argc != 2) {
        printf("Uso: examenP2.exe archivo.txt\n");
        printf("Ejemplo: examenP2.exe codigo.txt\n");
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if(!yyin) {
        printf("Error: No se pudo abrir '%s'\n", argv[1]);
        return 1;
    }
    
    printf("Archivo: %s\n\n", argv[1]);
    
    yylex();
    
    printf("Total de comentarios: %d\n", comment_count);
    printf("Total de lineas: %d\n", line_num);
    
    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}