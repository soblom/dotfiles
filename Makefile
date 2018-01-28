makefiles := $(wildcard */Makefile)
makedirs := $(makefiles:/Makefile=)

all: $(makedirs)

$(makedirs):
	$(MAKE) -C $@


