/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
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

#include "polyml/giraffe-glib-2.0.h"


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


/* GTimeVal */

GTimeVal *
giraffe_g_time_val_new (void)
{
  return g_slice_new (GTimeVal);
}

void
giraffe_g_time_val_copy (const GTimeVal *src, GTimeVal *dest)
{
  memcpy (dest, src, sizeof (GTimeVal));
}

void
giraffe_g_time_val_free (GTimeVal *time)
{
  g_slice_free (GTimeVal, time);
}

guint
giraffe_g_time_val_size (void)
{
  return sizeof (GTimeVal);
}


/* GSourceFunc */

gboolean
giraffe_source_dispatch (gpointer data)
{
  return ((SourceCallback) data) ();
}

void
giraffe_source_destroy (gpointer data)
{
  return;
}


/* GChildWatchFunc */

void
giraffe_child_watch_dispatch (GPid pid, gint status, gpointer data)
{
  ((ChildWatchCallback) data) (pid, status);
}

void
giraffe_child_watch_destroy (gpointer data)
{
  return;
}


/* GIOFunc */

gboolean
giraffe_io_dispatch (GIOChannel *source,
                     GIOCondition condition,
                     gpointer data)
{
  return ((IOCallback) data) (source, condition);
}

void
giraffe_io_destroy (gpointer data)
{
  return;
}


/* GSpawnChildSetupFunc */

void
giraffe_spawn_child_setup_dispatch (gpointer data)
{
  ((SpawnChildSetupCallback) data) ();
}


/* GLib */

guint
giraffe_g_timeout_add (gint priority,
                       guint interval,
                       SourceCallback callback)
{
  guint res;
  res = g_timeout_add_full (priority,
                            interval,
                            giraffe_source_dispatch,
                            (gpointer) callback,
                            giraffe_source_destroy);
  return res;
}

guint
giraffe_g_timeout_add_seconds (gint priority,
                               guint interval,
                               SourceCallback callback)
{
  guint res;
  res = g_timeout_add_seconds_full (priority,
                                    interval,
                                    giraffe_source_dispatch,
                                    (gpointer) callback,
                                    giraffe_source_destroy);
  return res;
}

guint
giraffe_g_idle_add (gint priority,
                    SourceCallback callback)
{
  guint res;
  res = g_idle_add_full (priority,
                         giraffe_source_dispatch,
                         (gpointer) callback,
                         giraffe_source_destroy);
  return res;
}

guint
giraffe_g_child_watch_add (gint priority,
                           GPid pid,
                           ChildWatchCallback callback)
{
  guint res;
  res = g_child_watch_add_full (priority,
                                pid,
                                giraffe_child_watch_dispatch,
                                (gpointer) callback,
                                giraffe_child_watch_destroy);
  return res;
}

guint
giraffe_g_io_add_watch (GIOChannel *channel,
                        gint priority,
                        GIOCondition condition,
                        IOCallback callback)
{
  return g_io_add_watch_full (channel,
                              priority,
                              condition,
                              giraffe_io_dispatch,
                              (gpointer) callback,
                              giraffe_io_destroy);
}

GSource *
giraffe_g_timeout_source_new (guint interval,
                              SourceCallback callback)
{
  GSource *source;
  source = g_timeout_source_new (interval);
  g_source_set_callback (source,
                         giraffe_source_dispatch,
                         (gpointer) callback,
                         giraffe_source_destroy);
  return source;
}

GSource *
giraffe_g_idle_source_new (SourceCallback callback)
{
  GSource *source;
  source = g_idle_source_new ();
  g_source_set_callback (source,
                         giraffe_source_dispatch,
                         (gpointer) callback,
                         giraffe_source_destroy);
  return source;
}

GSource *
giraffe_g_child_watch_source_new (GPid pid,
                                  ChildWatchCallback callback)
{
  GSource *source;
  source = g_child_watch_source_new (pid);
  g_source_set_callback (source,
                         (GSourceFunc) giraffe_child_watch_dispatch,
                         (gpointer) callback,
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
giraffe_g_poll_source_new (SourceCallback callback)
{
  GSource *source;
  source = g_source_new (&giraffe_g_poll_funcs, sizeof (GSource));
  g_source_set_callback (source,
                         giraffe_source_dispatch,
                         (gpointer) callback,
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

gboolean
giraffe_g_spawn_async_with_pipes (const gchar *working_directory,
                                  gchar **argv,
                                  gchar **envp,
                                  gint flags,
                                  SpawnChildSetupCallback child_setup,
                                  GPid *child_pid,
                                  gint *standard_input,
                                  gint *standard_output,
                                  gint *standard_error,
                                  GError **error)
{
  return g_spawn_async_with_pipes (working_directory,
                                   argv,
                                   envp,
                                   flags,
                                   giraffe_spawn_child_setup_dispatch,
                                   child_setup,
                                   child_pid,
                                   standard_input,
                                   standard_output,
                                   standard_error,
                                   error);
}
