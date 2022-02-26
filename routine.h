#include <stdlib.h>
#include <stdio.h>
#include <string.h>
//structure de la table de symbole*********************************************************
typedef struct
{
	int state;
char Nom[12];
char Code[20];
char Type[20];

} TypeTS;

//initiation d'un tableau qui va contenir les elements de la table de symbole
TypeTS ts[100]; 
// un compteur global pour la table de symbole
int CpTabSym=0;


/*********************************************************************************************/
int recherche(char entite[])
{
int i=0;
while(i<CpTabSym)
{
if (strcmp(entite,ts[i].Nom)==0) return i;
i++;
}
return -1;
}

/*********************************************************************************************/
//une fontion qui va insÃ¯Â¿Â½rer les entitÃ¯Â¿Â½s de programme dans la table de symbole
void inserer(char entite[], char code[])
{
if ( recherche(entite)==-1)
{
strcpy(ts[CpTabSym].Nom,entite); 
strcpy(ts[CpTabSym].Code,code);
CpTabSym++;
}
}

/*********************************************************************************************/
//une fonction pour afficher la table de symbole
void afficher ()
{
printf("\n/************************Table des symboles**********************/\n");
printf("____________________________________________________\n");
printf("\t| Nom       |   Nature    |      TYPE       \n");
printf("____________________________________________________\n");
int i=0;
while(i<CpTabSym)
{
printf("\t|%10s |%12s |%12s   \n",ts[i].Nom,ts[i].Code,ts[i].Type);
i++;
}
}

/*********************************************************************************************/
void inserertype(char entite[], char type[])
{
	int pos;
 pos=recherche(entite);
 if(pos!=-1)
strcpy(ts[pos].Type,type); 
}

/*********************************************************************************************/
int doubleDeclaration (char entite[])
{
int posEntite=recherche(entite);
if (strcmp(ts[posEntite].Type,"")==0) return 0; // j'ai pas trouvÃ© le type associÃ© Ã  l'entitÃ© dans le table de symbole et 
// donc elle est pas encore dÃ©clarÃ©e
else return 1; // le type de l'entitÃ© existe dÃ©jÃ  dans la TS et donc c'est une double dÃ©claration
}
