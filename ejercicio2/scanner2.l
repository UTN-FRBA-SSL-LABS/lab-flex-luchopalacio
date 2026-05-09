%pointer
%option noyywrap

 /* ── Sección de definiciones ERX ───────────────────────────────────────
   Las definiciones permiten nombrar expresiones regulares para reutilizarlas.
   Formato:   nombre   expresion_regular
   Uso en reglas:  {nombre}
   ─────────────────────────────────────────────────────────────────── */

 /* Definición ya dada como ejemplo: */
digitoHexa      [0-9a-fA-F]

 /* Definir 'digito' como cualquier dígito decimal [0-9]        */
digito          [0-9]

 /* Definir 'letra' como letra mayúscula, minúscula o guión bajo */
letra           [A-Za-z_]

 /* Definir 'identificador' usando {letra} y {digito} */
identificador   {letra}({letra}|{digito})*

%%

 /* ── Reglas usando las definiciones ─────────────────────────────────── */

 /* Regla ya dada como ejemplo: usa {digitoHexa} y muestra yyleng */
0[xX]{digitoHexa}+  { printf("constante hexadecimal de longitud %d: %s\n", yyleng, yytext); }

 /* Regla para constante decimal usando {digito} */
[1-9]{digito}*      {printf("constante decimal de longitud %d: %s\n", yyleng, yytext);}

 /* Regla para identificador usando {identificador}       */
{identificador}     {printf("identificador de longitud %d: %s\n", yyleng, yytext); }

[ \t\n]     { }
.                   { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
