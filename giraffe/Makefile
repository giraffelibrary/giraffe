################################################################################
# Target installation directory
#
#            ******************************************************
#            ****  Update for your system before running make  ****
#            ******************************************************
#
# Directory path must not contain whitespace because such a path does not
# appear to work as a value for the MLton option '-mlb-path-var name value'.

INSTALLDIR := /tmp/giraffe



################################################################################
# Make options
#

default :
	@echo
	@echo "Makefile usage:"
	@echo "  make mlton         - build libraries for MLton"
	@echo "  make polyml        - build libraries for Poly/ML"
	@echo "  make install       - install to $(INSTALLDIR)"
	@echo "  make clean         - clean up intermediate files"
	@echo "  make distclean     - clean up all files"
	@echo



################################################################################
# Environment settings
#

#   - MLton

MLTON        := $(shell which mlton 2> /dev/null)
MLTONBIN     := $(patsubst %/,%,$(dir $(MLTON)))
MLTONHOME    := $(patsubst %/,%,$(dir $(MLTONBIN)))
MLTONLIB     := $(MLTONHOME)/lib
MLTONINCLUDE := $(MLTONLIB)/include

define check-mlton
if [ -z $(MLTON) ]; \
then \
  echo "Cannot find MLton installation: 'mlton' not found on path"; \
  exit 1; \
fi; \
echo "Using MLton at $(MLTONHOME)"
endef


#   - Poly/ML

POLYML     := $(shell which poly 2> /dev/null)
POLYMLBIN  := $(patsubst %/,%,$(dir $(POLYML)))
POLYMLHOME := $(patsubst %/,%,$(dir $(POLYMLBIN)))
POLYMLLIB  := $(POLYMLHOME)/lib

define check-poly
if [ -z $(POLYML) ]; \
then \
  echo "Cannot find Poly/ML installation: 'poly' not found on path"; \
  exit 1; \
fi; \
if [ ! -f $(POLYMLLIB)/libpolyml.so ]; \
then \
  echo "Poly/ML installation missing files: $(POLYMLLIB)/libpolyml.so not found"; \
  exit 1; \
fi; \
if [ ! -f $(POLYMLLIB)/libpolymain.a ]; \
then \
  echo "Poly/ML installation missing files: $(POLYMLLIB)/libpolymain.a not found"; \
  exit 1; \
fi; \
echo "Using Poly/ML at $(POLYMLHOME)"
endef



################################################################################
# Building
#

CFLAGS := -DGIRAFFE_DEBUG -ggdb -std=c99 -O2

# pkg-lookup maps a GIR module name (of the form namespace-version) to the
# corresponding package name, given by <package name="..."> in the GIR file, for
# use with pkg-config.  This function will also work with a list of names but
# it is only used with single names below.
define pkg-lookup
$(strip \
  $(if $(findstring glib-2.0,$(1)),glib-2.0) \
  $(if $(findstring gobject-2.0,$(1)),gobject-2.0) \
  $(if $(findstring girepository-2.0,$(1)),gobject-introspection-1.0) \
  $(if $(findstring cairo-1.0,$(1)),cairo) \
  $(if $(findstring pango-1.0,$(1)),pango) \
  $(if $(findstring gdk-3.0,$(1)),gdk-3.0) \
  $(if $(findstring gtk-3.0,$(1)),gtk+-3.0) \
  $(if $(findstring vte-2.90,$(1)),vte-2.90))
endef


#   - MLton

LIBSML := $(PWD)
MLBROOT := $(LIBSML)/auto/mlton.mlb
MLBFILES := $(shell $(MLTON) -mlb-path-var 'GIRAFFE_SML_LIB $(LIBSML)' -stop f $(MLBROOT))

auto/mlton/giraffe.h : $(MLBFILES)
	@$(check-mlton)
	@$(MLTON) \
          -mlb-path-var 'GIRAFFE_SML_LIB $(LIBSML)' \
          -default-ann 'allowFFI true' \
          -default-ann 'resolveScope topdec' \
          -const 'GiraffeDebug.isEnabled false' \
          -export-header $@ \
          -stop tc \
          $(MLBROOT)

ffi/mlton/gcharvecveclib.o : ffi/mlton/gcharvecveclib.c
	@$(CC) $(CFLAGS) -c -o $@ `pkg-config --cflags glib-2.0` $<

MLTONCFLAGS := $(CFLAGS) -iquote "ffi" -iquote "auto"
MLTONLIBS   := \
	giraffe-glib-2.0 \
        giraffe-gobject-2.0 \
        giraffe-gdk-3.0 \
        giraffe-gtk-3.0 \
        giraffe-vte-2.90
MLTONOFILES := $(patsubst %,auto/mlton/%.o,$(MLTONLIBS))

$(MLTONOFILES) : auto/mlton/giraffe-%.o : auto/mlton/giraffe-%.c auto/mlton/giraffe.h ffi/mlton/gcharptrffi.h ffi/mlton/gcharptrptrffi.h
	@$(CC) $(MLTONCFLAGS) -c -I$(MLTONINCLUDE) -o $@ `pkg-config --cflags $(call pkg-lookup,$(patsubst auto/mlton/giraffe-%.c,%,$<))` $<


.PHONY : mlton

mlton : ffi/mlton/gcharvecveclib.o $(MLTONOFILES)


#   - Poly/ML

POLYMLCFLAGS := $(CFLAGS) -fPIC
POLYMLLIBS   := \
	giraffe-glib-2.0 \
        giraffe-gobject-2.0 \
        giraffe-girepository-2.0 \
        giraffe-cairo-1.0 \
        giraffe-pango-1.0 \
        giraffe-gdk-3.0 \
        giraffe-gtk-3.0 \
        giraffe-vte-2.90
POLYMLOFILES  := $(patsubst %,auto/polyml/%.o,$(POLYMLLIBS))
POLYMLSOFILES := $(patsubst %,auto/polyml/lib%.so,$(POLYMLLIBS))

$(POLYMLOFILES) : auto/polyml/giraffe-%.o : auto/polyml/giraffe-%.c
	@$(CC) $(POLYMLCFLAGS) -c -o $@ `pkg-config --cflags $(call pkg-lookup,$(patsubst auto/polyml/giraffe-%.c,%,$<))` $<

$(POLYMLSOFILES) : auto/polyml/libgiraffe-%.so : auto/polyml/giraffe-%.o
	@$(CC) -shared -Wl,-soname,auto/polyml/libgiraffe-glib.so.1 -o $@ `pkg-config --libs-only-l $(call pkg-lookup,$(patsubst auto/polyml/giraffe-%.o,%,$<))` $<


.PHONY : polyml

polyml : $(POLYMLSOFILES)
	@$(check-poly)
	@set -o pipefail; echo " \
let \
in \
  PolyML.Compiler.reportUnreferencedIds := true; \
  PolyML.Compiler.reportExhaustiveHandlers := false; \
  app PolyML.use [\"polyml.sml\"]; \
  OS.Process.exit OS.Process.success : unit \
end \
  handle e => (app print [exnMessage e, \"\n\"]; OS.Process.exit OS.Process.failure) \
" | LD_LIBRARY_PATH=.: $(POLYML) \
  | tee polyml.log \
  | (grep -E -e "^(Warning-|Error-|Exception-)" || true)



################################################################################
# Installation
#

LIBDIR := "$(INSTALLDIR)/lib"
INCLUDEDIR := "$(INSTALLDIR)/include"

.PHONY : install

install :
	@mkdir -p "$(LIBDIR)"
	@mkdir -p "$(LIBDIR)/mlton" "$(LIBDIR)/polyml"
	@install -p -m 644 -t "$(LIBDIR)/mlton" \
	  ffi/mlton/gcharvecveclib.o \
	  $(MLTONOFILES) \
	   || true
	@install -p -m 755 -t "$(LIBDIR)/polyml" \
	  $(POLYMLSOFILES) \
	   || true
	@mkdir -p "$(LIBDIR)/sml"
	@install -p -m 644 -t "$(LIBDIR)/sml" mlton.mlb polyml.sml
	@mkdir -p "$(LIBDIR)/sml/general"
	@install -p -m 644 -t "$(LIBDIR)/sml/general" general/*.sml general/*.mlb
	@mkdir -p "$(LIBDIR)/sml/general/mlton" "$(LIBDIR)/sml/general/polyml"
	@install -p -m 644 -t "$(LIBDIR)/sml/general/mlton" general/mlton/*.sml
	@install -p -m 644 -t "$(LIBDIR)/sml/general/polyml" general/polyml/*.sml
	@mkdir -p "$(LIBDIR)/sml/ffi"
	@install -p -m 644 -t "$(LIBDIR)/sml/ffi" ffi/*.sml ffi/*.mlb
	@mkdir -p "$(LIBDIR)/sml/ffi/mlton" "$(LIBDIR)/sml/ffi/polyml"
	@install -p -m 644 -t "$(LIBDIR)/sml/ffi/mlton" ffi/mlton/*.sml
	@install -p -m 644 -t "$(LIBDIR)/sml/ffi/polyml" ffi/polyml/*.sml
	@mkdir -p "$(LIBDIR)/sml/auto"
	@install -p -m 644 -t "$(LIBDIR)/sml/auto" auto/*.sml auto/*.mlb
	@for f in auto/* ;\
	 do \
	   if [ -d "$${f}" ] ;\
	   then \
	     cp -dpr "$${f}" "$(LIBDIR)/sml/auto" ;\
	   fi ;\
	 done
	@mkdir -p "$(INCLUDEDIR)"
	@mkdir -p "$(INCLUDEDIR)/mlton"
	@install -p -m 644 -t "$(INCLUDEDIR)/mlton" \
	  ffi/mlton/gcharptrffi.h \
	  ffi/mlton/gcharptrptrffi.h \
	  auto/mlton/giraffe.h



################################################################################
# Cleaning
#

.PHONY : clean distclean

clean :
	rm -f polyml.log
	rm -f $(POLYMLOFILES)

distclean : clean
	rm -f ffi/mlton/gcharvecveclib.o
	rm -f auto/mlton/giraffe.h
	rm -f $(MLTONOFILES)
	rm -f $(POLYMLSOFILES)
