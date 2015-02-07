# Giraffe Library Makefile
#
# Copyright (C) 2015 Phil Clayton <phil.clayton@veonix.com>
#
# This file is part of the Giraffe Library runtime.  For your rights to use
# this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
# or visit <http://www.giraffelibrary.org/licence-runtime.html>.


-include config.mk

ifndef SMLLIBS
default :
	@echo
	@echo "error: config.mk not found; run ./configure first"
else



################################################################################
# Make options
#

default : mlton polyml

help :
	@echo
	@echo "Makefile usage:"
	@echo "  make               - build libraries for compilers"
	@echo "  make install       - install to $(PREFIX)"
	@echo "  make clean         - remove intermediate files"
	@echo "  make distclean     - remove all generated files"
	@echo



################################################################################
# Building
#

CFLAGS := -DGIRAFFE_DEBUG -ggdb -std=c99 -O2


#   - MLton

src/mlton/gcharvecveclib.o : src/mlton/gcharvecveclib.c
	@$(CC) $(CFLAGS) -c -o $@ `pkg-config --cflags glib-2.0` $<

MLTONCFLAGS := $(CFLAGS) -iquote "src"
MLTONOFILES := $(patsubst %,src/mlton/giraffe-%.o,$(MLTONLIBS))

$(MLTONOFILES) : src/mlton/giraffe-%.o : src/mlton/giraffe-%.c src/mlton/gcharptrffi.h src/mlton/gcharptrptrffi.h
	@$(CC) $(MLTONCFLAGS) -c -I$(MLTONINCLUDE) -o $@ `pkg-config --cflags $(shell cat src/sml/$*/package)` $<


.PHONY : mlton

mlton : src/mlton/gcharvecveclib.o $(MLTONOFILES)


#   - Poly/ML

POLYMLCFLAGS := $(CFLAGS) -iquote "src" -fPIC
POLYMLOFILES  := $(patsubst %,src/polyml/giraffe-%.o,$(POLYMLLIBS))
POLYMLSOFILES := $(patsubst %,src/polyml/libgiraffe-%.so,$(POLYMLLIBS))

$(POLYMLOFILES) : src/polyml/giraffe-%.o : src/polyml/giraffe-%.c
	@$(CC) $(POLYMLCFLAGS) -c -o $@ `pkg-config --cflags $(shell cat src/sml/$*/package)` $<

$(POLYMLSOFILES) : src/polyml/libgiraffe-%.so : src/polyml/giraffe-%.o
	@$(CC) -shared -Wl,-soname,src/polyml/libgiraffe-glib.so.1 -o $@ `pkg-config --libs $(shell cat src/sml/$*/package)` $<


.PHONY : polyml

polyml : $(POLYMLSOFILES)



################################################################################
# Installation
#

LIBDIR := "$(PREFIX)/lib"
INCLUDEDIR := "$(PREFIX)/include"

.PHONY : install-mlton install-polyml install-sml install

install-mlton :
	@mkdir -p "$(LIBDIR)"
	@mkdir -p "$(LIBDIR)/mlton"
	@install -p -m 644 -t "$(LIBDIR)/mlton" \
	  src/mlton/gcharvecveclib.o \
	  $(MLTONOFILES)
	@mkdir -p "$(INCLUDEDIR)"
	@mkdir -p "$(INCLUDEDIR)/mlton"
	@install -p -m 644 -t "$(INCLUDEDIR)/mlton" \
	  src/mlton/gcharptrffi.h \
	  src/mlton/gcharptrptrffi.h

install-polyml :
	@mkdir -p "$(LIBDIR)"
	@mkdir -p "$(LIBDIR)/polyml"
	@install -p -m 755 -t "$(LIBDIR)/polyml" \
	  $(POLYMLSOFILES)

install-sml :
	@mkdir -p "$(LIBDIR)"
	@mkdir -p "$(LIBDIR)/sml"
	@install -p -m 644 -t "$(LIBDIR)/sml" src/sml/polyml.sml
	@for d in ffi general ${SMLLIBS} ;\
	 do \
	   mkdir -p "$(LIBDIR)/sml/$${d}" ;\
	   install -p -m 644 -t "$(LIBDIR)/sml/$${d}" src/sml/$${d}/*.sml src/sml/$${d}/*.mlb ;\
	   mkdir -p "$(LIBDIR)/sml/$${d}/mlton" "$(LIBDIR)/sml/$${d}/polyml" ;\
	   install -p -m 644 -t "$(LIBDIR)/sml/$${d}/mlton" src/sml/$${d}/mlton/*.sml ;\
	   install -p -m 644 -t "$(LIBDIR)/sml/$${d}/polyml" src/sml/$${d}/polyml/*.sml ;\
	 done

install : install-mlton install-polyml install-sml



################################################################################
# Cleaning
#

.PHONY : clean distclean

clean :
	rm -f $(POLYMLOFILES)

distclean : clean
	rm -f src/mlton/gcharvecveclib.o
	rm -f $(MLTONOFILES)
	rm -f $(POLYMLSOFILES)
	rm -f config.mk

endif
