%option noyywrap
%{
    #include<stdio.h>
    #define TOKEN_CURP 1
%}

%%
[A-Z]{4}[0-9]{6}[HM][A-Z]{2}[B-DF-HJ-NP-TV-Z]{3}[0-9A-Z][0-9] { return TOKEN_CURP; }
%%

int main(){
    int token;
    while(1) {
        token = yylex();
        if ( token == TOKEN_CURP )
            printf("CURP reconocido: %s\n", yytext);
        if( token == 0)
            break;
    }
    return 0;
}
