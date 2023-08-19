###############################################################################
# Simple Makefile
###############################################################################

PRJDIR  := $(realpath $(CURDIR))
INCDIR  := $(PRJDIR)/inc
SRCDIR  := $(PRJDIR)/src
OBJDIR  := $(PRJDIR)/obj

BINARY  = main

# Find all the C files want to compile
SRCS    := $(shell find $(SRCDIR) -name *.c)

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

# The final build step
$(PRJDIR)/$(BINARY): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJDIR)/*.o -o $@

# Build step for C sources
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

.PHONY: clean clobber
clean:
	-rm -f $(OBJDIR)/*.o

clobber: clean
	-rm -f $(PRJDIR)/$(BINARY)
