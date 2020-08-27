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
#include "giraffe-glib-2.0.h"
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
  return ((SourceCallback) data) ();
}

gboolean
giraffe_g_source_func_dispatch_async (gpointer data)
{
  return ((SourceCallback) data) ();
}

void
giraffe_g_source_func_destroy (gpointer data)
{
  return;  /* memory leaked */
}


/* GChildWatchFunc */

void
giraffe_g_child_watch_func_dispatch (GPid pid, gint status, gpointer data)
{
  ((ChildWatchCallback) data) (pid, status);
}

void
giraffe_g_child_watch_func_dispatch_async (GPid pid, gint status, gpointer data)
{
  ((ChildWatchCallback) data) (pid, status);
}

void
giraffe_g_child_watch_func_destroy (gpointer data)
{
  return;  /* memory leaked */
}


/* GIOFunc */

gboolean
giraffe_g_i_o_func_dispatch (GIOChannel *source,
                             GIOCondition condition,
                             gpointer data)
{
  return ((IOCallback) data) (source, condition);
}

gboolean
giraffe_g_i_o_func_dispatch_async (GIOChannel *source,
                                   GIOCondition condition,
                                   gpointer data)
{
  return ((IOCallback) data) (source, condition);
}

void
giraffe_g_i_o_func_destroy (gpointer data)
{
  return;  /* memory leaked */
}


/* GSpawnChildSetupFunc */

void
giraffe_g_spawn_child_setup_func_dispatch (gpointer data)
{
  ((SpawnChildSetupCallback) data) ();
}

void
giraffe_g_spawn_child_setup_func_dispatch_async (gpointer data)
{
  ((SpawnChildSetupCallback) data) ();
}

void
giraffe_g_spawn_child_setup_func_destroy (gpointer data)
{
  return;  /* memory leaked */
}


/* GLib */

GSource *
giraffe_g_timeout_source_new (guint interval,
                              SourceCallback callback)
{
  GSource *source;
  source = g_timeout_source_new (interval);
  g_source_set_callback (source,
                         giraffe_g_source_func_dispatch,
                         (gpointer) callback,
                         giraffe_g_source_func_destroy);
  return source;
}

GSource *
giraffe_g_idle_source_new (SourceCallback callback)
{
  GSource *source;
  source = g_idle_source_new ();
  g_source_set_callback (source,
                         giraffe_g_source_func_dispatch,
                         (gpointer) callback,
                         giraffe_g_source_func_destroy);
  return source;
}

GSource *
giraffe_g_child_watch_source_new (GPid pid,
                                  ChildWatchCallback callback)
{
  GSource *source;
  source = g_child_watch_source_new (pid);
  g_source_set_callback (source,
                         (GSourceFunc) giraffe_g_child_watch_func_dispatch,
                         (gpointer) callback,
                         giraffe_g_child_watch_func_destroy);
  return source;
}
