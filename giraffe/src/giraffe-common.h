/* Copyright (C) 2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Common C interface support
 */

#define GIRAFFE_DECLARE_VALUE_RECORD(TypeName, type_name) \
TypeName * \
giraffe_##type_name##_new (void) \
{ \
  return g_slice_new (TypeName); \
} \
 \
void \
giraffe_##type_name##_copy (const TypeName *src, TypeName *dest) \
{ \
  memcpy (dest, src, sizeof (TypeName)); \
} \
 \
void \
giraffe_##type_name##_free (TypeName *type_name) \
{ \
  g_slice_free (TypeName, type_name); \
} \
 \
guint \
giraffe_##type_name##_size (void) \
{ \
  return sizeof (TypeName); \
}
