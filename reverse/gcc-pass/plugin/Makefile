# The gcc used to compile our plugin (consider that is written in C++!)
HOST_GCC = g++

# The gcc that will support our plugin 
TARGET_GCC = gcc

# The name of the file we want to compile 
PLUGIN_SOURCE_FILES = main.cpp

# Plugins directory of GCC
GCC_PLUGINS_DIR = $(shell $(TARGET_GCC) -print-file-name=plugin)

# GCC CPP flags (we need position-independent code and run-time type info support disabled)
CXXFLAGS+= -I$(GCC_PLUGINS_DIR)/include -fPIC -fno-rtti -std=c++11

#/usr/lib/gcc/x86_64-linux-gnu/7/plugin/include/

# our recipes
.PHONY: all clean test

all: inst_plugin.so

hello_plugin.so: helloworld.cpp
	$(HOST_GCC) -shared $(CXXFLAGS) $^ -o $@

inst_plugin.so: instrument.cpp
	$(HOST_GCC) -shared $(CXXFLAGS) $^ -o $@

genGraph_plugin.so: genGraph_plugin.cpp
	$(HOST_GCC) -shared $(CXXFLAGS) $^ -o $@
	
helloworld: hello_plugin.so
	g++ ../case/main.c -fplugin=$(shell pwd)/inst_plugin.so -o bin

finstfunc: inst_plugin.so
	g++ ../case/instrument.c -finstrument-functions -o bin

test: genGraph_plugin.so
	g++ ../case/main2.c -fplugin=`pwd`/inst_plugin.so -o bin 2> test.dot

clean: 
	rm -f inst_plugin.so bin