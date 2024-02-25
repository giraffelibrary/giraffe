/* Copyright (C) 2012, 2016-2018, 2020, 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GLib C interface support for MLton
 */

#include <string.h>
#include <glib.h>
#include <glib/gstdio.h>

#include "giraffe.c"
#include "glib-2.0/giraffe.c"
#include "giraffe-glib-2.0-mlton.c"


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

void
mlton_g_log (SML_CVECTOR_VAL(gchar, log_domain),
             GLogLevelFlags log_level,
             SML_CVECTOR_VAL(gchar, format))
{
  giraffe_g_log (GET_SML_CVECTOR_VAL(gchar, log_domain),
                 log_level,
                 GET_SML_CVECTOR_VAL(gchar, format));
}


/* GSource */

GSource *
giraffe_g_child_watch_source_new (GPid pid,
                                  GSourceFunc func,
                                  gpointer data,
                                  GDestroyNotify notify)
{
  GSource *source = g_child_watch_source_new (pid);
  g_source_set_callback (source, func, data, notify);

  return source;
}

GSource *
giraffe_g_idle_source_new (GSourceFunc func,
                           gpointer data,
                           GDestroyNotify notify)
{
  GSource *source = g_idle_source_new ();
  g_source_set_callback (source, func, data, notify);

  return source;
}

GSource *
giraffe_g_timeout_source_new (guint interval,
                              GSourceFunc func,
                              gpointer data,
                              GDestroyNotify notify)
{
  GSource *source = g_timeout_source_new (interval);
  g_source_set_callback (source, func, data, notify);

  return source;
}

GSource *
giraffe_g_timeout_source_new_seconds (guint interval,
                                      GSourceFunc func,
                                      gpointer data,
                                      GDestroyNotify notify)
{
  GSource *source = g_timeout_source_new_seconds (interval);
  g_source_set_callback (source, func, data, notify);

  return source;
}
