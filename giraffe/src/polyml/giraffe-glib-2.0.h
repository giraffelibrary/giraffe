/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GLib C interface support for MLton
 */


/* GSourceFunc */

typedef gboolean (*SourceCallback) (void);

extern
gboolean giraffe_source_dispatch (gpointer data);

extern
void giraffe_source_destroy (gpointer data);


/* GChildWatchFunc */

typedef void (*ChildWatchCallback) (GPid pid,
                                    gint status);

extern
void giraffe_child_watch_dispatch (GPid pid, gint status, gpointer data);

extern
void giraffe_child_watch_destroy (gpointer data);


/* GIOFunc */

typedef gboolean (*IOCallback) (GIOChannel *source,
                                GIOCondition condition);

extern
gboolean giraffe_io_dispatch (GIOChannel *source,
                              GIOCondition condition,
                              gpointer data);

extern
void giraffe_io_destroy (gpointer data);


/* GSpawnChildSetupFunc */

typedef void (*SpawnChildSetupCallback) (void);

extern
void giraffe_spawn_child_setup_dispatch (gpointer data);
