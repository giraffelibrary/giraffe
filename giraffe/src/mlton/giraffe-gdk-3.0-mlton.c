/* Copyright (C) 2012, 2016-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gdk C interface support for MLton
 */

#include "cvector.h"
#include "cvectorvector.h"


/* GdkAtom */

GdkAtom
mlton_gdk_atom_intern (SML_CVECTOR_VAL(gchar, atom_name),
                       gboolean only_if_exists)
{
  return gdk_atom_intern (GET_SML_CVECTOR_VAL(gchar, atom_name),
                          only_if_exists);
}


/* GdkColor */

gboolean
mlton_gdk_color_parse (SML_CVECTOR_VAL(gchar, spec),
                       GdkColor *color)
{
  return gdk_color_parse (GET_SML_CVECTOR_VAL(gchar, spec),
                          color);
}


/* GdkRGBA */

gboolean
mlton_gdk_rgba_parse (GdkRGBA *rgba,
                      SML_CVECTOR_VAL(gchar, spec))
{
  return gdk_rgba_parse (rgba,
                         GET_SML_CVECTOR_VAL(gchar, spec));
}
