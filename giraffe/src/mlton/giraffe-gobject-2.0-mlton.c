/* Copyright (C) 2012, 2016-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GObject C interface support for MLton
 */

#include "cvector.h"
#include "cvectorvector.h"


/* GValue */

void
mlton_g_value_set_string (GValue *value, SML_CVECTOR_VAL(gchar, v_string))
{
  g_value_set_string (value, GET_SML_CVECTOR_VAL(gchar, v_string));
}


/* GObject */

void
mlton_g_object_get_property (GObject *object,
                             SML_CVECTOR_VAL(gchar, property_name),
                             GValue *value)
{
  g_object_get_property (object, GET_SML_CVECTOR_VAL(gchar, property_name), value);
}

void
mlton_g_object_set_property (GObject *object,
                             SML_CVECTOR_VAL(gchar, property_name),
                             const GValue *value)
{
  g_object_set_property (object, GET_SML_CVECTOR_VAL(gchar, property_name), value);
}
