/* Copyright (C) 2012, 2016-2018, 2020 Phil Clayton <phil.clayton@veonix.com>
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
#include "giraffe-sml-glib-2.0.h"
#include "giraffe-glib-2.0.h"
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


/* GError */

GQuark
giraffe_get_g_error_domain (GError *error)
{
  return error->domain;
}

gint
giraffe_get_g_error_code (GError *error)
{
  return error->code;
}

gchar *
giraffe_get_g_error_message (GError *error)
{
  return error->message;
}


/* GSourceFunc */

gboolean
giraffe_g_source_func_dispatch (gpointer data)
{
  return (gboolean) giraffe_g_source_func_dispatch_sml (data);
}

gboolean
giraffe_g_source_func_dispatch_async (gpointer data)
{
  return (gboolean) giraffe_g_source_func_dispatch_async_sml (data);
}

void
giraffe_g_source_func_destroy (gpointer data)
{
  giraffe_g_source_func_destroy_sml (data);
}


/* GChildWatchFunc */

void
giraffe_g_child_watch_func_dispatch (GPid pid, gint status, gpointer data)
{
  giraffe_g_child_watch_func_dispatch_sml (pid, status, data);
}

void
giraffe_g_child_watch_func_dispatch_async (GPid pid, gint status, gpointer data)
{
  giraffe_g_child_watch_func_dispatch_async_sml (pid, status, data);
}

void
giraffe_g_child_watch_func_destroy (gpointer data)
{
  giraffe_g_child_watch_func_destroy_sml (data);
}


/* GIOFunc */

gboolean
giraffe_g_i_o_func_dispatch (GIOChannel *source,
                             GIOCondition condition,
                             gpointer data)
{
  return giraffe_g_i_o_func_dispatch_sml (source,
                                          condition,
                                          data);
}

gboolean
giraffe_g_i_o_func_dispatch_async (GIOChannel *source,
                                   GIOCondition condition,
                                   gpointer data)
{
  return giraffe_g_i_o_func_dispatch_async_sml (source,
                                                condition,
                                                data);
}

void
giraffe_g_i_o_func_destroy (gpointer data)
{
  giraffe_g_i_o_func_destroy_sml (data);
}


/* GSpawnChildSetupFunc */

void
giraffe_g_spawn_child_setup_func_dispatch (gpointer data)
{
  giraffe_g_spawn_child_setup_func_dispatch_sml (data);
}

void
giraffe_g_spawn_child_setup_func_dispatch_async (gpointer data)
{
  giraffe_g_spawn_child_setup_func_dispatch_async_sml (data);
}

void
giraffe_g_spawn_child_setup_func_destroy (gpointer data)
{
  giraffe_g_spawn_child_setup_func_destroy_sml (data);
}
