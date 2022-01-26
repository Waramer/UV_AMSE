#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
/*=============================================*/
/* argc : represente le nombre de chaines de   */
/*        caracteres de la "ligne de commande" */
/* argv : tableau de chaines de caracteres qui */
/*        regroupe les chaines composant la    */
/*        ligne de commande.                   */
/*=============================================*/
int main( int argc, char *argv[], char *envp[])
{
    int i;  /* ->compteur de boucle */
    /* argv est un tableau de chaines de caracteres */
    for(i=0; i < argc; i++)
    {
        printf("argv[%d] = %s\n", i, argv[i]);
    }; /* -> ';' pas indispensable */
    /* affichage des variables d'environnement : */
    i  = 0;
    while( envp[i] != NULL)
    {
        printf("envp[%d] = %s\n", i, envp[i]);
        i++;
    };
    return( 0 );
}