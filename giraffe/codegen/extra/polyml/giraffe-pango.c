/* Giraffe Library                                                            *
 *                                                                            *
 * Pango C interface support for Poly/ML                                      *
 *                                                                            *
 * Giraffe Library is released under the GNU LGPL version 3.                  *
 * See file LICENCE for details.                                              *
 *                                                                            */

#include <glib.h>
#include <pango/pango.h>


/* PangoRectangle */

PangoRectangle *
giraffe_pango_rectangle_new (void)
{
  return g_slice_new (PangoRectangle);
}

PangoRectangle *
giraffe_pango_rectangle_copy (const PangoRectangle *rect)
{
  return g_slice_dup (PangoRectangle, rect);
}

void
giraffe_pango_rectangle_free (PangoRectangle *rect)
{
  g_slice_free (PangoRectangle, rect);
}
