SHELL:=/bin/bash

VERSION :=  "0.0.1"
NAME    :=  hello
TARGET  :=  Release

# Output
OUTPUT_EXE 	  := build/${NAME}
OUTPUT_BUNDLE := dist/${NAME}

# Copy Assets to bundle
ASSET_FOLDER 	:= $(NAME).res

# External dependencies, like curl, openssl
# May have both: shared lib files, and header files
DLL_FOLDER := dep

# Include folders
INCLUDES 	= include/ ext/  						# bultin, 3º party
LIBS 		= m dl pthread curl jansson 			# libm, dlopen, libpthread, libcurl

# Our code & 3party
SOURCES 		= $(wildcard src/*.cpp src/*/*.cpp ext/*/*.c) 

# Entry point
MAIN_APP	= src/main.cpp
TEST_APP 	= src/testsRunner.cpp


#
# Overwrite OS Specific rules
#
ifeq ($(ARCH), linux)
	#SOURCES += ext/osdialog/osdialog_gtk2.c
	#LDFLAGS += $(shell pkg-config --libs gtk+-2.0) 
	#CXXFLAGS += $(shell pkg-config --cflags gtk+-2.0)
endif

ifeq ($(ARCH), mac)
	#SOURCES += ext/osdialog/osdialog_mac.m
	CXXFLAGS += -DAPPLE -stdlib=libc++
	LDFLAGS += -stdlib=libc++ -lpthread -ldl \
		-framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo \
		-lGLEW -lglfw -lrtaudio -lrtmidi
	OUTPUT_BUNDLE += .app
endif

# Include general rules
include ../makerain/Makefile