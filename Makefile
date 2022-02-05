SUBDIRS := Cours/ TP-1/ TP-2 TP-3/ TP-4/ TP-5/ TP-7/ TP-8/
all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)