#include "PointerBase.h"

void added(int *x, int *y){
	*x = *x + *y;
}

int * added2(int x, int y){
	x = x + y;

	return &x;
}