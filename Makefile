DIRS := code
IMAGE := boot.bin

EM := qemu-system-x86_64
EMFLAGS :=

default:

em: $(DIRS) $(IMAGE)
	$(EM) $(EMFLAGS) -drive file=$(IMAGE),format=raw,index=0,media=disk

.PHONY: $(DIRS)
$(DIRS):
	$(MAKE) -C $@ all

clean:
	@for DIR in $(DIRS); do \
		$(MAKE) -C $$DIR clean; \
	done
	@rm -f $(BUILD)/*
