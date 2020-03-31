package jflex;
/* 	
	Autor: Ander J. Fernández Vega
	Practica: Practica 3 - JFlex con estados
*/

//Area de codigo, importaciones y paquetes

import java.io.*;
%%
//Area de opciones y declaraciones
%class StateLexer
%int
%standalone
%line
%column
%{
//Preparo un objeto String para almacenar el contenido de las cadenas de texto
String tempCadena = new String("");
%}
%state JAVA, ENCADENA_JAVA, PHP, ENCADENA_PHP

Finlinea = \n|\r|\r\n
Blanco = {Finlinea}|[ \t\f]


%%
//Area de reglas y acciones
<YYINITIAL>{
"BeginJava" { System.out.println("JAVA_INI");yybegin(JAVA);}
"BeginPHP" { System.out.println("PHP_INI");yybegin(PHP);}
{Blanco} {}

}
<ENCADENA_JAVA>{
\" {System.out.println("JAVA_CAD_FIN");tempCadena="";yybegin(JAVA);}
{Finlinea} {System.out.println("Error: Cadena sin terminar. Encontrado en linea "+(yyline+1)+" columna "+(yycolumn+1)+".");}

. {tempCadena+=yytext();}
}
<ENCADENA_PHP>{
\" {System.out.println("PHP_CAD_FIN");tempCadena="";yybegin(PHP);}
{Finlinea} {System.out.println("Error: Cadena sin terminar. Encontrado en linea "+(yyline+1)+" columna "+(yycolumn+1)+".");}

. {tempCadena+=yytext();}
}

<JAVA>{
"EndJava" { System.out.println("JAVA_FIN");yybegin(YYINITIAL);}
if { System.out.println("JAVA_IF");}
//else { System.out.println("JAVA_ELSE");}
elseif { System.out.println("JAVA_ELSEIF");}
"else if" { System.out.println("JAVA_ELSEIF");}
">" { System.out.println("JAVA_GT");}
">=" { System.out.println("JAVA_GE");}
"<" { System.out.println("JAVA_LT");}
"<=" { System.out.println("JAVA_LE");}
"==" { System.out.println("JAVA_EQ");}
"!=" { System.out.println("JAVA_NE");}
[_a-zA-Z][_a-zA-Z0-9]* { System.out.println("JAVA_ID("+yytext()+")");}
[0-9]+ { System.out.println("JAVA_NUM("+yytext()+")");}
"=" 	{ System.out.println("JAVA_ASIGN");}
"\"" 	{System.out.println("JAVA_CAD_INI");yybegin(ENCADENA_JAVA);}
";" 	{System.out.println("JAVA_FIN_INS");}
{Blanco} {}
"\." 	{System.out.println("JAVA_PUNTO");}
"(" {System.out.println("JAVA_ABREPAR");}
")" {System.out.println("JAVA_CIERRAPAR");}
"{" {System.out.println("JAVA_ABRELLAVE");}
"}" {System.out.println("JAVA_CIERRALLAVE");}
. {System.out.println("Error: encontrado "+yytext()+" en linea "+(yyline+1)+" columna "+(yycolumn+1));}
}

<PHP>{
"EndPHP" { System.out.println("PHP_FIN");yybegin(YYINITIAL);}
\$	{}
if { System.out.println("PHP_IF");}
else { System.out.println("PHP_ELSE");}
elseif { System.out.println("PHP_ELSEIF");}
">" { System.out.println("PHP_GT");}
">=" { System.out.println("PHP_GE");}
"<" { System.out.println("PHP_LT");}
"<=" { System.out.println("PHP_LE");}
"==" { System.out.println("PHP_EQ");}
"!=" { System.out.println("PHP_NE");}
[_a-zA-Z][_a-zA-Z0-9]* { System.out.println("PHP_ID("+yytext()+")");}
[0-9]+ { System.out.println("PHP_NUM("+yytext()+")");}
"=" 	{ System.out.println("PHP_ASIGN");}
"\"" 	{System.out.println("PHP_CAD_INI");yybegin(ENCADENA_PHP);}
";" 	{System.out.println("PHP_FIN_INS");}
{Blanco} {}
"\." 	{System.out.println("PHP_PUNTO");}
"(" {System.out.println("PHP_ABREPAR");}
")" {System.out.println("PHP_CIERRAPAR");}
"{" {System.out.println("PHP_ABRELLAVE");}
"}" {System.out.println("PHP_CIERRALLAVE");}
. {System.out.println("Error: encontrado "+yytext()+" en linea "+(yyline+1)+" columna "+(yycolumn+1));}
}