#include <stdio.h>
#include <stdlib.h>
#define cast(t, exp) ((t)(exp))

typedef void (*pt2Function)(int, int);

void print_one_number(int a) {
	printf("a = %d\n", a);
}

void print_two_number(int a, int b) {
	printf("a = %d, b = %d\n", a, b);
}

void main() {
	pt2Function funcArr[2];
	funcArr[0] = cast(pt2Function *, &print_one_number);
	funcArr[1] = &print_two_number;
	funcArr[1](12, 1);
	funcArr[0](12, 0);
}
