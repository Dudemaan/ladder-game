##
# Untitled Ladder Game
#
# @file
# @version 0.1

INCLUDEDIRS=-I include/
LIBDIRS=-L lib/
CODEDIRS=./src

CC=gcc
CFLAGS=-O1 -Wall -std=c99 $(INCLUDEDIRS)
LIBRARIES=raylib opengl32 gdi32 winmm
EXTFLAGS= $(LIBDIRS) $(foreach D,$(LIBRARIES),-l$(D))

CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.c))
OBJECTS=$(patsubst %.c,%.o,$(CFILES))

BINARY=bin.exe

all: $(BINARY)

$(BINARY):$(OBJECTS)
	$(CC) -o $@ $^ $(EXTFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) $(EXTFLAGS) -c -o $@ $<

clean:
	rm -rf $(BINARY) $(OBJECTS)

# end
