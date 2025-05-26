###############################################################################
# Simple Makefile for C
###############################################################################

PRJDIR  := $(realpath $(CURDIR))
INCDIR  := $(PRJDIR)/inc
SRCDIR  := $(PRJDIR)/src
OBJDIR  := $(PRJDIR)/obj

BINARY  = main

# Detect platform and choose size command
ifeq ($(shell uname -s),Darwin)
	ifeq ($(shell command -v gsize 2>/dev/null),)
		SIZE := size - m
		FLAGSIZEOBJ :=
	else
    	SIZE := gsize -B -d
		FLAGSIZEOBJ := -t
	endif
else
	SIZE := size -B -d
	FLAGSIZEOBJ := -t
endif

# Find all the C files want to compile
SRCS    := $(shell find $(SRCDIR) -name '*.c')

# String substitution for every C files
OBJS    := $(addprefix $(OBJDIR)/,$(patsubst %.c,%.o,$(notdir $(SRCS))))

# Add a prefix to INCDIR
INC_FLAGS   := $(addprefix -I,$(INCDIR))

# Program for compiling C programs; default ‘cc’
CC  = gcc
# Extra flags to give to the C compiler
CFLAGS = -Wall -g
# Extra flags to give to the C preprocessor
CPPFLAGS    := $(INC_FLAGS)

# Default target
all: $(PRJDIR)/$(BINARY)

# Link target
$(PRJDIR)/$(BINARY): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJDIR)/*.o -o $@
	@echo "Binary size:"
	@$(SIZE) $(BINARY)

# Build C sources
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

.PHONY: all clean clobber sizeobj

# Size of object files
sizeobj:
	@echo "Object file sizes:"
	@cd $(OBJDIR)/ && $(SIZE) $(FLAGSIZEOBJ) *.o

# Clean object files
clean:
	-rm -f $(OBJDIR)/*.o

# Clean everything
clobber: clean
	-rm -f $(PRJDIR)/$(BINARY)
