%option noyywrap
%{
    #include<stdio.h>
    #define TOKEN_RFC 1
%}

%%
[A-Z]{4}[0-9]{6}[A-Z0-9]{3} { return TOKEN_RFC; }
%%

int main(){
    int token;
    while(1) {
        token = yylex();
        if ( token == TOKEN_RFC )
            printf("RFC reconocido: %s\n", yytext);
        if( token == 0)
            break;
    }
    return 0;
}
