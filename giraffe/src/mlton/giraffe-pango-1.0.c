/* Copyright (C) 2014 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Pango C interface support for MLton
 */

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

PangoFontDescription *
mlton_pango_font_description_from_string (SML_GCHARPTR_VAL(str))
{
  return pango_font_description_from_string (GET_SML_GCHARPTR_VAL(str));
}

void
mlton_pango_font_description_set_family (PangoFontDescription *desc,
                                         SML_GCHARPTR_VAL(family))
{
  pango_font_description_set_family (desc,
                                     GET_SML_GCHARPTR_VAL(family));
}
