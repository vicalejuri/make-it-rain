# Detect architecture if ARCH is not defined

ifndef ARCH

MACHINE = $(shell gcc -dumpmachine)
ifneq (,$(findstring linux,$(MACHINE)))
	# Linux
	ARCH = linux
else ifneq (,$(findstring apple,$(MACHINE)))
	# Mac
	ARCH = mac
else ifneq (,$(findstring mingw,$(MACHINE)))
	# Windows
	ARCH = win
else
	$(error Could not determine machine type. Try hacking around in arch.mk)
endif

endif


# Detect target mode (DEBUG or RELEASE)
ifndef TARGET
TARGET=DEBUG
endif
