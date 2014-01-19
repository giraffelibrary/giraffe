/* Giraffe Library                                                            *
 *                                                                            *
 * Pango C interface support for MLton                                        *
 *                                                                            *
 * Giraffe Library is released under the GNU LGPL version 3.                  *
 * See file LICENCE for details.                                              *
 *                                                                            */

#include <pango/pango.h>

#include "mlton/gcharptrffi.h"
#include "mlton/gcharptrptrffi.h"


/* PangoLayout */

void
mlton_pango_layout_set_text (PangoLayout *layout,
                             SML_GCHARPTR_VAL(text),
                             int length)
{
  pango_layout_set_text (layout,
                         GET_SML_GCHARPTR_VAL(text),
                         length);
}


/* PangoFontDescription */

void
mlton_pango_font_description_set_family (PangoFontDescription *desc,
                                         SML_GCHARPTR_VAL(family))
{
  pango_font_description_set_family (desc,
                                     GET_SML_GCHARPTR_VAL(family));
}
