SHELL:=/bin/bash

VERSION :=  "0.0.1"
NAME    :=  hello
TARGET  := Release

# Output
PROGRAM := build/${NAME}

# Copy Assets to bundle (if mac or windows) 
ASSET_FOLDER 	:= $(NAME).res

# External dependencies, like curl, openssl
# Should have both: shared code, and header files
DLL_FOLDER := dep

# Include folders
INCLUDES 	:= include/ ext/  					# bultin and 3ºparty
LIBS 		:= m pthread curl jansson 			# libm, libpthread, libcurl

# Our code & 3party
CODE 		:= $(wildcard example/src/*.cpp example/src/*/*.cpp      ext/*/*.c) 

# Entry point
MAIN_APP	:= src/main.cpp
TEST_APP 	:= src/testsRunner.cpp

include makerain/arch.mk

#
# Overwrite OS Specific rules
#
ifeq ($(ARCH), linux)
	#SOURCES += ext/osdialog/osdialog_gtk2.c
	#LDFLAGS += $(shell pkg-config --libs gtk+-2.0) 
	#CFLAGS += $(shell pkg-config --cflags gtk+-2.0)
	TARGET = ./build/Groundboots
	BUNDLE = $(TARGET)
endif

ifeq ($(ARCH), mac)
	#SOURCES += ext/osdialog/osdialog_mac.m
	CXXFLAGS += -DAPPLE -stdlib=libc++
	LDFLAGS += -stdlib=libc++ -lpthread -ldl \
		-framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo \
		-Ldep/lib -lGLEW -lglfw -ljansson -lsamplerate -lcurl -lzip -lrtaudio -lrtmidi
	TARGET = ./Groundboots
	BUNDLE = dist/$(TARGET).app
endif


build: $(MAIN_APP) $(PROGRAM)



info:
	@$(eval SOURCES_NUM = $(shell echo -n ${SOURCES} | wc -w))	
	@$(eval GIT_UPSTREAM = $(shell git config --get remote.origin.url))
	@$(eval LAST_COMMIT = $(shell git log -1 --pretty=format:"%h" 2> /dev/null))

	@echo -e "*"
	@echo -e "* GNU Make"
	@echo -e "*"	
	@echo -e "* ${MAGENTA}${BOLD}$(NAME) \t ${CYAN}${VERSION}${NC}@${RED}${LAST_COMMIT}${NC}"
	@echo -e "*"
	@echo -e "*   ⚛️  Compiler        => \t${CYAN} ${CC} ${NC}, ${CYAN}${CXX}${NC}" 
	@echo -e "*   🌍 OS              => \t${GREEN}$(ARCH)${NC}"
	@echo -e "*   🔬 Tests           => \t${CYAN}doctest${NC}"
	@echo -e "*"
	@echo -e "*   🔰 Main            => \t${CYAN}$(MAIN_APP)${NC}"
	@echo -e "*   📘 Classes         => \t${BOLD}${SOURCES_NUM}${NC} files"
	@echo -e "*   📡 GIT Upstream    => \t${GREEN}${GIT_UPSTREAM}${NC}"
	@echo -e "*"








# Dependencies libraries
dll:
	@$(MAKE) --no-print-directory -C $(DLL_FOLDER)


#
run: $(TARGET)
ifeq ($(ARCH), linux)
	LD_LIBRARY_PATH=dep/lib ./$<
endif
ifeq ($(ARCH), mac)
	DYLD_FALLBACK_LIBRARY_PATH=dep/lib ./$<
endif
ifeq ($(ARCH), win)
	# TODO get rid of the mingw64 path
	env PATH=dep/bin:/mingw64/bin ./$<
endif

test: doctest
ifeq ($(ARCH), linux)
	LD_LIBRARY_PATH=dep/lib ./$<
endif
ifeq ($(ARCH), mac)
	DYLD_FALLBACK_LIBRARY_PATH=dep/lib ./$<
endif
ifeq ($(ARCH), win)
	# TODO get rid of the mingw64 path
	env PATH=dep/bin:/mingw64/bin ./$<
endif


# Debug
debug: $(NAME)
ifeq ($(ARCH), linux)
	LD_LIBRARY_PATH=dep/lib gdb -ex run $(PROGRAM)
endif

clean:
	rm -rfv $(PROGRAM) build dist

# By the end, compilation rules
include makerain/compile.mk

.PHONY: all info doctest test dll run debug clean 
