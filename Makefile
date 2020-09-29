# Giraffe Library release Makefile
#
# Copyright (C) 2015, 2018 Phil Clayton <phil.clayton@veonix.com>
#
# This file is part of the Giraffe Library runtime.  For your rights to use
# this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
# or visit <http://www.giraffelibrary.org/licence-runtime.html>.


ifndef VERSION
$(error environment variable VERSION not set)
endif


TAR=$(shell which gnutar 2> /dev/null || which gtar 2> /dev/null || which tar 2> /dev/null)
ifeq ("$(TAR)","")
$(error cannot find tar program)
endif

RELEASE_DIR := release


.PHONY : default

default : help



################################################################################
# Make options
#

.PHONY : help

help :
	@echo
	@echo "Makefile usage:"
	@echo "  make build         - generate release files"
	@echo "  make archive       - create giraffe-$(VERSION).tar.gz"
	@echo "  make clean         - remove generated files"
	@echo "  make help          - show these make options"
	@echo



################################################################################
# Build

IN_FILES := $(wildcard $(RELEASE_DIR)/*.in)
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

RELEASE_FILES := $(addprefix $(RELEASE_DIR)/,\
	CHANGES \
	configure \
	COPYING \
	INSTALL \
	LICENCE.RUNTIME \
	Makefile \
	README \
	src/*.[hc] \
	src/mlton/*.[hc] \
	src/polyml/*.[hc] \
	src/polyml.sml \
	src/general \
	src/ffi \
	src/gir \
	src/*-*)

EXCLUDED_RELEASE_FILES := $(addprefix $(RELEASE_DIR)/,\
	src/polyml/giraffe-girepository* \
	src/girepository-2.0)

giraffe-$(VERSION).tar.gz : $(OUT_FILES)
	$(TAR) -czf giraffe-$(VERSION).tar.gz \
	  --owner=root --group=root \
	  --transform="s|^$(RELEASE_DIR)|giraffe-$(VERSION)|" \
	  $(EXCLUDED_RELEASE_FILES:%=--exclude=%) \
	  $(RELEASE_FILES)

archive : build giraffe-$(VERSION).tar.gz



################################################################################
# Clean


clean :
	rm -f $(OUT_FILES)
	rm -f giraffe-$(VERSION).tar.gz
