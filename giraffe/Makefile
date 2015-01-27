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

src/mlton/gcharvecveclib.o : src/mlton/gcharvecveclib.c
	@$(CC) $(CFLAGS) -c -o $@ `pkg-config --cflags glib-2.0` $<

MLTONCFLAGS := $(CFLAGS) -iquote "src"
MLTONLIBS   := \
	giraffe-glib-2.0 \
        giraffe-gobject-2.0 \
        giraffe-pango-1.0 \
        giraffe-gdk-3.0 \
        giraffe-gtk-3.0 \
        giraffe-vte-2.90
MLTONOFILES := $(patsubst %,src/mlton/%.o,$(MLTONLIBS))

$(MLTONOFILES) : src/mlton/giraffe-%.o : src/mlton/giraffe-%.c src/mlton/gcharptrffi.h src/mlton/gcharptrptrffi.h
	@$(CC) $(MLTONCFLAGS) -c -I$(MLTONINCLUDE) -o $@ `pkg-config --cflags $(call pkg-lookup,$(patsubst src/mlton/giraffe-%.c,%,$<))` $<


.PHONY : mlton

mlton : src/mlton/gcharvecveclib.o $(MLTONOFILES)


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
POLYMLOFILES  := $(patsubst %,src/polyml/%.o,$(POLYMLLIBS))
POLYMLSOFILES := $(patsubst %,src/polyml/lib%.so,$(POLYMLLIBS))

$(POLYMLOFILES) : src/polyml/giraffe-%.o : src/polyml/giraffe-%.c
	@$(CC) $(POLYMLCFLAGS) -c -o $@ `pkg-config --cflags $(call pkg-lookup,$(patsubst src/polyml/giraffe-%.c,%,$<))` $<

$(POLYMLSOFILES) : src/polyml/libgiraffe-%.so : src/polyml/giraffe-%.o
	@$(CC) -shared -Wl,-soname,src/polyml/libgiraffe-glib.so.1 -o $@ `pkg-config --libs-only-l $(call pkg-lookup,$(patsubst src/polyml/giraffe-%.o,%,$<))` $<


.PHONY : polyml

polyml : $(POLYMLSOFILES)



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
	  src/mlton/gcharvecveclib.o \
	  $(MLTONOFILES) \
	   || true
	@install -p -m 755 -t "$(LIBDIR)/polyml" \
	  $(POLYMLSOFILES) \
	   || true
	@mkdir -p "$(LIBDIR)/sml"
	@install -p -m 644 -t "$(LIBDIR)/sml" src/sml/polyml.sml
	@for f in src/sml/* ;\
	 do \
	   if [ -d "$${f}" ] ;\
	   then \
	     d=`basename $${f}` ;\
	     mkdir -p "$(LIBDIR)/sml/$${d}" ;\
	     install -p -m 644 -t "$(LIBDIR)/sml/$${d}" src/sml/$${d}/*.sml src/sml/$${d}/*.mlb ;\
	     mkdir -p "$(LIBDIR)/sml/$${d}/mlton" "$(LIBDIR)/sml/$${d}/polyml" ;\
	     install -p -m 644 -t "$(LIBDIR)/sml/$${d}/mlton" src/sml/$${d}/mlton/*.sml ;\
	     install -p -m 644 -t "$(LIBDIR)/sml/$${d}/polyml" src/sml/$${d}/polyml/*.sml ;\
	   fi ;\
	 done
	@mkdir -p "$(INCLUDEDIR)"
	@mkdir -p "$(INCLUDEDIR)/mlton"
	@install -p -m 644 -t "$(INCLUDEDIR)/mlton" \
	  src/mlton/gcharptrffi.h \
	  src/mlton/gcharptrptrffi.h



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
