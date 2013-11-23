/* Giraffe Library                                                            *
 *                                                                            *
 * Cairo GObject C interface support for Poly/ML                              *
 *                                                                            *
 * Giraffe Library is released under the GNU LGPL version 3.                  *
 * See file LICENCE for details.                                              *
 *                                                                            */

#include <glib.h>
#include <cairo/cairo.h>


/* cairo_rectangle_int_t */

cairo_rectangle_int_t *
giraffe_cairo_rectangle_int_t_new (void)
{
  return g_slice_new (cairo_rectangle_int_t);
}

cairo_rectangle_int_t *
giraffe_cairo_rectangle_int_t_copy (const cairo_rectangle_int_t *rect)
{
  return g_slice_dup (cairo_rectangle_int_t, rect);
}

void
giraffe_cairo_rectangle_int_t_free (cairo_rectangle_int_t *rect)
{
  g_slice_free (cairo_rectangle_int_t, rect);
}
