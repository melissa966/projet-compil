%{
#include <stdio.h>
#include <string.h>
#include "routine.h"
extern int yylex();
int ligne=1;
int col=1;
extern char * yytext;
extern void afficher();
int yyerror(char * msg);

char tempIDFs [100][20];
int cptIDFsTemp = 0;
int i=0;
%}

%union{
     int entier;
     float reeel;
     char* str;
}
%token Program PDEC dp pvg ou adefine  egale arobase  IF ELSE ENDIF 
       PINST Begin aff sup inf diff supegal infegal et 
       FOR  WHILE DO ENDFOR 
       <entier>integer <reeel>reel <str>IDF <str>Pint <str>Pfloat pf po END fininst
%token	plus moins mult divv egaleEgale
	
%left ou
%left et 
%left diff
%left sup supegal egale infegal inf
%left plus moins
%left mult divv
%start prog

%type <str> TYPE;
%%

prog: Program IDF PDEC Dec PINST Begin Inst END{ printf ("programme syntaxiquement correcte...Mission passed ! \n"); YYACCEPT; }
;
Dec: Dec Liste_dec 
   | Liste_dec
;

Liste_dec: Declaration_variable
         | Declaration_constante
;

Declaration_variable: Liste_IDF dp TYPE pvg {
    for(i=0; i<cptIDFsTemp; i++){
        if (doubleDeclaration(tempIDFs[i])==0) {
            inserer(tempIDFs[i], "variable");
            inserertype(tempIDFs[i], $3);
        }
    }
    cptIDFsTemp = 0;
}
;

Declaration_constante: adefine TYPE IDF egale Valeur pvg {
    if (doubleDeclaration($3)==0) {
       inserer($3, "constante");
       inserertype($3, $2);
    }
    else printf("erreur Semantique : double declation de la constante  %s, a la ligne %d\n", $3, ligne); 
} 
;
Liste_IDF: Liste_IDF ou IDF {
            if (doubleDeclaration($3)==0) {strcpy(tempIDFs[cptIDFsTemp], $3); cptIDFsTemp++;}
			else printf("erreur Semantique : double declation de la variable %s, a la ligne %d\n", $3, ligne); 
            
        }	   
         | IDF {
			 if (doubleDeclaration($1)==0) {strcpy(tempIDFs[cptIDFsTemp], $1); cptIDFsTemp++;}
			else printf("erreur Semantique : double declation de la variable %s, a la ligne %d\n", $1, ligne); 
            
            
        }
;					

TYPE: Pint   {
        $$ = $1;
    }
    | Pfloat {
        $$ = $1;
    }
;

Inst: Affectation
    | Boucle 
	| condition
	| Inst Affectation 
    | Inst Boucle 
	| Inst condition
;

Affectation: IDF aff exp pvg   
;

exp: exp plus exp
   | exp moins exp
   | exp mult exp
   | exp divv exp
   | IDF
   | integer {if($1==0) printf("erreur semantique div/0 a la ligne %d\n",ligne);}
   | reel  {if($1==0) printf("erreur semantique div/0 a la ligne %d\n",ligne);} 
;

Boucle : FOR po IDF aff Valeur pf WHILE Valeur DO Inst ENDFOR { }
;

condition: DO Inst IF dp po explog pf ENDIF
         | DO Inst IF dp po explog pf  ELSE po Inst pf ENDIF

;
explog: cond et cond
	  | cond ou cond
	  | cond
;
cond: exp sup exp
    | exp supegal exp
    | exp inf exp
    | exp infegal exp
    | exp egaleEgale exp
    | exp diff exp
;
	
Valeur: reel  
      | integer  
;


%%
int yyerror(char* msg)
{printf("Erreur Syntaxique l'entite qui l a genere : %s a la ligne : %d et la colonne : %d\n ",yytext, ligne, col);
return 0;
}
FILE* yyin;
int main()
{
    yyin = fopen("exp.language.txt", "r");
    yyparse(); 
    afficher();
    return 0;
} 
int yywrap() {}