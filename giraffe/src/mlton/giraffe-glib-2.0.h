/* Copyright (C) 2012, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GLib C interface support for MLton
 */


/* GSourceFunc */

extern
gboolean giraffe_g_source_func_dispatch (gpointer data);

extern
gboolean giraffe_g_source_func_dispatch_async (gpointer data);

extern
void giraffe_g_source_func_destroy (gpointer data);


/* GChildWatchFunc */

extern
void giraffe_g_child_watch_func_dispatch (GPid pid, gint status, gpointer data);

extern
void giraffe_g_child_watch_func_dispatch_async (GPid pid, gint status, gpointer data);

extern
void giraffe_g_child_watch_func_destroy (gpointer data);


/* GIOFunc */

extern
gboolean giraffe_g_i_o_func_dispatch (GIOChannel *source,
                                      GIOCondition condition,
                                      gpointer data);

extern
gboolean giraffe_g_i_o_func_dispatch_async (GIOChannel *source,
                                            GIOCondition condition,
                                            gpointer data);

extern
void giraffe_g_i_o_func_destroy (gpointer data);


/* GSpawnChildSetupFunc */

extern
void giraffe_g_spawn_child_setup_func_dispatch (gpointer data);

extern
void giraffe_g_spawn_child_setup_func_dispatch_async (gpointer data);

extern
void giraffe_g_spawn_child_setup_func_destroy (gpointer data);
