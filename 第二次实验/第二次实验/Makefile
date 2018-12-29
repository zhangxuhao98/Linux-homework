ifneq ($(KERNELRELEASE),)
	#obj-m 指编译成外部模块
	obj-m := rand_gen.o
else
	#定义一个变量,指向内核目录
	KERNELDIR := /lib/modules/$(shell uname -r)/build 
	PWD := $(shell pwd)
modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
endif
clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
