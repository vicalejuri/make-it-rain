#
## Helpers and compilers for .cc , .cpp, .hh, .h
#  
include makerain/prettyprint.mk

################
# GLOBAL FAGS #
###############
#	   
#	  
#	 
#	 
ifdef VERSION
FLAGS += -DVERSION=$(VERSION)
endif

# Generate dependency files alongside the object files
FLAGS += -MMD
FLAGS += -g -w # avoid warn (UHMN???)

# Optimization
FLAGS += -O3 -march=nocona -ffast-math -fno-finite-math-only
FLAGS += -Wall -Wextra -Wno-unused-parameter

# Mac
ifneq ($(ARCH), mac)
CXXFLAGS += -Wsuggest-override
endif

# CPP Flags
CXXFLAGS += -lstdc++ -std=c++11


ifeq ($(ARCH), linux)
	FLAGS += -DARCH_LIN
endif

ifeq ($(ARCH), mac)
	FLAGS += -DARCH_MAC
	CXXFLAGS += -Wsuggest-override -stdlib=libc++
	LDFLAGS += -stdlib=libc++
	MAC_SDK_FLAGS = -mmacosx-version-min=10.7
	LDFLAGS += $(MAC_SDK_FLAGS)
endif

ifeq ($(ARCH), win)
	FLAGS += -DARCH_WIN
	FLAGS += -D_USE_MATH_DEFINES
endif


# Source files that need to be compiled
include makerain/normalize.mk

OBJECTS += $(patsubst %, build/%.o, $(SOURCES))
DEPS = $(patsubst %, build/%.d, $(SOURCES))

ifeq ( $$, ok )
	OBJECTS=FODASE;
endif


#
# Tests
#
doctest: $(TEST_APP) $(OBJECTS)
	@$(CXX) $(FLAGS) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

	@$(eval FILES_NUM = $(shell echo -n $^ | wc -w))	
	@printf "[${OK}] Linked ${CYAN}${FILES_NUM} files${NC} => ${GREEN}$@${NC}\n"


-include $(DEPS)


#
# Final app targets
#
$(PROGRAM): $(MAIN_APP) $(OBJECTS)
	@echo -e ${F}
	$(CXX) $(FLAGS) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

	@$(eval FILES_NUM = $(shell echo -n $^ | wc -w))	
	@printf "[${OK}] Linked ${CYAN}${FILES_NUM} files${NC} => ${GREEN}$@${NC}\n"


-include $(DEPS)


#
# Individual files to be compiled
# 
build/%.c.o: %.c
	@mkdir -p $(@D)
	$(CC) $(FLAGS) $(CFLAGS) -c -o $@ $<
	@printf "[$(OK)] Compiled ${CYAN}$<${NC}\n"

build/%.m.o: %.m
	@mkdir -p $(@D)
	$(CC) $(FLAGS) $(CFLAGS) -c -o $@ $<
	@printf "[$(OK)] Compiled ${CYAN}$<${NC}\n"

build/%.cpp.o: %.cpp
	@mkdir -p $(@D)
	$(CXX) $(FLAGS) $(CXXFLAGS) -c -o $@ $<
	@printf "[$(OK)] Compiled ${CYAN}$<${NC}\n"


build/%.cc.o: %.cc compile
	@mkdir -p $(@D)
	$(CXX) $(FLAGS) $(CXXFLAGS) -c -o $@ $<
	printf "[$(OK)] Compiled ${CYAN}$<${NC}\n"
	