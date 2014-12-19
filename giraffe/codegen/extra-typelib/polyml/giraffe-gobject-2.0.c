/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GObject C interface support for Poly/ML
 */

#include <glib-object.h>


#ifdef GIRAFFE_DEBUG
#include <stdio.h>
gboolean giraffe_debug_closure;
gboolean giraffe_debug_ref_count;
#endif /* GIRAFFE_DEBUG */


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
giraffe_g_char_get_type (void)
{
  return G_TYPE_CHAR;
}

GType
giraffe_g_string_get_type (void)
{
  return G_TYPE_STRING;
}

GType
giraffe_g_param_get_type (void)
{
  return G_TYPE_PARAM;
}


/* GValue */

GValue *
giraffe_g_value_new (void)
{
  return g_slice_new0 (GValue);  /* clear memory to 0 */
}

GValue *
giraffe_g_value_copy (const GValue *value)
{
  return g_slice_dup (GValue, value);
}

void
giraffe_g_value_free (GValue *value)
{
  g_value_unset (value);
  g_slice_free (GValue, value);
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

GValue *
giraffe_g_value_nth (GValue *args, guint p)
{
  return (&args[p]);
}


/* GObject */

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


/* ClosureMarshal */

typedef void (*ClosureMarshal) (GValue *return_value,
                                const GValue *param_values,
                                guint n_param_value);

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
  ((ClosureMarshal) closure->data) (return_value,
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
giraffe_g_closure_new (ClosureMarshal callback)
{
  GClosure *closure;
  closure = g_closure_new_simple (sizeof (GClosure), 
                                  (gpointer) callback);

  g_closure_set_marshal (closure, giraffe_closure_dispatch);

  g_closure_add_finalize_notifier (closure, 
                                   NULL,
                                   giraffe_closure_destroy);

  return closure;
}


/* GSignal */

#ifdef GIRAFFE_DEBUG
gulong
giraffe_debug_g_signal_connect_closure (gpointer instance,
                                        const gchar *detailed_signal,
                                        GClosure *closure,
                                        gboolean after)
{
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
  return g_signal_connect_closure (instance,
                                   detailed_signal,
                                   closure,
                                   after);
}
#endif /* GIRAFFE_DEBUG */
