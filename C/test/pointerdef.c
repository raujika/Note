#include <stdio.h>
#include <stdlib.h>
#define test struct list *next;
struct list {
	int data;
	test;
};

int main(){
	struct list listOne, listTwo, listThree;

	listOne.next = &listTwo;
	listTwo.next = &listThree;

	listOne.next->next->data = 0;
	printf("%d",listOne.next->next->data);
	return 0;
}
