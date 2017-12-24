include ../makerain/arch.mk

#
# Overwrite OS Specific rules
#
ifeq ($(ARCH), linux)
	#SOURCES += ext/osdialog/osdialog_gtk2.c
	#LDFLAGS += $(shell pkg-config --libs gtk+-2.0) 
	#CXXFLAGS += $(shell pkg-config --cflags gtk+-2.0)
	OUTPUT_EXE    := build/${NAME}
	OUTPUT_BUNDLE := dist/${NAME}

endif

ifeq ($(ARCH), mac)
	#SOURCES += ext/osdialog/osdialog_mac.m
	CXXFLAGS += -DAPPLE -stdlib=libc++
	LDFLAGS += -stdlib=libc++ \
		-framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo \
		-lGLEW -lglfw -lrtaudio -lrtmidi	
endif


build: $(MAIN_APP) $(OUTPUT_EXE)



info:
	@$(eval SOURCES_NUM = $(shell echo -n ${SOURCES} | wc -w))	
	@$(eval GIT_UPSTREAM = $(shell git config --get remote.origin.url))
	@$(eval LAST_COMMIT = $(shell git log -1 --pretty=format:"%h" 2> /dev/null))

	@echo -e "*"
	@echo -e "* GNU Make"
	@echo -e "*"	
	@echo -e "* ${MAGENTA}${BOLD}$(NAME) \t ${CYAN}${VERSION}${NC}@${RED}${LAST_COMMIT}${NC}"
	@echo -e "*"
	@echo -e "*   ⚛️  Compiler        => \t${CYAN}${CC}${NC}, ${CYAN}${CXX}${NC}" 
	@echo -e "*   🌍 OS              => \t${GREEN}$(ARCH)${NC}"
	@echo -e "*   🔬 Tests           => \t${CYAN}doctest${NC}"
	@echo -e "*"
	@echo -e "*   🔰 Main            => \t${CYAN}$(MAIN_APP)${NC}"
	@echo -e "*   📘 Classes         => \t${BOLD}${SOURCES_NUM}${NC} files"
	@echo -e "*   📡 GIT Upstream    => \t${GREEN}${GIT_UPSTREAM}${NC}"
	@echo -e "*"








# Build Dependencies libraries
dll:
	@$(MAKE) --no-print-directory -C $(DLL_FOLDER)


# Run program 
run: $(OUTPUT_EXE)
ifeq ($(ARCH), linux)
	@LD_LIBRARY_PATH=$(LD_PATH) ./$<
endif
ifeq ($(ARCH), mac)
	@DYLD_FALLBACK_LIBRARY_PATH=$(LD_PATH) ./$<
endif
ifeq ($(ARCH), win)
	# TODO get rid of the mingw64 path
	@env PATH=$(LD_PATH):/mingw64/bin ./$<
endif


# Run test
test: doctest
ifeq ($(ARCH), linux)
	@LD_LIBRARY_PATH=$(LD_PATH) ./$<
endif
ifeq ($(ARCH), mac)
	@DYLD_FALLBACK_LIBRARY_PATH=$(LD_PATH) ./$<
endif
ifeq ($(ARCH), win)
	# TODO get rid of the mingw64 path
	@env PATH=$(LD_PATH):/mingw64/bin ./$<
endif


# Debug
debug: $(NAME)
ifeq ($(ARCH), linux)
	LD_LIBRARY_PATH=$(LD_PATH) gdb -ex run $(OUTPUT_EXE)
endif



#
clean:
	rm -rfv $(OUTPUT_EXE)



# By the end, compilation rules
include ../makerain/compile.mk



.PHONY: all info doctest test dll run debug clean 
