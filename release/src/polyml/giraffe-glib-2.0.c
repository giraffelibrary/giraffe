/* Copyright (C) 2012, 2017-2018, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GLib C interface support for Poly/ML
 */

#include <string.h>
#include <glib.h>

#include "giraffe.c"
#include "glib-2.0/giraffe.c"


/* GLog */

void
giraffe_g_log (const gchar *log_domain,
               GLogLevelFlags log_level,
               const gchar *format)
{
  g_log (log_domain,
         log_level,
         format,
         NULL);
}
