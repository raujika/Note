#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/kd.h>
#include "getfd.h"

int main(){
	int fd;
	struct kbkeycode a,b;
	fd = getfd(NULL);
	a.keycode=31;
	b.keycode=31;
	a.scancode=30;
	b.scancode=30;
	ioctl(fd,KDSETKEYCODE, &a);
	ioctl(fd,KDSETKEYCODE, &b);
	return 0;
}
