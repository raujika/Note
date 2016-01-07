#include <stdio.h>
#include <stdlib.h>

struct addressList {
	char nickname[30];
	int age;
	int sex;
	char relation[30];
};

int (main) (void)
{
	FILE *fPtr;
	struct addressList blankEntry1 = {"John", 15, 1, "friend"};
	struct addressList blankEntry2 = {"Mary", 13, 0, "teacher"};

	fPtr = fopen("address.dat", "wb+");
	if (!fPtr) {
		printf("error\n");
		exit(1);
	}

	fwrite(&blankEntry1, sizeof(struct addressList), 1, fPtr);
	fwrite(&blankEntry2, sizeof(struct addressList), 1, fPtr);

	fclose(fPtr);

	return 0;
}
