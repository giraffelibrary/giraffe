/* Copyright (C) 2012, 2016-2018, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gdk C interface support for MLton
 */

#include <string.h>
#include <gdk/gdk.h>

#ifndef GDK_CHECK_VERSION
#define GDK_CHECK_VERSION(major,minor,micro)                          \
    (GDK_MAJOR_VERSION > (major) ||                                   \
     (GDK_MAJOR_VERSION == (major) && GDK_MINOR_VERSION > (minor)) || \
     (GDK_MAJOR_VERSION == (major) && GDK_MINOR_VERSION == (minor) && \
      GDK_MICRO_VERSION >= (micro)))
#endif

#include "giraffe.c"
#include "gdk-3.0/giraffe.c"
#include "giraffe-gdk-3.0-mlton.c"


/* GdkWindowAttr */

GdkWindowAttr *
giraffe_gdk_window_attr_dup (const GdkWindowAttr *attributes)
{
  return g_slice_dup (GdkWindowAttr, attributes);
}

void
giraffe_gdk_window_attr_free (GdkWindowAttr *attributes)
{
  g_slice_free (GdkWindowAttr, attributes);
}


/* GdkEvent */

GdkEventType
giraffe_gdk_get_event_type (GdkEvent *event)
{
  return event->type;
}
