#include <stdio.h>
#include <linux/input.h>
#include <fcntl.h>
#include <sys/time.h>
#include <unistd.h>
#include <sys/io.h>

int main(){
	struct input_event event;
	int fd_kbd = -1;
	fd_kbd = open("/dev/input/event2", O_RDWR);
	if(fd_kbd <= 0)//mouse
	{
		printf("Can not open mouse input file\n");
		return -1;
	}

	read(fd_kbd, &event, sizeof(event));
	close(fd_kbd);
	return 0;
}
