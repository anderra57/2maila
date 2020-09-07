#include<stdio.h>
#include<string.h>

int mystrlen(char katea[]){

    int emaitza = 0;
    while (katea[emaitza]!='\0'){
        emaitza++;
    }

    return emaitza;
}
