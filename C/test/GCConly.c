#include "stdio.h"

typedef struct Student {
	char name[50];
	int studentNo;
	int age;
}Student;

int main(void) {
	int c[] = { [0 ... 9] = 1, [20 ... 99] = 2, [100] = 3 };
	Student st1 = {
		.name = "Peter",
		.age = 18,
		.studentNo = 1234
	};
	int a[7] = { [4] = 29, 33, [2] = 15 };
	int b[7] = { 0, 0, 15, 0, 29, 33, 0 };
	Student st2[5] = {
		[3] = {
			.name = "Titus",
			.age = 22,
			.studentNo = 1041 },
		[2] = {
			.name = "Stephen",
			.age = 23,
			.studentNo = 1042 },
	};
	return 0;
}
