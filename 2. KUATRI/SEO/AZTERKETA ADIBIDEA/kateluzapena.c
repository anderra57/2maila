#include<stdio.h>
#include<string.h>
#include "fkateak.h"


#define N 255

void main() {
	char kat[N];
	printf("\nSartu kate bat: \n");
	gets(kat);
	printf("\n%s  katearen luzeera %d da\n", kat,mystrlen(kat));
}
