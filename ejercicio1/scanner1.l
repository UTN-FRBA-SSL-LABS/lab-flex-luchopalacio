%pointer
%option noyywrap

%%

  /* ── Reglas ya implementadas ────────────────────────── */

  /* Constante octal: 0 seguido de dígitos octales (o solo 0) */
0[0-7]*                     { printf("constante octal: %s\n", yytext); }

  /* Ignorar espacios, tabs y saltos de línea */
[ \t\n]                     { }

  /* Constante decimal (ej: 123, 456, 9) */
[1-9][0-9]*                 { printf("constante decimal: %s\n", yytext); }          

  /* Constante hexadecimal (ej: 0x1A, 0xFF, 0xDEAD)  */
0[xX][0-9a-fA-F]+           { printf("constante hexadecimal: %s\n", yytext); }       

  /* Identificador (ej: miVariable, _count, hola_mundo)  */
[a-zA-Z_][0-9a-zA-Z_]*      { printf("identificador: %s\n", yytext); }           

  /* Comodín: cualquier carácter no reconocido por las reglas anteriores */
.                           { printf("caracter no reconocido: %s\n", yytext); }     

%%

int main(void) {
    yylex();
    return 0;
}
