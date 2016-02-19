/* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GLib C interface support for MLton
 */

#include <glib.h>

#include "mlton/cvector.h"
#include "mlton/cvectorvector.h"
#include "mlton/giraffe-sml-glib-2.0.h"
#include "mlton/giraffe-glib-2.0.h"


/* GQuark */

GQuark
mlton_g_quark_from_string (SML_CVECTOR_VAL(gchar, string))
{
  return g_quark_from_string (GET_SML_CVECTOR_VAL(gchar, string));
}


/* GLog */

void
mlton_g_log_default_handler (SML_CVECTOR_VAL(gchar, log_domain),
                             GLogLevelFlags log_level,
                             SML_CVECTOR_VAL(gchar, message))
{
  g_log_default_handler (GET_SML_CVECTOR_VAL(gchar, log_domain),
                         log_level,
                         GET_SML_CVECTOR_VAL(gchar, message),
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


/* GTimeVal */

GTimeVal *
giraffe_g_time_val_new (void)
{
  return g_slice_new (GTimeVal);
}

GTimeVal *
giraffe_g_time_val_copy (const GTimeVal *time)
{
  return g_slice_dup (GTimeVal, time);
}

void
giraffe_g_time_val_free (GTimeVal *time)
{
  g_slice_free (GTimeVal, time);
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

guint
giraffe_g_timeout_add (gint priority,
                       guint interval,
                       guint callback_id)
{
  guint res;
  res = g_timeout_add_full (priority,
                            interval,
                            giraffe_source_dispatch,
                            GUINT_TO_POINTER(callback_id),
                            giraffe_source_destroy);
  return res;
}

guint
giraffe_g_timeout_add_seconds (gint priority,
                               guint interval,
                               guint callback_id)
{
  guint res;
  res = g_timeout_add_seconds_full (priority,
                                    interval,
                                    giraffe_source_dispatch,
                                    GUINT_TO_POINTER(callback_id),
                                    giraffe_source_destroy);
  return res;
}

guint
giraffe_g_idle_add (gint priority,
                    guint callback_id)
{
  guint res;
  res = g_idle_add_full (priority,
                         giraffe_source_dispatch,
                         GUINT_TO_POINTER(callback_id),
                         giraffe_source_destroy);
  return res;
}

guint
giraffe_g_child_watch_add (gint priority,
                           GPid pid,
                           guint callback_id)
{
  guint res;
  res = g_child_watch_add_full (priority,
                                pid,
                                giraffe_child_watch_dispatch,
                                GUINT_TO_POINTER(callback_id),
                                giraffe_child_watch_destroy);
  return res;
}

guint
giraffe_g_io_add_watch (GIOChannel *channel,
                        gint priority,
                        GIOCondition condition,
                        guint callback_id)
{
  return g_io_add_watch_full (channel,
                              priority,
                              condition,
                              giraffe_io_dispatch,
                              GUINT_TO_POINTER(callback_id),
                              giraffe_io_destroy);
}

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

gboolean
mlton_g_shell_parse_argv (SML_CVECTOR_VAL(gchar, command_line),
                          gint *argcp,
                          SML_CVECTORVECTOR_REF(gchar, argvp),
                          GError **error)
{
  return g_shell_parse_argv (GET_SML_CVECTOR_VAL(gchar, command_line),
                             argcp,
                             GET_SML_CVECTORVECTOR_REF(gchar, argvp),
                             error);
}

gchar *
mlton_g_shell_quote (SML_CVECTOR_VAL(gchar, unquoted_string))
{
  return g_shell_quote (GET_SML_CVECTOR_VAL(gchar, unquoted_string));
}

gchar *
mlton_g_shell_unquote (SML_CVECTOR_VAL(gchar, quoted_string),
                       GError **error)
{
  return g_shell_unquote (GET_SML_CVECTOR_VAL(gchar, quoted_string),
                          error);
}

gboolean
giraffe_g_spawn_async_with_pipes (SML_CVECTOR_VAL(gchar, working_directory),
                                  SML_CVECTORVECTOR_VAL(gchar, argv),
                                  SML_CVECTORVECTOR_VAL(gchar, envp),
                                  gint flags,
                                  guint callback_id,
                                  GPid *child_pid,
                                  gint *standard_input,
                                  gint *standard_output,
                                  gint *standard_error,
                                  GError **error)
{
  return g_spawn_async_with_pipes (GET_SML_CVECTOR_VAL(gchar, working_directory),
                                   GET_SML_CVECTORVECTOR_VAL(gchar, argv),
                                   GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                                   flags,
                                   giraffe_spawn_child_setup_dispatch,
                                   GUINT_TO_POINTER(callback_id),
                                   child_pid,
                                   standard_input,
                                   standard_output,
                                   standard_error,
                                   error);
}
