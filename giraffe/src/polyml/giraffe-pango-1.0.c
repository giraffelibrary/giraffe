/* Copyright (C) 2014, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Pango C interface support for Poly/ML
 */

#include <string.h>
#include <pango/pango.h>


/* PangoRectangle */

PangoRectangle *
giraffe_pango_rectangle_new (void)
{
  return g_slice_new (PangoRectangle);
}

void
giraffe_pango_rectangle_copy (const PangoRectangle *src, PangoRectangle *dest)
{
  memcpy (dest, src, sizeof (PangoRectangle));
}

void
giraffe_pango_rectangle_free (PangoRectangle *rect)
{
  g_slice_free (PangoRectangle, rect);
}

guint
giraffe_pango_rectangle_size (void)
{
  return sizeof (PangoRectangle);
}


/* PangoLogAttr */

PangoLogAttr *
giraffe_pango_log_attr_new (void)
{
  return g_slice_new (PangoLogAttr);
}

void
giraffe_pango_log_attr_copy (const PangoLogAttr *src, PangoLogAttr *dest)
{
  memcpy (dest, src, sizeof (PangoLogAttr));
}

void
giraffe_pango_log_attr_free (PangoLogAttr *log_attr)
{
  g_slice_free (PangoLogAttr, log_attr);
}

guint
giraffe_pango_log_attr_size (void)
{
  return sizeof (PangoLogAttr);
}
