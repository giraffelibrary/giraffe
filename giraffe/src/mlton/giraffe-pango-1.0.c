/* Copyright (C) 2014, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Pango C interface support for MLton
 */

#include <pango/pango.h>

#include "mlton/cvector.h"
#include "mlton/cvectorvector.h"


/* PangoLayout */

void
mlton_pango_layout_set_text (PangoLayout *layout,
                             SML_CVECTOR_VAL(gchar, text),
                             int length)
{
  pango_layout_set_text (layout,
                         GET_SML_CVECTOR_VAL(gchar, text),
                         length);
}


/* PangoFontDescription */

PangoFontDescription *
mlton_pango_font_description_from_string (SML_CVECTOR_VAL(gchar, str))
{
  return pango_font_description_from_string (GET_SML_CVECTOR_VAL(gchar, str));
}

void
mlton_pango_font_description_set_family (PangoFontDescription *desc,
                                         SML_CVECTOR_VAL(gchar, family))
{
  pango_font_description_set_family (desc,
                                     GET_SML_CVECTOR_VAL(gchar, family));
}
