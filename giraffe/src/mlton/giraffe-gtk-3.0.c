/* Copyright (C) 2012, 2016, 2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gtk C interface support for MLton
 */

#include <string.h>
#include <gtk/gtk.h>

#include "giraffe.c"
#include "gtk-3.0/giraffe.c"
#include "giraffe-gtk-3.0-mlton.c"


/* GtkTargetEntry */

void
giraffe_gtk_target_entry_copy (const GtkTargetEntry *src, GtkTargetEntry *dest)
{
  g_return_if_fail (src != NULL);

  dest->target = g_strdup (src->target);
  dest->flags = src->flags;
  dest->info = src->info;
}

void
giraffe_gtk_target_entry_clear (GtkTargetEntry *data)
{
  g_return_if_fail (data != NULL);

  g_free (data->target);
}
