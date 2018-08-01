#include "cvector.h"
#include "cvectorvector.h"

GdkPixbuf*
mlton_gdk_pixbuf_new_from_data (SML_CVECTOR_VAL(guchar, data),
                                GdkColorspace colorspace,
                                gboolean has_alpha,
                                int bits_per_sample,
                                int width,
                                int height,
                                int rowstride,
                                GdkPixbufDestroyNotify destroy_fn,
                                gpointer destroy_fn_data)
{
  return gdk_pixbuf_new_from_data (GET_SML_CVECTOR_VAL(guchar, data),
                                   colorspace,
                                   has_alpha,
                                   bits_per_sample,
                                   width,
                                   height,
                                   rowstride,
                                   destroy_fn,
                                   destroy_fn_data);
}

GdkPixbuf*
mlton_gdk_pixbuf_new_from_file (SML_CVECTOR_VAL(const char, filename),
                                GError** error)
{
  return gdk_pixbuf_new_from_file (GET_SML_CVECTOR_VAL(const char, filename),
                                   error);
}

#if GDK_PIXBUF_CHECK_VERSION(2, 6, 0)
GdkPixbuf*
mlton_gdk_pixbuf_new_from_file_at_scale (SML_CVECTOR_VAL(const char, filename),
                                         int width,
                                         int height,
                                         gboolean preserve_aspect_ratio,
                                         GError** error)
{
  return gdk_pixbuf_new_from_file_at_scale (GET_SML_CVECTOR_VAL(const char, filename),
                                            width,
                                            height,
                                            preserve_aspect_ratio,
                                            error);
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 4, 0)
GdkPixbuf*
mlton_gdk_pixbuf_new_from_file_at_size (SML_CVECTOR_VAL(const char, filename),
                                        int width,
                                        int height,
                                        GError** error)
{
  return gdk_pixbuf_new_from_file_at_size (GET_SML_CVECTOR_VAL(const char, filename),
                                           width,
                                           height,
                                           error);
}
#endif

GdkPixbuf*
mlton_gdk_pixbuf_new_from_inline (gint data_length,
                                  SML_CVECTOR_VAL(guint8, data),
                                  gboolean copy_pixels,
                                  GError** error)
{
  return gdk_pixbuf_new_from_inline (data_length,
                                     GET_SML_CVECTOR_VAL(guint8, data),
                                     copy_pixels,
                                     error);
}

#if GDK_PIXBUF_CHECK_VERSION(2, 26, 0)
GdkPixbuf*
mlton_gdk_pixbuf_new_from_resource (SML_CVECTOR_VAL(const char, resource_path),
                                    GError** error)
{
  return gdk_pixbuf_new_from_resource (GET_SML_CVECTOR_VAL(const char, resource_path),
                                       error);
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 26, 0)
GdkPixbuf*
mlton_gdk_pixbuf_new_from_resource_at_scale (SML_CVECTOR_VAL(const char, resource_path),
                                             int width,
                                             int height,
                                             gboolean preserve_aspect_ratio,
                                             GError** error)
{
  return gdk_pixbuf_new_from_resource_at_scale (GET_SML_CVECTOR_VAL(const char, resource_path),
                                                width,
                                                height,
                                                preserve_aspect_ratio,
                                                error);
}
#endif

GdkPixbuf*
mlton_gdk_pixbuf_new_from_xpm_data (SML_CVECTORVECTOR_VAL(char, data))
{
  return gdk_pixbuf_new_from_xpm_data (GET_SML_CVECTORVECTOR_VAL(char, data));
}

#if GDK_PIXBUF_CHECK_VERSION(2, 4, 0)
GdkPixbufFormat*
mlton_gdk_pixbuf_get_file_info (SML_CVECTOR_VAL(const gchar, filename),
                                gint* width,
                                gint* height)
{
  return gdk_pixbuf_get_file_info (GET_SML_CVECTOR_VAL(const gchar, filename),
                                   width,
                                   height);
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 32, 0)
void
mlton_gdk_pixbuf_get_file_info_async (SML_CVECTOR_VAL(const gchar, filename),
                                      GCancellable* cancellable,
                                      GAsyncReadyCallback callback,
                                      gpointer user_data)
{
  gdk_pixbuf_get_file_info_async (GET_SML_CVECTOR_VAL(const gchar, filename),
                                  cancellable,
                                  callback,
                                  user_data);
}
#endif

const gchar*
mlton_gdk_pixbuf_get_option (GdkPixbuf* pixbuf,
                             SML_CVECTOR_VAL(const gchar, key))
{
  return gdk_pixbuf_get_option (pixbuf,
                                GET_SML_CVECTOR_VAL(const gchar, key));
}

#if GDK_PIXBUF_CHECK_VERSION(2, 36, 0)
gboolean
mlton_gdk_pixbuf_remove_option (GdkPixbuf* pixbuf,
                                SML_CVECTOR_VAL(const gchar, key))
{
  return gdk_pixbuf_remove_option (pixbuf,
                                   GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gdk_pixbuf_save_to_bufferv (GdkPixbuf* pixbuf,
                                  SML_CVECTOR_REF(gchar, buffer),
                                  gsize* buffer_size,
                                  SML_CVECTOR_VAL(const char, type),
                                  SML_CVECTORVECTOR_VAL(char, option_keys),
                                  SML_CVECTORVECTOR_VAL(char, option_values),
                                  GError** error)
{
  return gdk_pixbuf_save_to_bufferv (pixbuf,
                                     GET_SML_CVECTOR_REF(gchar, buffer),
                                     buffer_size,
                                     GET_SML_CVECTOR_VAL(const char, type),
                                     GET_SML_CVECTORVECTOR_VAL(char, option_keys),
                                     GET_SML_CVECTORVECTOR_VAL(char, option_values),
                                     error);
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gdk_pixbuf_save_to_callbackv (GdkPixbuf* pixbuf,
                                    GdkPixbufSaveFunc save_func,
                                    gpointer user_data,
                                    SML_CVECTOR_VAL(const char, type),
                                    SML_CVECTORVECTOR_VAL(char, option_keys),
                                    SML_CVECTORVECTOR_VAL(char, option_values),
                                    GError** error)
{
  return gdk_pixbuf_save_to_callbackv (pixbuf,
                                       save_func,
                                       user_data,
                                       GET_SML_CVECTOR_VAL(const char, type),
                                       GET_SML_CVECTORVECTOR_VAL(char, option_keys),
                                       GET_SML_CVECTORVECTOR_VAL(char, option_values),
                                       error);
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 36, 0)
gboolean
mlton_gdk_pixbuf_save_to_streamv (GdkPixbuf* pixbuf,
                                  GOutputStream* stream,
                                  SML_CVECTOR_VAL(const char, type),
                                  SML_CVECTORVECTOR_VAL(char, option_keys),
                                  SML_CVECTORVECTOR_VAL(char, option_values),
                                  GCancellable* cancellable,
                                  GError** error)
{
  return gdk_pixbuf_save_to_streamv (pixbuf,
                                     stream,
                                     GET_SML_CVECTOR_VAL(const char, type),
                                     GET_SML_CVECTORVECTOR_VAL(char, option_keys),
                                     GET_SML_CVECTORVECTOR_VAL(char, option_values),
                                     cancellable,
                                     error);
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 36, 0)
void
mlton_gdk_pixbuf_save_to_streamv_async (GdkPixbuf* pixbuf,
                                        GOutputStream* stream,
                                        SML_CVECTOR_VAL(const gchar, type),
                                        SML_CVECTORVECTOR_VAL(gchar, option_keys),
                                        SML_CVECTORVECTOR_VAL(gchar, option_values),
                                        GCancellable* cancellable,
                                        GAsyncReadyCallback callback,
                                        gpointer user_data)
{
  gdk_pixbuf_save_to_streamv_async (pixbuf,
                                    stream,
                                    GET_SML_CVECTOR_VAL(const gchar, type),
                                    GET_SML_CVECTORVECTOR_VAL(gchar, option_keys),
                                    GET_SML_CVECTORVECTOR_VAL(gchar, option_values),
                                    cancellable,
                                    callback,
                                    user_data);
}
#endif

gboolean
mlton_gdk_pixbuf_savev (GdkPixbuf* pixbuf,
                        SML_CVECTOR_VAL(const char, filename),
                        SML_CVECTOR_VAL(const char, type),
                        SML_CVECTORVECTOR_VAL(char, option_keys),
                        SML_CVECTORVECTOR_VAL(char, option_values),
                        GError** error)
{
  return gdk_pixbuf_savev (pixbuf,
                           GET_SML_CVECTOR_VAL(const char, filename),
                           GET_SML_CVECTOR_VAL(const char, type),
                           GET_SML_CVECTORVECTOR_VAL(char, option_keys),
                           GET_SML_CVECTORVECTOR_VAL(char, option_values),
                           error);
}

#if GDK_PIXBUF_CHECK_VERSION(2, 2, 0)
gboolean
mlton_gdk_pixbuf_set_option (GdkPixbuf* pixbuf,
                             SML_CVECTOR_VAL(const gchar, key),
                             SML_CVECTOR_VAL(const gchar, value))
{
  return gdk_pixbuf_set_option (pixbuf,
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

GdkPixbufAnimation*
mlton_gdk_pixbuf_animation_new_from_file (SML_CVECTOR_VAL(const char, filename),
                                          GError** error)
{
  return gdk_pixbuf_animation_new_from_file (GET_SML_CVECTOR_VAL(const char, filename),
                                             error);
}

#if GDK_PIXBUF_CHECK_VERSION(2, 28, 0)
GdkPixbufAnimation*
mlton_gdk_pixbuf_animation_new_from_resource (SML_CVECTOR_VAL(const char, resource_path),
                                              GError** error)
{
  return gdk_pixbuf_animation_new_from_resource (GET_SML_CVECTOR_VAL(const char, resource_path),
                                                 error);
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 36, 0)
gboolean
mlton_gdk_pixbuf_format_is_save_option_supported (GdkPixbufFormat* format,
                                                  SML_CVECTOR_VAL(const gchar, option_key))
{
  return gdk_pixbuf_format_is_save_option_supported (format,
                                                     GET_SML_CVECTOR_VAL(const gchar, option_key));
}
#endif

#if GDK_PIXBUF_CHECK_VERSION(2, 4, 0)
GdkPixbufLoader*
mlton_gdk_pixbuf_loader_new_with_mime_type (SML_CVECTOR_VAL(const char, mime_type),
                                            GError** error)
{
  return gdk_pixbuf_loader_new_with_mime_type (GET_SML_CVECTOR_VAL(const char, mime_type),
                                               error);
}
#endif

GdkPixbufLoader*
mlton_gdk_pixbuf_loader_new_with_type (SML_CVECTOR_VAL(const char, image_type),
                                       GError** error)
{
  return gdk_pixbuf_loader_new_with_type (GET_SML_CVECTOR_VAL(const char, image_type),
                                          error);
}

gboolean
mlton_gdk_pixbuf_loader_write (GdkPixbufLoader* loader,
                               SML_CVECTOR_VAL(guchar, buf),
                               gsize count,
                               GError** error)
{
  return gdk_pixbuf_loader_write (loader,
                                  GET_SML_CVECTOR_VAL(guchar, buf),
                                  count,
                                  error);
}

gboolean
mlton_gdk_pixdata_deserialize (GdkPixdata* pixdata,
                               guint stream_length,
                               SML_CVECTOR_VAL(guint8, stream),
                               GError** error)
{
  return gdk_pixdata_deserialize (pixdata,
                                  stream_length,
                                  GET_SML_CVECTOR_VAL(guint8, stream),
                                  error);
}

GString*
mlton_gdk_pixdata_to_csource (GdkPixdata* pixdata,
                              SML_CVECTOR_VAL(const gchar, name),
                              GdkPixdataDumpType dump_type)
{
  return gdk_pixdata_to_csource (pixdata,
                                 GET_SML_CVECTOR_VAL(const gchar, name),
                                 dump_type);
}
