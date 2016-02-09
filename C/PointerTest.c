#include <stdio.h>
#include "PointerBase.h"

int main(){
	int x = 1;
	int y = 2;

	added(&x,&y);

	printf("%d\n", x);

	int *i = *added2(x,y);

	printf("%d\n", *i);

	return 0;
}