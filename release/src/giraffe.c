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
gsize \
giraffe_##type_name##_size (void) \
{ \
  return sizeof (TypeName); \
}

#define GIRAFFE_DECLARE_FIELD(TypeName, type_name, field_name) \
gsize \
giraffe_##type_name##_##field_name##_offset (void) \
{ \
  return offsetof(TypeName, field_name); \
}
