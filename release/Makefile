# Giraffe Library Makefile
#
# Copyright (C) 2015-2016, 2020-2021 Phil Clayton <phil.clayton@veonix.com>
#
# This file is part of the Giraffe Library runtime.  For your rights to use
# this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
# or visit <http://www.giraffelibrary.org/licence-runtime.html>.



################################################################################
# Configuration
#

SHELL=/bin/sh

SORT := $(shell which gnusort 2> /dev/null || which gsort 2> /dev/null || which sort 2> /dev/null)
ifeq ("$(SORT)","")
$(error cannot find GNU sort utility)
endif

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

default : sml mlton polyml

help :
	@echo
	@echo "Makefile usage:"
	@echo "  make               - build libraries for compilers and variant SML"
	@echo "  make install       - install to $(PREFIX)"
	@echo "  make clean         - remove intermediate files"
	@echo "  make distclean     - remove all generated files"
	@echo



################################################################################
# Building
#

CFLAGS := -DGIRAFFE_DEBUG -DGLIB_DISABLE_DEPRECATION_WARNINGS -fPIC -ggdb -std=c99 -Wall -Wno-deprecated-declarations -Werror -O2


#   - MLton

.PHONY : mlton

ifdef MLTON_VERSION
MLTON_CFLAGS := $(CFLAGS) -iquote "src"
MLTON_OBJ_FILES := $(patsubst %,src/mlton/giraffe-%.o,$(MLTON_LIB_NAMES))
MLTON_LIB_FILES := $(patsubst %,src/mlton/libgiraffe-%.a,$(MLTON_LIB_NAMES))

$(MLTON_OBJ_FILES) : src/mlton/giraffe-%.o : src/mlton/giraffe-%.c src/%/giraffe.c src/mlton/giraffe-%-mlton.c src/mlton/cvector.h src/mlton/cvectorvector.h
	$(CC) $(MLTON_CFLAGS) -c -I$(MLTON_INCLUDEDIR) -o $@ `pkg-config --cflags $(shell cat src/$*/package)` $<

MLTON_AR_FLAGS := rcs

$(MLTON_LIB_FILES) : src/mlton/lib%.a : src/mlton/%.o
	$(AR) $(MLTON_AR_FLAGS) $@ $<

mlton : $(MLTON_LIB_FILES)
else
mlton :
endif


#   - Poly/ML

.PHONY : polyml

ifdef POLYML_VERSION
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

polyml : $(POLYML_LIB_FILES)
else
polyml :
endif


#   - SML: for SML files that have variants, create the SML file by linking to
#           the required variant
#
# `$(call find-ceil,SORT,X,XS)` expands to the ceiling of X in the totally
# ordered set represented by XS or the empty string if X is greater than every
# element in XS.  The ceiling of X in S means the least element in S that is
# greater than or equal to X.  Here, the ordering is defined by SORT.  More
# formally `$(call find-ceil,SORT,X,XS)` expands to `$(word N,$(sort XS)) such
# that `$(word <N-1>,XS)` < X <= `$(word N,XS)` where < and <= are determined
# by SORT: A < B means `$(call SORT,A B)` = `A B` and A <= B means A < B or
# A is the same as B.
#
find-ceil = $(patsubst $(2):%,%,$(filter $(2):%,$(join $(addsuffix :,$(call $(1),$(2) $(3))),$(call $(1),$(3)))))

# `$(call version-sort,XS)` expands to the words in XS in version order with
# duplicates removed, where version order is defined by the command 'sort'
# provided with GNU Coreutils using the option '-V'.
#
empty :=
space := $(empty) $(empty)
version-sort = $(shell printf $(subst $(space),'\n',$(1)) | LC_ALL=C $(SORT) -u -V -)


ifdef MLTON_VERSION
# Use sort just to remove duplicates.
#
MLTON_VARIANT_SRC_FILES := $(sort $(basename $(wildcard src/*/mlton*.mlb.* src/*/mlton/*.sml.*)))

# The symbolic link depends on MLTON_VERSION, not a file, so timestamps can't
# be used to determine whether the link needs to be recreated, so the rules
# to create the symbolic links are always run.
#
.PHONY : $(MLTON_VARIANT_SRC_FILES)

# The available variants are the suffixes of the target.  'find-ceil' is used to
# determine the suffix to link to: it gives the first variant greater than or
# equal to MLTON_VERSION.  One of the targets will always be 'default' and we
# rely on the property of GNU sort that numbers come before letters
# so 'default' is always the last variant when sorted.  As MLton version is
# never a value ordered after 'default', the result of 'find-ceil' is never
# empty.  Note that the leading '.' is not removed from the suffixes, so a
# leading '.' is added to MLTON_VERSION and all arguments to 'find-ceil'
# are prefixed by '.' and, therefore, so is its result.
#
$(MLTON_VARIANT_SRC_FILES) :
	ln -sf $(notdir $@)$(call find-ceil,version-sort,.$(MLTON_VERSION),$(suffix $(wildcard $@.*))) $@

sml-mlton : $(MLTON_VARIANT_SRC_FILES)
else
sml-mlton :
endif


ifdef POLYML_VERSION
# Use sort just to remove duplicates.
#
POLYML_VARIANT_SRC_FILES := $(sort $(basename $(wildcard src/*/polyml*.sml.* src/*/polyml/*.sml.*)))

# The symbolic link depends on POLYML_VERSION, not a file, so timestamps can't
# be used to determine whether the link needs to be recreated, so the rules
# to create the symbolic links are always run.
#
.PHONY : $(POLYML_VARIANT_SRC_FILES)

# The available variants are the suffixes of the target.  Note, therefore, that
# a variant suffix cannot contain a '.' itself.  Therefore, a variant suffix is
# a hierarchical Poly/ML version with '.' replaced by '-'.
#
POLYML_VERSION_SUFFIX := $(subst .,-,$(POLYML_VERSION))

# The available variants are the suffixes of the target.  'find-ceil' is used to
# determine the suffix to link to: it gives the first variant greater than or
# equal to POLYML_VERSION_SUFFIX.  One of the targets will always be 'default'
# and we rely on the property of GNU sort that numbers come before letters
# so 'default' is always the last variant when sorted.  As Poly/ML version is
# never a value ordered after 'default', the result of 'find-ceil' is never
# empty.  Note that the leading '.' is not removed from the suffixes, so a
# leading '.' is added to POLYML_VERSION_SUFFIX and all arguments to 'find-ceil'
# are prefixed by '.' and, therefore, so is its result.
#
$(POLYML_VARIANT_SRC_FILES) :
	ln -sf $(notdir $@)$(call find-ceil,version-sort,.$(POLYML_VERSION_SUFFIX),$(suffix $(wildcard $@.*))) $@

sml-polyml : $(POLYML_VARIANT_SRC_FILES)
else
sml-polyml :
endif


.PHONY : sml

sml : sml-mlton sml-polyml



################################################################################
# Installation
#

LIBDIR := $(PREFIX)/lib
INCLUDEDIR := $(PREFIX)/include

.PHONY : install-mlton install-polyml install-sml install

ifdef MLTON_VERSION
install-mlton :
	install -d "$(DESTDIR)$(LIBDIR)"
	install -d "$(DESTDIR)$(LIBDIR)/mlton"
	install -c -p -m 644 \
	 $(MLTON_LIB_FILES) \
	 "$(DESTDIR)$(LIBDIR)/mlton"
	install -d "$(DESTDIR)$(INCLUDEDIR)"
	install -d "$(DESTDIR)$(INCLUDEDIR)/mlton"
	install -c -p -m 644 \
	 src/mlton/cvector.h \
	 src/mlton/cvectorvector.h \
	 "$(DESTDIR)$(INCLUDEDIR)/mlton"
else
install-mlton :
endif

ifdef POLYML_VERSION
install-polyml :
	install -d "$(DESTDIR)$(LIBDIR)"
	install -d "$(DESTDIR)$(LIBDIR)/polyml"
	install -c -p -m 755 $(POLYML_LIB_FILES) "$(DESTDIR)$(LIBDIR)/polyml"
else
install-polyml :
endif

install-sml :
	install -c -p -m 644 config.mk "$(DESTDIR)$(PREFIX)"
	install -d "$(DESTDIR)$(LIBDIR)"
	install -d "$(DESTDIR)$(LIBDIR)/sml"
ifdef POLYML_VERSION
	install -c -p -m 644 src/polyml.sml "$(DESTDIR)$(LIBDIR)/sml"
endif
	for dir in general ffi gir $(SML_LIB_NAMES) ; \
	do \
	  install -d "$(DESTDIR)$(LIBDIR)/sml/$${dir}" ; \
	  install -c -p -m 644 $$( \
	    for file in src/$${dir}/*.sml src/$${dir}/*.mlb ; \
	    do \
	      case $${file} in \
	        (src/$${dir}/mlton*|src/$${dir}/polyml*) ;; \
	        (*) \
	          if [ -e $${file} ] ; \
	          then \
	            echo $${file} ; \
	          fi ;; \
	      esac ; \
	    done \
	) "$(DESTDIR)$(LIBDIR)/sml/$${dir}" ; \
	done
ifdef MLTON_VERSION
	for dir in general ffi gir $(SML_LIB_NAMES) ; \
	do \
	  install -c -p -m 644 src/$${dir}/mlton*.mlb "$(DESTDIR)$(LIBDIR)/sml/$${dir}" ; \
	  install -d "$(DESTDIR)$(LIBDIR)/sml/$${dir}/mlton" ; \
	  install -c -p -m 644 src/$${dir}/mlton/*.sml "$(DESTDIR)$(LIBDIR)/sml/$${dir}/mlton" ; \
	done
endif
ifdef POLYML_VERSION
	for dir in general ffi gir $(SML_LIB_NAMES) ; \
	do \
	  install -c -p -m 644 src/$${dir}/polyml*.sml "$(DESTDIR)$(LIBDIR)/sml/$${dir}" ; \
	  install -d "$(DESTDIR)$(LIBDIR)/sml/$${dir}/polyml" ; \
	  install -c -p -m 644 src/$${dir}/polyml/*.sml "$(DESTDIR)$(LIBDIR)/sml/$${dir}/polyml" ; \
	done
endif
	for dir in $(EXCLUDED_LIB_NAMES) ; \
	do \
	  install -d "$(DESTDIR)$(LIBDIR)/sml/$${dir}" ; \
	done
ifdef MLTON_VERSION
	for dir in $(EXCLUDED_LIB_NAMES) ; \
	do \
	  install -c -p -m 644 /dev/null "$(DESTDIR)$(LIBDIR)/sml/$${dir}/mlton.mlb" ; \
	done
endif
	for dir in $(SML_LIB_NAMES) ; \
	do \
	  install -c -p -m 644 src/$${dir}/package "$(DESTDIR)$(LIBDIR)/sml/$${dir}" ; \
	  if [ -e src/$${dir}/version ] ; \
	  then \
	    install -c -p -m 644 src/$${dir}/version "$(DESTDIR)$(LIBDIR)/sml/$${dir}" ; \
	  fi ; \
	done

install : install-mlton install-polyml install-sml



################################################################################
# Cleaning
#

.PHONY : clean-mlton clean-polyml clean-sml

clean-mlton :
ifdef MLTON_VERSION
	rm -f $(MLTON_OBJ_FILES)
endif

clean-polyml :
ifdef POLYML_VERSION
	rm -f $(POLYML_OBJ_FILES)
endif

clean-sml :
ifdef MLTON_VERSION
	rm -f $(MLTON_VARIANT_SRC_FILES)
endif
ifdef POLYML_VERSION
	rm -f $(POLYML_VARIANT_SRC_FILES)
endif


.PHONY : distclean-mlton distclean-polyml distclean-sml

distclean-mlton : clean-mlton
ifdef MLTON_VERSION
	rm -f $(MLTON_LIB_FILES)
endif

distclean-polyml : clean-polyml
ifdef POLYML_VERSION
	rm -f $(POLYML_LIB_FILES)
endif

distclean-sml : clean-sml


.PHONY : clean distclean

clean : clean-mlton clean-polyml clean-sml

distclean : distclean-mlton distclean-polyml distclean-sml
	rm -f config.mk
