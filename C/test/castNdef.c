struct x {
	int xx;
};

int main() {
	struct x data;
	data.xx = 99;
	struct x *tmp = &data;

	printf("tmp->xx = %d \n", tmp->xx);
	printf("(!#$^&->yy = %d \n", ((struct y {int yy;} *)(tmp))->yy);

	struct y xxxx;

	return 0;
}
