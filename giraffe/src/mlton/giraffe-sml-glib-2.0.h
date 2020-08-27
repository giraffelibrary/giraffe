/* Copyright (C) 2012, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GLib SML interface exported by MLton
 */

/* GSourceFunc */

extern
gint32 giraffe_g_source_func_dispatch_sml (gpointer data);

extern
gint32 giraffe_g_source_func_dispatch_async_sml (gpointer data);

extern
void giraffe_g_source_func_destroy_sml (gpointer data);


/* GChildWatchFunc */

extern
void giraffe_g_child_watch_func_dispatch_sml (GPid pid,
                                              gint status,
                                              gpointer data);

extern
void giraffe_g_child_watch_func_dispatch_async_sml (GPid pid,
                                                    gint status,
                                                    gpointer data);

extern
void giraffe_g_child_watch_func_destroy_sml (gpointer data);


/* GSpawnChildSetupFunc */

extern
void giraffe_g_spawn_child_setup_func_dispatch_sml (gpointer data);

extern
void giraffe_g_spawn_child_setup_func_dispatch_async_sml (gpointer data);

extern
void giraffe_g_spawn_child_setup_func_destroy_sml (gpointer data);


/* GIOFunc */

extern
gboolean giraffe_g_i_o_func_dispatch_sml (GIOChannel *source,
                                          GIOCondition condition,
                                          gpointer data);

extern
gboolean giraffe_g_i_o_func_dispatch_async_sml (GIOChannel *source,
                                                GIOCondition condition,
                                                gpointer data);

extern
void giraffe_g_i_o_func_destroy_sml (gpointer data);
