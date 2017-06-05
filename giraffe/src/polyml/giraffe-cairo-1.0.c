/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Cairo GObject C interface support for Poly/ML
 */

#include <string.h>
#include <glib.h>
#include <cairo/cairo.h>


/* cairo_rectangle_int_t */

cairo_rectangle_int_t *
giraffe_cairo_rectangle_int_t_new (void)
{
  return g_slice_new (cairo_rectangle_int_t);
}

void
giraffe_cairo_rectangle_int_t_copy (const cairo_rectangle_int_t *src,
                                          cairo_rectangle_int_t *dest)
{
  memcpy (dest, src, sizeof (cairo_rectangle_int_t));
}

void
giraffe_cairo_rectangle_int_t_free (cairo_rectangle_int_t *rect)
{
  g_slice_free (cairo_rectangle_int_t, rect);
}
