#include <stdio.h>
#include <stdlib.h>
/* declarations */
void echange( int , int );
void echange2( int *, int *); /* on travaille avec des "emplacements" (ptr)*/
/*  definitions */
void echange( int a, int b)
{
	int temp;
	printf("a = %d\n", a );
	printf("b = %d\n", b );
	/* echange */
	temp = a;
	a = b;
	b = temp;
	printf("a = %d\n", a);
	printf("b = %d\n", b);
}
/* nouvelle version avec pointeurs */
void echange2(int *a, int *b)
{
	/* a et b sont maintenant des "pointeurs"  */
	/* les valeurs "pointees" sont donnees par */
	int temp;
	printf("*a = %d *b = %d\n", *a, *b);
	printf("emplacement memoire des variables : \n");
	printf("a = %08x\n", (unsigned long int)(a));
	printf("b = %08x\n", (unsigned long int)(b));
	temp = *a;
	*a = *b;
	*b = temp;
	printf("*a = %d *b = %d\n", *a, *b);
}
/* fonction principale */
int main( void )
{
	int a, b;
	printf("valeur de a = \n");
	scanf("%d", &a);
	printf("valeur de b= \n");
	scanf("%d", &b);
	printf("avant echange : c = %d d = %d\n", a, b );
	echange2(&a,&b);
	printf("apres echange : c = %d d = %d\n", a, b );
	return( 0 );
}

