EXTRA_CFLAGS += $(DEBFLAGS) -I/usr/lib/gcc/i686-redhat-linux/8/include/
# Comment/uncomment the following line to disable/enable debugging
#DEBUG = y

# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG),y)
  DEBFLAGS = -O -g # "-O" is needed to expand inlines
else
  DEBFLAGS = -O2
endif


ifneq ($(KERNELRELEASE),)
# call from kernel build system

obj-m	:= drive064.o

else

KERNELDIR ?= /lib/modules/$(shell uname -r)/build -I/usr/lib/gcc/i686-redhat-linux/8/include/
PWD       := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules #LDDINCDIR=$(PWD)/../include modules

endif

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

depend .depend dep:
	$(CC) $(CFLAGS) -M *.c > .depend


ifeq (.depend,$(wildcard .depend))
include .depend
endif
