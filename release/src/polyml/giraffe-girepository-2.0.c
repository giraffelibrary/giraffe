/* Copyright (C) 2014 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GObject Introspection C interface support for Poly/ML
 */

#include <gobject-introspection-1.0/girepository.h>


/* GIArgument */

GIArgument *
giraffe_gi_argument_new ()
{
  return g_slice_new (GIArgument);
}

void
giraffe_gi_argument_free (GIArgument *value)
{
  g_slice_free (GIArgument, value);
}

gboolean
giraffe_gi_argument_from_boolean (GIArgument *value)
{
  return value->v_boolean;
}

gint8
giraffe_gi_argument_from_int8 (GIArgument *value)
{
  return value->v_int8;
}

guint8
giraffe_gi_argument_from_uint8 (GIArgument *value)
{
  return value->v_uint8;
}

gint16
giraffe_gi_argument_from_int16 (GIArgument *value)
{
  return value->v_int16;
}

guint16
giraffe_gi_argument_from_uint16 (GIArgument *value)
{
  return value->v_uint16;
}

gint32
giraffe_gi_argument_from_int32 (GIArgument *value)
{
  return value->v_int32;
}

guint32
giraffe_gi_argument_from_uint32 (GIArgument *value)
{
  return value->v_uint32;
}

gint64
giraffe_gi_argument_from_int64 (GIArgument *value)
{
  return value->v_int64;
}

guint64
giraffe_gi_argument_from_uint64 (GIArgument *value)
{
  return value->v_uint64;
}

gfloat
giraffe_gi_argument_from_float (GIArgument *value)
{
  return value->v_float;
}

gdouble
giraffe_gi_argument_from_double (GIArgument *value)
{
  return value->v_double;
}

gchar *
giraffe_gi_argument_from_string (GIArgument *value)
{
  return value->v_string;
}
