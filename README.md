## Cross-platform Makefile for C Projects (Linux/macOS)
### This project is used with open source tools
No Windows based IDE environments are used or implied!  
Cygwin, Linux, MacOS and BSD environments are suitable.
### This Makefile can be used to build a project with this kind of structure:
    Root-directory/
        |- inc/
            |- header1.h    Header files
            |- header2.h
        |- obj/
            |- *            Object files
        |- src/
            |- main.c       C files
            |- module1.c
            |- module2.c
        |- main             Executable program
        |- Makefile             
### How to use
1. Change the BINARY variable (in Makefile) to match your target name.
2. Put your C files in the ***src/*** folder.
3. Put your Header files in the ***inc/*** folder.
4. Object files in ***obj/*** folder, execultive program in root project directory.
5. If necessary, change the compiler and the flags (not recommended).
