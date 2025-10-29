%option noyywrap
%{
#include <stdio.h>

int lineas = 1;
int palabras = 0;
int caracteres = 0;

/* Lugares */
int westeros = 0;
int invernalia = 0;
int desembarco = 0;
int nido = 0;
int altojardin = 0;
int aguasdulces = 0;
int rocadragon = 0;
int roca_casterly = 0;
int bastion = 0;
int dorne = 0;

/* Casas */
int stark = 0;
int arryn = 0;
int tully = 0;
int greyjoy = 0;
int lannister = 0;
int tyrell = 0;
int martell = 0;
int baratheon = 0;
int targaryen = 0;

/* Personajes */
int eddard = 0;
int catelyn = 0;
int arya = 0;
int sansa = 0;

int robert = 0;
int joffrey = 0;
int stannis = 0;

int aegon = 0;
int daenerys = 0;
int aerys = 0;

int tywin = 0;
int jaime = 0;
int tyrion = 0;
int cersei = 0;

void imprimirResultado();
%}

%%


[Ww]esteros                 { westeros++; palabras++; caracteres += yyleng; }
[Ii]nvernalia               { invernalia++; palabras++; caracteres += yyleng; }
[Dd]esembarco[ \t]+[Dd]el[ \t]+[Rr]ey    { desembarco++; palabras++; caracteres += yyleng; }
[Nn]ido[ \t]+[Dd]e[ \t]+[a-zA-Z\xC3\x81\xC3\xA1]guilas       { nido++; palabras++; caracteres += yyleng; }
[Aa]ltojard+[a-zA-Z\xC3\xAD]+n               { altojardin++; palabras++; caracteres += yyleng; }
[Aa]guasdulces              { aguasdulces++; palabras++; caracteres += yyleng; }
[Rr]ocadrag+[a-zA-Z\xC3\xB3]+n               { rocadragon++; palabras++; caracteres += yyleng; }
[Rr]oca[ \t]+[Cc]asterly    { roca_casterly++; palabras++; caracteres += yyleng; }
[Bb]asti+[a-zA-Z\xC3\xB3]+n[ \t]+[Dd]e[ \t]+[Tt]ormentas { bastion++; palabras++; caracteres += yyleng; }
[Dd]orne                    { dorne++; palabras++; caracteres += yyleng; }
[Ss]tark        { stark++; palabras++; caracteres += yyleng; }
[Aa]rryn        { arryn++; palabras++; caracteres += yyleng; }
[Tt]ully        { tully++; palabras++; caracteres += yyleng; }
[Gg]reyjoy      { greyjoy++; palabras++; caracteres += yyleng; }
[Ll]annister    { lannister++; palabras++; caracteres += yyleng; }
[Tt]yrell       { tyrell++; palabras++; caracteres += yyleng; }
[Mm]artell      { martell++; palabras++; caracteres += yyleng; }
[Bb]aratheon     { baratheon++; palabras++; caracteres += yyleng; }
[Tt]argaryen    { targaryen++; palabras++; caracteres += yyleng; }
[Ee]ddard       { eddard++; palabras++; caracteres += yyleng; }
[Cc]atelyn      { catelyn++; palabras++; caracteres += yyleng; }
[Aa]rya         { arya++; palabras++; caracteres += yyleng; }
[Ss]ansa        { sansa++; palabras++; caracteres += yyleng; }
[Rr]obert       { robert++; palabras++; caracteres += yyleng; }
[Jj]offrey      { joffrey++; palabras++; caracteres += yyleng; }
[Ss]tannis      { stannis++; palabras++; caracteres += yyleng; }
[Aa]egon        { aegon++; palabras++; caracteres += yyleng; }
[Dd]aenerys     { daenerys++; palabras++; caracteres += yyleng; }
[Aa]erys        { aerys++; palabras++; caracteres += yyleng; }
[Tt]ywin        { tywin++; palabras++; caracteres += yyleng; }
[Jj]aime        { jaime++; palabras++; caracteres += yyleng; }
[Tt]yrion       { tyrion++; palabras++; caracteres += yyleng; }
[Cc]ersei       { cersei++; palabras++; caracteres += yyleng; }
[a-zA-Z]+       { palabras++; caracteres += yyleng; }
.               { caracteres++; }

%%

void imprimirResultado() {
    printf("\nLugares\n");
    printf("Westeros: %d\n", westeros);
    printf("Invernalia: %d\n", invernalia);
    printf("Desembarco del Rey: %d\n", desembarco);
    printf("Nido de Aguilas: %d\n", nido);
    printf("Altojardin: %d\n", altojardin);
    printf("Aguasdulces: %d\n", aguasdulces);
    printf("Rocadragon: %d\n", rocadragon);
    printf("Roca Casterly: %d\n", roca_casterly);
    printf("Bastion de Tormentas: %d\n", bastion);
    printf("Dorne: %d\n", dorne);

    printf("\nCasas\n");
    printf("Stark: %d\n", stark);
    printf("Arryn: %d\n", arryn);
    printf("Tully: %d\n", tully);
    printf("Greyjoy: %d\n", greyjoy);
    printf("Lannister: %d\n", lannister);
    printf("Tyrell: %d\n", tyrell);
    printf("Martell: %d\n", martell);
    printf("Baratheon: %d\n", baratheon);
    printf("Targaryen: %d\n", targaryen);

    printf("\nPersonajes\n");
    printf("Eddard: %d\n", eddard);
    printf("Catelyn: %d\n", catelyn);
    printf("Arya: %d\n", arya);
    printf("Sansa: %d\n", sansa);
    printf("Robert: %d\n", robert);
    printf("Joffrey: %d\n", joffrey);
    printf("Stannis: %d\n", stannis);
    printf("Aegon: %d\n", aegon);
    printf("Daenerys: %d\n", daenerys);
    printf("Aerys: %d\n", aerys);
    printf("Tywin: %d\n", tywin);
    printf("Jaime: %d\n", jaime);
    printf("Tyrion: %d\n", tyrion);
    printf("Cersei: %d\n", cersei);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s <juegodetronos.txt>\n", argv[0]);
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        printf("Error: No se pudo abrir el archivo '%s'\n", argv[1]);
        return 1;
    }

    yyin = archivo;
    yylex();
    fclose(archivo);

    imprimirResultado();

    return 0;
}
