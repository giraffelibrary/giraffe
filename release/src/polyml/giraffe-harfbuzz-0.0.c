/* Copyright (C) 2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * HarfBuzz C interface support for Poly/ML
 */

#include <string.h>
#include <glib.h>
#include <hb-ot.h>

#ifndef HB_CHECK_VERSION
#define HB_CHECK_VERSION(major,minor,micro) \
    HB_VERSION_ATLEAST(major,minor,micro)
#endif

#include "giraffe.c"
#include "harfbuzz-0.0/giraffe.c"
