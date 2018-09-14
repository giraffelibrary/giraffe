/* Copyright (C) 2012, 2016-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GObject C interface support for MLton
 */

#include <string.h>
#include <glib-object.h>

#ifdef GIRAFFE_DEBUG
#include <stdio.h>
gboolean giraffe_debug_closure;
gboolean giraffe_debug_ref_count;
#endif /* GIRAFFE_DEBUG */

#include "giraffe.c"
#include "giraffe-sml-gobject-2.0.h"
#include "gobject-2.0/giraffe.c"
#include "giraffe-gobject-2.0-mlton.c"


/* GType */

gboolean
giraffe_g_type_is_value_type (GType typ)
{
  return G_TYPE_IS_VALUE_TYPE (typ);
}

const char *
giraffe_g_type_name (GType typ)
{
  return g_type_name (typ);
}

GType
giraffe_g_invalid_get_type (void)
{
  return G_TYPE_INVALID;
}

GType
giraffe_g_none_get_type (void)
{
  return G_TYPE_NONE;
}

GType
giraffe_g_interface_get_type (void)
{
  return G_TYPE_INTERFACE;
}

GType
giraffe_g_char_get_type (void)
{
  return G_TYPE_CHAR;
}

GType
giraffe_g_uchar_get_type (void)
{
  return G_TYPE_UCHAR;
}

GType
giraffe_g_boolean_get_type (void)
{
  return G_TYPE_BOOLEAN;
}

GType
giraffe_g_int_get_type (void)
{
  return G_TYPE_INT;
}

GType
giraffe_g_uint_get_type (void)
{
  return G_TYPE_UINT;
}

GType
giraffe_g_long_get_type (void)
{
  return G_TYPE_LONG;
}

GType
giraffe_g_ulong_get_type (void)
{
  return G_TYPE_ULONG;
}

GType
giraffe_g_int64_get_type (void)
{
  return G_TYPE_INT64;
}

GType
giraffe_g_uint64_get_type (void)
{
  return G_TYPE_UINT64;
}

GType
giraffe_g_enum_get_type (void)
{
  return G_TYPE_ENUM;
}

GType
giraffe_g_flags_get_type (void)
{
  return G_TYPE_FLAGS;
}

GType
giraffe_g_float_get_type (void)
{
  return G_TYPE_FLOAT;
}

GType
giraffe_g_double_get_type (void)
{
  return G_TYPE_DOUBLE;
}

GType
giraffe_g_string_get_type (void)
{
  return G_TYPE_STRING;
}

GType
giraffe_g_pointer_get_type (void)
{
  return G_TYPE_POINTER;
}

GType
giraffe_g_boxed_get_type (void)
{
  return G_TYPE_BOXED;
}

GType
giraffe_g_param_get_type (void)
{
  return G_TYPE_PARAM;
}

GType
giraffe_g_object_get_type (void)
{
  return G_TYPE_OBJECT;
}

GType
giraffe_g_variant_get_type (void)
{
  return G_TYPE_VARIANT;
}

GType
giraffe_g_param_char_get_type (void)
{
  return G_TYPE_PARAM_CHAR;
}

GType
giraffe_g_param_uchar_get_type (void)
{
  return G_TYPE_PARAM_UCHAR;
}

GType
giraffe_g_param_boolean_get_type (void)
{
  return G_TYPE_PARAM_BOOLEAN;
}

GType
giraffe_g_param_int_get_type (void)
{
  return G_TYPE_PARAM_INT;
}

GType
giraffe_g_param_uint_get_type (void)
{
  return G_TYPE_PARAM_UINT;
}

GType
giraffe_g_param_long_get_type (void)
{
  return G_TYPE_PARAM_LONG;
}

GType
giraffe_g_param_ulong_get_type (void)
{
  return G_TYPE_PARAM_ULONG;
}

GType
giraffe_g_param_int64_get_type (void)
{
  return G_TYPE_PARAM_INT64;
}

GType
giraffe_g_param_uint64_get_type (void)
{
  return G_TYPE_PARAM_UINT64;
}

GType
giraffe_g_param_unichar_get_type (void)
{
  return G_TYPE_PARAM_UNICHAR;
}

GType
giraffe_g_param_enum_get_type (void)
{
  return G_TYPE_PARAM_ENUM;
}

GType
giraffe_g_param_flags_get_type (void)
{
  return G_TYPE_PARAM_FLAGS;
}

GType
giraffe_g_param_X_get_type (void)
{
  return G_TYPE_PARAM_FLOAT;
}

GType
giraffe_g_param_double_get_type (void)
{
  return G_TYPE_PARAM_DOUBLE;
}

GType
giraffe_g_param_string_get_type (void)
{
  return G_TYPE_PARAM_STRING;
}

GType
giraffe_g_param_param_get_type (void)
{
  return G_TYPE_PARAM_PARAM;
}

GType
giraffe_g_param_boxed_get_type (void)
{
  return G_TYPE_PARAM_BOXED;
}

GType
giraffe_g_param_pointer_get_type (void)
{
  return G_TYPE_PARAM_POINTER;
}

GType
giraffe_g_param_value_array_get_type (void)
{
  return G_TYPE_PARAM_VALUE_ARRAY;
}

GType
giraffe_g_param_object_get_type (void)
{
  return G_TYPE_PARAM_OBJECT;
}

GType
giraffe_g_param_override_get_type (void)
{
  return G_TYPE_PARAM_OVERRIDE;
}

GType
giraffe_g_param_gtype_get_type (void)
{
  return G_TYPE_PARAM_GTYPE;
}

GType
giraffe_g_param_variant_get_type (void)
{
  return G_TYPE_PARAM_VARIANT;
}


/* GValue */

void
giraffe_g_value_copy (const GValue *src, GValue *dest)
{
  g_value_init (dest, G_VALUE_TYPE (src));
  g_value_copy (src, dest);
}

void
giraffe_g_value_clear (GValue *value)
{
  g_value_unset (value);
}

gboolean
giraffe_g_value_holds (GValue *value, GType type)
{
  return G_VALUE_HOLDS (value, type);
}

GType
giraffe_g_value_type (GValue *value)
{
  return G_VALUE_TYPE (value);
}

gboolean
giraffe_g_is_value (GValue *value)
{
  return G_IS_VALUE (value);
}

guint
giraffe_g_value_size ()
{
  return sizeof (GValue);
}


/* GObject */

GType
giraffe_g_object_type (GObject *object)
{
  return G_OBJECT_TYPE (object);
}

GObject *
giraffe_g_object_new_with_properties (GType          object_type,
                                      guint          n_properties,
                                      const char    *names[],
                                      const GValue   values[])
{
  GObject *object;

#ifdef GLIB_VERSION_2_54
  object = g_object_new_with_properties (object_type, n_properties, names, values);
#else
  guint i;

  GParameter parameters[n_properties];
  for (i = 0; i < n_properties; i++)
    {
      parameters[i].name = names[i];
      parameters[i].value = values[i];
    }
  object = g_object_newv (object_type, n_properties, parameters);
#endif

  /* ensure we own a reference */
  if (G_IS_INITIALLY_UNOWNED (object))
    g_object_ref_sink (object);

  return object;
}

#ifdef GIRAFFE_DEBUG
void
giraffe_debug_object_take (gpointer object)
{
  if (giraffe_debug_ref_count)
  {
    printf ("take     %p (type %s)\n", object, G_OBJECT_TYPE_NAME(object));
    fflush (stdout);
  }
}

GObject *
giraffe_debug_g_object_ref_sink (gpointer object)
{
  GObject *ret;
  ret = g_object_ref_sink (object);

  if (giraffe_debug_ref_count)
  {
    printf ("ref+sink %p (type %s)\n", object, G_OBJECT_TYPE_NAME(object));
    fflush (stdout);
  }

  return ret;
}

void
giraffe_debug_g_object_unref (gpointer object)
{
  if (giraffe_debug_ref_count)
  {
    printf ("unref    %p (type %s)\n", object, G_OBJECT_TYPE_NAME(object));
    fflush (stdout);
  }

  g_object_unref (object);
}
#endif /* GIRAFFE_DEBUG */

GObject *
mlton_g_object_new_with_properties (GType object_type,
                                    guint n_properties,
                                    SML_CVECTORVECTOR_VAL(const char, names),
                                    SML_CVECTOR_VAL(GValue, values))
{
  return giraffe_g_object_new_with_properties (object_type,
                                               n_properties,
                                               GET_SML_CVECTORVECTOR_VAL(const char, names),
                                               GET_SML_CVECTOR_VAL(GValue, values));
}


/* ClosureMarshal */

static void
giraffe_closure_dispatch (GClosure *closure,
                          GValue *return_value,
                          guint n_param_values,
                          const GValue *param_values,
                          gpointer invocation_hint,
                          gpointer marshal_data)
{
#ifdef GIRAFFE_DEBUG
  if (giraffe_debug_closure)
  {
    printf ("dispatch closure %p [enter]\n", closure);
    fflush (stdout);
  }
#endif /* GIRAFFE_DEBUG */
  giraffe_closure_dispatch_smlside (GPOINTER_TO_UINT(closure->data),
                                    return_value,
                                    param_values,
                                    n_param_values);
#ifdef GIRAFFE_DEBUG
  if (giraffe_debug_closure)
  {
    printf ("dispatch closure %p [leave]\n", closure);
    fflush (stdout);
  }
#endif /* GIRAFFE_DEBUG */
}

static void
giraffe_closure_destroy (gpointer data,
                         GClosure *closure)
{
#ifdef GIRAFFE_DEBUG
  if (giraffe_debug_closure)
  {
    printf ("destroy closure %p [enter]\n", closure);
    fflush (stdout);
  }
#endif /* GIRAFFE_DEBUG */
  giraffe_closure_destroy_smlside (GPOINTER_TO_UINT(data));
#ifdef GIRAFFE_DEBUG
  if (giraffe_debug_closure)
  {
    printf ("destroy closure %p [leave]\n", closure);
    fflush (stdout);
  }
#endif /* GIRAFFE_DEBUG */
}


/* GClosure */

#ifdef GIRAFFE_DEBUG
void
giraffe_debug_closure_take (GClosure *closure)
{
  if (giraffe_debug_ref_count)
  {
    printf ("take     %p (type %s)\n", closure, g_type_name (G_TYPE_CLOSURE));
    fflush (stdout);
  }
}

GClosure *
giraffe_debug_closure_ref_sink (GClosure *closure)
{
  GClosure *ret;
  ret = g_closure_ref (closure);
  g_closure_sink (closure);

  if (giraffe_debug_ref_count)
  {
    printf ("ref+sink %p (type %s)\n", closure, g_type_name (G_TYPE_CLOSURE));
    fflush (stdout);
  }

  return ret;
}

void
giraffe_debug_g_closure_unref (GClosure *closure)
{
  if (giraffe_debug_ref_count)
  {
    printf ("unref    %p (type %s)\n", closure, g_type_name (G_TYPE_CLOSURE));
    fflush (stdout);
  }

  g_closure_unref (closure);
}
#endif /* GIRAFFE_DEBUG */

GClosure *
giraffe_g_closure_new (guint callback_id)
{
  GClosure *closure;
  closure = g_closure_new_simple (sizeof (GClosure), 
                                  GUINT_TO_POINTER(callback_id));

  g_closure_set_marshal (closure, giraffe_closure_dispatch);

  g_closure_add_finalize_notifier (closure, 
                                   GUINT_TO_POINTER(callback_id), 
                                   giraffe_closure_destroy);

  return closure;
}


/* GSignal */

gulong
giraffe_g_signal_connect_closure (gpointer instance,
                                  const gchar *detailed_signal,
                                  GClosure *closure,
                                  gboolean after)
{
#ifdef GIRAFFE_DEBUG
  if (giraffe_debug_closure)
  {
    printf ("connect%s closure %p \"%s\" instance %p (type %s)\n",
            after ? "-after" : "",
            closure,
            detailed_signal,
            instance,
            G_OBJECT_TYPE_NAME(instance));
    fflush (stdout);
  }
#endif /* GIRAFFE_DEBUG */
  return g_signal_connect_closure (instance,
                                   detailed_signal,
                                   closure,
                                   after);
}

gulong
mlton_g_signal_connect_closure (gpointer instance,
                                SML_CVECTOR_VAL(gchar, detailed_signal),
                                GClosure *closure,
                                gboolean after)
{
  return giraffe_g_signal_connect_closure (instance,
                                           GET_SML_CVECTOR_VAL(gchar, detailed_signal),
                                           closure,
                                           after);
}
