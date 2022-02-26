%{
#include <stdio.h>
#include<stdlib.h>
#include <string.h>
#include"analyse_syntaxique.tab.h"
extern int ligne;
extern int col;
extern YYSTYPE yylval;

%}

lettre [a-z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre}|_|{lettre}|{chiffre})*
Pint                "-"?[0-9]+
Pfloat              "-"?[0-9]+"."[0-9]+
commentaireType1	"//"([^\n])* 
commentaireType2	\/\*.+\*\/
%%
{IDF} {if (yyleng<13) {
            yylval.str=strdup(yytext);
            return IDF;
       }else 
            printf ("Identificateur %s refusee car: \n ca longeur %d >12 (erreur a la ligne %d Colonne %d) \n", yytext, yyleng, ligne, col-strlen(yytext));
}		
Pint {yylval.str=strdup(yytext); return Pint;}
Pfloat {yylval.str=strdup(yytext); return Pfloat;}
{Pint} {yylval.entier=atoi(yytext);
            if(atoi(yytext)>-32768 && atoi(yytext)<32767) 
                      return integer;}
{Pfloat} {yylval.reeel=atof(yytext); 
            if(atof(yytext)>-32768 && atof(yytext)<32767) 
                         return reel;}
Program  {col=col+yyleng;return Program; }
PDEC {col=col+yyleng;return PDEC ; }
PINST {col=col+yyleng; return PINST;}
Begin { col=col+yyleng;return Begin; }
FOR { col=col+yyleng;return FOR; }
WHILE {col=col+yyleng;return WHILE; }
DO {col=col+yyleng;return DO; }
ENDFOR  {col=col+yyleng;return ENDFOR; }
END {col=col+yyleng;return END; }
Fininst {col=col+yyleng; return fininst;}
IF {col=col+yyleng;return IF; }
ELSE  {col=col+yyleng;return ELSE; }
ENDIF  {col=col+yyleng;return ENDIF; }
{commentaireType1}	{col=col+yyleng; }
{commentaireType2}	{col=col+yyleng; }
"<--" {col=col+yyleng;return aff; }
"@define"  {col=col+yyleng;return adefine; }
"=" {col=col+yyleng;return egale; }
":"  {col=col+yyleng;return dp; }
";" {col=col+yyleng;return pvg;  }
"|"   {col=col+yyleng; return ou;}
">"  {col=col+yyleng; return sup;}
"<"  {col=col+yyleng;return inf; }
"!="  {col=col+yyleng;return diff; }
">="  {col=col+yyleng; return supegal;}
"<="  {col=col+yyleng;return infegal; }
"&"  {col=col+yyleng;return et; }
"("  {col=col+yyleng;return po; }
")"  {col=col+yyleng;return pf; }
"+"    {col=col+yyleng;return plus; }
"-"   {col=col+yyleng;return moins; }
"*"    {col=col+yyleng;return mult; }
"/"   {col=col+yyleng;return divv; }
"=="  {col=col+yyleng;return egaleEgale; }


[ \t] {col=col+yyleng; };
\n {ligne++;col=0;}
. printf("Erreur lexicale : %s \nligne %d Colonne %d\n",yytext ,ligne, col);
%%