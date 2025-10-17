%option noyywrap
%{
    #include<stdio.h>
    #define TOKEN_EMAIL 1
%}

%%
[a-zA-Z]{2}[0-9]{6}@uaeh\.edu\.mx { return TOKEN_EMAIL; }
%%

int main(){
    int token;   
    while(1) {
        token = yylex();
        if ( token == TOKEN_EMAIL )
            printf("Email institucional reconocido: %s\n", yytext);
        if( token == 0)
            break;
    }
    return 0;
}
