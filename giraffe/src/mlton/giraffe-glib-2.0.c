/* Copyright (C) 2012, 2016-2018 Phil Clayton <phil.clayton@veonix.com>
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

#include "giraffe-common.h"
#include "giraffe-sml-glib-2.0.h"
#include "giraffe-glib-2.0.h"
#include "giraffe-glib-2.0-common.c"
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
giraffe_source_dispatch (gpointer data)
{
  return (gboolean) giraffe_source_dispatch_smlside (GPOINTER_TO_UINT(data));
}

void
giraffe_source_destroy (gpointer data)
{
  giraffe_source_destroy_smlside (GPOINTER_TO_UINT(data));
}


/* GChildWatchFunc */

void
giraffe_child_watch_dispatch (GPid pid, gint status, gpointer data)
{
  giraffe_child_watch_dispatch_smlside (pid, status, GPOINTER_TO_UINT(data));
}

void
giraffe_child_watch_destroy (gpointer data)
{
  giraffe_child_watch_destroy_smlside (GPOINTER_TO_UINT(data));
}


/* GIOFunc */

gboolean
giraffe_io_dispatch (GIOChannel *source,
                     GIOCondition condition,
                     gpointer data)
{
  return giraffe_io_dispatch_smlside (source,
                                      condition,
                                      GPOINTER_TO_UINT(data));
}

void
giraffe_io_destroy (gpointer data)
{
  giraffe_io_destroy_smlside (GPOINTER_TO_UINT(data));
}


/* GSpawnChildSetupFunc */

void
giraffe_spawn_child_setup_dispatch (gpointer data)
{
  giraffe_spawn_child_setup_dispatch_smlside (GPOINTER_TO_UINT(data));
}


/* GLib */

GSource *
giraffe_g_timeout_source_new (guint interval,
                              guint callback_id)
{
  GSource *source;
  source = g_timeout_source_new (interval);
  g_source_set_callback (source,
                         giraffe_source_dispatch,
                         GUINT_TO_POINTER(callback_id),
                         giraffe_source_destroy);
  return source;
}

GSource *
giraffe_g_idle_source_new (guint callback_id)
{
  GSource *source;
  source = g_idle_source_new ();
  g_source_set_callback (source,
                         giraffe_source_dispatch,
                         GUINT_TO_POINTER(callback_id),
                         giraffe_source_destroy);
  return source;
}

GSource *
giraffe_g_child_watch_source_new (GPid pid,
                                  guint callback_id)
{
  GSource *source;
  source = g_child_watch_source_new (pid);
  g_source_set_callback (source,
                         (GSourceFunc) giraffe_child_watch_dispatch,
                         GUINT_TO_POINTER(callback_id),
                         giraffe_child_watch_destroy);
  return source;
}


/* Support for poll sources
 *
 * A new type of source is created specifically for use with poll conditions.
 * The prepare function sets timeout to -1 to wait forever.  The check
 * function returns true iff any bit in revents of the GPollFD struct is set.
 * Poll conditions can be used only with this type of source due to memory
 * management of GPollFD structs, as described below.
 *
 * The poll_fds component of a GSource struct is used to hold the references
 * to the allocated GPollFD structs.  By convention, a GSource owns the
 * GPollFD structures whose references it has: a GPollFD is referenced by
 * exactly one GSource.  This is ensured by the operations that add and
 * remove poll conditions, giraffe_g_source_add_poll and
 * giraffe_g_source_remove_poll, respectively.  When a poll condition is
 * removed, giraffe_g_source_remove_poll frees the GPollFD struct.  When a
 * source is destroyed, any GPollFD structs referenced by the source are freed
 * by giraffe_g_poll_finalize, the poll source finalize function.
 *
 * Note that the use of the source finalize function to free referenced
 * GPollFD structs means that we cannot add poll conditions to sources
 * created by GLib such as timeout, idle and child watch sources, as these do
 * not have a suitable finalize function.  The SML interface ensures that
 * poll conditions are added only to sources constructed with the required
 * finalize function.  There is no obvious solution to enable poll conditions
 * to be added to sources in general.  If required, one approach may be to
 * update the finalize function by inserting a new one that calls the
 * original.
 */

gboolean
giraffe_g_poll_prepare (GSource *source, gint *timeout_)
{
  *timeout_ = -1;
  return FALSE;
}

gboolean
giraffe_g_poll_check (GSource *source)
{
  gboolean result;
  GSList *tmp_list;

  result = FALSE;
  tmp_list = source->poll_fds;
  while (tmp_list && !result)
    {
      if (((GPollFD *) tmp_list->data)->revents)
        result = TRUE;
      else
        tmp_list = tmp_list->next;
    }

  return result;
}

gboolean
giraffe_g_poll_dispatch (GSource    *source,
                  GSourceFunc callback,
                  gpointer    user_data)
{
  if (!callback)
    {
      g_critical ("GIRAFFE error: poll source dispatched without callback");
      return FALSE;
    }

  return callback (user_data);
}

void
giraffe_g_poll_finalize (GSource *source)
{
  GSList *tmp_list;

  tmp_list = source->poll_fds;
  while (tmp_list)
    {
      g_slice_free (GPollFD, tmp_list->data);
      tmp_list = tmp_list->next;
    }
}

GSourceFuncs giraffe_g_poll_funcs =
{
  giraffe_g_poll_prepare,
  giraffe_g_poll_check,
  giraffe_g_poll_dispatch,
  giraffe_g_poll_finalize
};

GSource *
giraffe_g_poll_source_new (guint callback_id)
{
  GSource *source;
  source = g_source_new (&giraffe_g_poll_funcs, sizeof (GSource));
  g_source_set_callback (source,
                         giraffe_source_dispatch,
                         GUINT_TO_POINTER(callback_id),
                         giraffe_source_destroy);
  return source;
}

void
giraffe_g_source_add_poll (GSource *source, gint fd, gint events)
{
  GPollFD *pollfd;

  pollfd = g_slice_new (GPollFD);
  pollfd->fd = fd;
  pollfd->events = (gushort) events;

  g_source_add_poll (source, pollfd);
}
