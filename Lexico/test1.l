%option noyywrap
%{
    #include<stdio.h>
    #define TOKEN_ENTERO 1
%}

DIGITO [0-9]
ENTERO {DIGITO}+

%%
{ENTERO} { return TOKEN_ENTERO; }

%%

int main(){
    int token;

    while(1) {
        token = yylex();
        if ( token == TOKEN_ENTERO )
            printf("Numero entero reconocido: %s\n", yytext);
        if( token == 0)
            break;
    }
    return 0;
}
