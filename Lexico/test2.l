%option noyywrap
%{
    #include<stdio.h>
    #define TOKEN_DECIMAL 1
%}

DIGITO [0-9]
ENTERO {DIGITO}+
DECIMAL {ENTERO}"."{ENTERO}

%%
{DECIMAL} { return TOKEN_DECIMAL; }
%%

int main(){
    int token;
    while(1) {
        token = yylex();
        if ( token == TOKEN_DECIMAL )
            printf("Numero decimal reconocido: %s\n", yytext);
        if( token == 0)
            break;
    }
    return 0;
}
