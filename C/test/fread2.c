#include <stdio.h>
#include <stdlib.h>

struct addressList {
	char nickname[30];
	int age;
	int sex;
	char relation[30];
};

int main(void) {
	FILE *fPtr;
	struct addressList entry = {"", 0, 0, ""};

	fPtr = fopen("address.dat", "rb");
	if (!fPtr) {
		printf("error\n");
		exit(1);
	}

	while (!feof(fPtr)) {
		fread(&entry, sizeof(struct addressList), 1, fPtr);
		printf("%s - %d - %s - %s\n", entry.nickname, entry.age, entry.sex ? "m" : "f", entry.relation);
	}

	fclose(fPtr);

	return 0;
}
