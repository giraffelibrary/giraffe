# Giraffe Library release Makefile
#
# Copyright (C) 2015 Phil Clayton <phil.clayton@veonix.com>
#
# This file is part of the Giraffe Library runtime.  For your rights to use
# this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
# or visit <http://www.giraffelibrary.org/licence-runtime.html>.


ifndef VERSION

$(error environment variable VERSION not set)
endif


.PHONY : default

default : help



################################################################################
# Make options
#

.PHONY : help

help :
	@echo
	@echo "Makefile usage:"
	@echo "  make -f release.mk build      - generate release files"
	@echo "  make -f release.mk archive    - create giraffe-$(VERSION).tar.gz"
	@echo "  make -f release.mk clean      - remove generated files"
	@echo "  make -f release.mk help       - show these make options"
	@echo



################################################################################
# Build

IN_FILES := $(wildcard *.in)
OUT_FILES := $(IN_FILES:.in=)

SEDCMD := \
sed -n -e " \
s/@GIRAFFE_VERSION@/$(VERSION)/g ; \
p \
"

$(OUT_FILES) : % : %.in
	@cat $< | $(SEDCMD) > $@

build : $(OUT_FILES)



################################################################################
# Archive

RELEASE_FILES := \
	CHANGES \
	configure \
	COPYING \
	doc/layout.txt \
	INSTALL \
	LICENCE.RUNTIME \
	Makefile \
	README \
	src/mlton/*.[hc] \
	src/polyml/*.[hc] \
	src/sml

EXCLUDED_RELEASE_FILES := \
	src/polyml/giraffe-girepository* \
	src/sml/girepository-2.0

giraffe-$(VERSION).tar.gz : $(OUT_FILES)
	tar -czf giraffe-$(VERSION).tar.gz \
	  --owner=root --group=root \
	  --transform="s|^.*$$|giraffe-$(VERSION)/&|" \
	  $(EXCLUDED_RELEASE_FILES:%=--exclude=%) \
	  $(RELEASE_FILES)

archive : build giraffe-$(VERSION).tar.gz



################################################################################
# Clean


clean :
	rm -f $(OUT_FILES)
	rm -f giraffe-$(VERSION).tar.gz
