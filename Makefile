#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

TOPDIR ?= $(CURDIR)
include $(DEVKITARM)/base_rules

.PHONY: clean all

DEFINES	:=	

ifneq ($(strip $(ARM9PAYLOADPATH)),)
DEFINES	:=	-DARM9PAYLOADPATH=\"$(ARM9PAYLOADPATH)\"
else
$(error "The ARM9PAYLOADPATH param must be specified.")
endif

all:	firm_payload_bootstrap.firm

clean:
	@rm -R -f bootstrap9.bin bootstrap9.elf bootstrap11.bin bootstrap11.elf firm_payload_bootstrap.firm

firm_payload_bootstrap.firm:	bootstrap9.bin bootstrap11.bin
	@firm_builder firm_payload_bootstrap.firm 0x080d8000 0x1fffe400 0x080d8000 0x0 bootstrap9.bin 0x1fffe400 0x1 bootstrap11.bin

bootstrap9.bin:	bootstrap9.elf
	$(OBJCOPY) -O binary $< $@

bootstrap11.bin:	bootstrap11.elf
	$(OBJCOPY) -O binary $< $@

bootstrap9.elf:	bootstrap9.s
	$(CC) -x assembler-with-cpp -nostartfiles -nostdlib $(DEFINES) $< -o $@

bootstrap11.elf:	bootstrap11.s
	$(CC) -x assembler-with-cpp -nostartfiles -nostdlib $(DEFINES) $< -o $@

