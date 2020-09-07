#include <stdio.h>
#include <unistd.h>

int main(){
	printf("UID: %d\n", getuid());
	printf("EUID: %d\n", geteuid());
}
