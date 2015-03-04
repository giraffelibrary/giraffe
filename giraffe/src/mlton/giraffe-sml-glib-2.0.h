/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
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
gint32 giraffe_source_dispatch_smlside (guint id);

extern
void giraffe_source_destroy_smlside (guint id);


/* GChildWatchFunc */

extern
void giraffe_child_watch_dispatch_smlside (GPid pid,
                                           gint status,
                                           guint id);

extern
void giraffe_child_watch_destroy_smlside (guint id);


/* GSpawnChildSetupFunc */

extern
void giraffe_spawn_child_setup_dispatch_smlside (guint id);


/* GIOFunc */

extern
gboolean giraffe_io_dispatch_smlside (GIOChannel *source,
                                      GIOCondition condition,
                                      guint id);

extern
void giraffe_io_destroy_smlside (guint id);
