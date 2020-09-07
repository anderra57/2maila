#include<stdio.h>
#include<string.h>


int mystrlen(char kat[]) {
	int kont=0;
	int i=0;
	char letra=kat[i];

	while(&letra != "\0"){
		kont++;
		i++;
		letra=kat[i];
	}
	return kont;
}
