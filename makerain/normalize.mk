###################
# Normalize FLAGS #
###################

# Default runtime is current folder
LIBS_RUNTIME = ./

# if custom libraries in its own folder,
# point INCLUDE&RUNTIME to that folder. 
ifdef DLL_FOLDER
INCLUDES 	 += $(DLL_FOLDER)/include
LIBS_RUNTIME += $(DLL_FOLDER)/lib
endif

# Convert strings
# pthreads → -lpthreads
INCLUDES_AS_ARGS := $(patsubst %, -I%, $(INCLUDES)) 
LIBS_AS_ARGS 	 := $(patsubst %, -l%, $(LIBS)) 

# Normalize flags
CFLAGS 			+= $(INCLUDES_AS_ARGS)
CXXFLAGS 		+= $(INCLUDES_AS_ARGS)
LD_FLAGS 		+= -rdynamic \
				   -L$(LIBS_RUNTIME) $(LIBS_AS_ARGS)


# Source code without 'main' file
OBJ_SOURCES 	    = $(filter-out $(MAIN_APP) $(TEST_APP), $(SOURCES))

# Library Path
LD_PATH = $(subst $(space),,$(LIBS_RUNTIME))