# Giraffe Library Makefile
#
# Copyright (C) 2015-2016, 2020 Phil Clayton <phil.clayton@veonix.com>
#
# This file is part of the Giraffe Library runtime.  For your rights to use
# this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
# or visit <http://www.giraffelibrary.org/licence-runtime.html>.



################################################################################
# Configuration
#

SHELL=/bin/sh

-include config.mk

ifndef SML_LIB_NAMES
$(info Configuration file "config.mk" not found or contents missing.)
$(info )
$(info Run "./configure" first.)
$(info )
$(error No configuration found)
endif

ifndef KERNEL_NAME
KERNEL_NAME = $(shell uname -s)
endif

ifeq ($(KERNEL_NAME),Darwin)
LIB := dylib
else
LIB := so
endif



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

CFLAGS := -DGIRAFFE_DEBUG -DGLIB_DISABLE_DEPRECATION_WARNINGS -fPIC -ggdb -std=c99 -Wall -Wno-deprecated-declarations -Werror -O2


#   - MLton

MLTON_CFLAGS := $(CFLAGS) -iquote "src"
MLTON_OBJ_FILES := $(patsubst %,src/mlton/giraffe-%.o,$(MLTON_LIB_NAMES))
MLTON_LIB_FILES := $(patsubst %,src/mlton/libgiraffe-%.a,$(MLTON_LIB_NAMES))

$(MLTON_OBJ_FILES) : src/mlton/giraffe-%.o : src/mlton/giraffe-%.c src/%/giraffe.c src/mlton/giraffe-%-mlton.c src/mlton/cvector.h src/mlton/cvectorvector.h
	$(CC) $(MLTON_CFLAGS) -c -I$(MLTON_INCLUDEDIR) -o $@ `pkg-config --cflags $(shell cat src/$*/package)` $<

MLTON_AR_FLAGS := rcs

$(MLTON_LIB_FILES) : src/mlton/lib%.a : src/mlton/%.o
	$(AR) $(MLTON_AR_FLAGS) $@ $<


.PHONY : mlton

ifdef MLTON_VERSION
mlton : $(MLTON_LIB_FILES)
else
mlton :
endif


#   - Poly/ML

POLYML_CFLAGS := $(CFLAGS) -iquote "src"
POLYML_OBJ_FILES := $(patsubst %,src/polyml/giraffe-%.o,$(POLYML_LIB_NAMES))
POLYML_LIB_FILES := $(patsubst %,src/polyml/libgiraffe-%.$(LIB),$(POLYML_LIB_NAMES))

$(POLYML_OBJ_FILES) : src/polyml/giraffe-%.o : src/polyml/giraffe-%.c src/%/giraffe.c
	$(CC) $(POLYML_CFLAGS) -c -o $@ `pkg-config --cflags $(shell cat src/$*/package)` $<

$(POLYML_LIB_FILES) : src/polyml/libgiraffe-%.$(LIB) : src/polyml/giraffe-%.o
ifeq ($(KERNEL_NAME),Darwin)
	$(CC) -dynamiclib -Wl,-install_name,"@rpath/libgiraffe-$*.$(LIB)" -o $@ $< `pkg-config --libs $(shell cat src/$*/package)`
else
	$(CC) -shared -Wl,-soname,libgiraffe-$*.$(LIB) -o $@ $< `pkg-config --libs $(shell cat src/$*/package)`
endif


.PHONY : polyml

ifdef POLYML_VERSION
polyml : $(POLYML_LIB_FILES)
else
polyml :
endif



################################################################################
# Installation
#

LIBDIR := $(PREFIX)/lib
INCLUDEDIR := $(PREFIX)/include

.PHONY : install-mlton install-polyml install-sml install

ifdef MLTON_VERSION
install-mlton :
	install -d "$(LIBDIR)"
	install -d "$(LIBDIR)/mlton"
	install -c -p -m 644 \
	 $(MLTON_LIB_FILES) \
	 "$(LIBDIR)/mlton"
	install -d "$(INCLUDEDIR)"
	install -d "$(INCLUDEDIR)/mlton"
	install -c -p -m 644 \
	 src/mlton/cvector.h \
	 src/mlton/cvectorvector.h \
	 "$(INCLUDEDIR)/mlton"
else
install-mlton :
endif

ifdef POLYML_VERSION
install-polyml :
	install -d "$(LIBDIR)"
	install -d "$(LIBDIR)/polyml"
	install -c -p -m 755 $(POLYML_LIB_FILES) "$(LIBDIR)/polyml"
else
install-polyml :
endif

install-sml :
	install -c -p -m 644 config.mk "$(PREFIX)"
	install -d "$(LIBDIR)"
	install -d "$(LIBDIR)/sml"
	install -c -p -m 644 src/polyml.sml "$(LIBDIR)/sml"
	for dir in general ffi gir $(SML_LIB_NAMES) ; \
	do \
	  install -d "$(LIBDIR)/sml/$${dir}" ; \
	  install -c -p -m 644 src/$${dir}/*.sml src/$${dir}/*.mlb "$(LIBDIR)/sml/$${dir}" ; \
	  install -d "$(LIBDIR)/sml/$${dir}/mlton" "$(LIBDIR)/sml/$${dir}/polyml" ; \
	  install -c -p -m 644 src/$${dir}/mlton/*.sml "$(LIBDIR)/sml/$${dir}/mlton" ; \
	  install -c -p -m 644 src/$${dir}/polyml/*.sml "$(LIBDIR)/sml/$${dir}/polyml" ; \
	done
	for dir in $(SML_LIB_NAMES) ; \
	do \
	  install -c -p -m 644 src/$${dir}/package "$(LIBDIR)/sml/$${dir}" ; \
	  [ -e src/$${dir}/version ] \
	   && install -c -p -m 644 src/$${dir}/version "$(LIBDIR)/sml/$${dir}" \
	   || true ; \
	done

install : install-mlton install-polyml install-sml



################################################################################
# Cleaning
#

.PHONY : clean distclean

clean :
	rm -f $(MLTON_OBJ_FILES)
	rm -f $(POLYML_OBJ_FILES)

distclean : clean
	rm -f $(MLTON_LIB_FILES)
	rm -f $(POLYML_LIB_FILES)
	rm -f config.mk
