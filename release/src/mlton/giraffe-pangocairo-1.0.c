/* Copyright (C) 2014, 2016, 2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * PangoCairo C interface support for MLton
 */

#include <string.h>
#include <pango/pangocairo.h>

#ifndef PANGO_CHECK_VERSION
#define PANGO_CHECK_VERSION(major,minor,micro)                          \
    (PANGO_MAJOR_VERSION > (major) ||                                   \
     (PANGO_MAJOR_VERSION == (major) && PANGO_MINOR_VERSION > (minor)) || \
     (PANGO_MAJOR_VERSION == (major) && PANGO_MINOR_VERSION == (minor) && \
      PANGO_MICRO_VERSION >= (micro)))
#endif

#include "giraffe.c"
#include "pangocairo-1.0/giraffe.c"
#include "giraffe-pangocairo-1.0-mlton.c"
