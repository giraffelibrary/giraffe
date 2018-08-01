#include "cvector.h"
#include "cvectorvector.h"

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_add_application (GBookmarkFile* bookmark,
                                       SML_CVECTOR_VAL(const gchar, uri),
                                       SML_CVECTOR_VAL(const gchar, name),
                                       SML_CVECTOR_VAL(const gchar, exec))
{
  g_bookmark_file_add_application (bookmark,
                                   GET_SML_CVECTOR_VAL(const gchar, uri),
                                   GET_SML_CVECTOR_VAL(const gchar, name),
                                   GET_SML_CVECTOR_VAL(const gchar, exec));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_add_group (GBookmarkFile* bookmark,
                                 SML_CVECTOR_VAL(const gchar, uri),
                                 SML_CVECTOR_VAL(const gchar, group))
{
  g_bookmark_file_add_group (bookmark,
                             GET_SML_CVECTOR_VAL(const gchar, uri),
                             GET_SML_CVECTOR_VAL(const gchar, group));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
time_t
mlton_g_bookmark_file_get_added (GBookmarkFile* bookmark,
                                 SML_CVECTOR_VAL(const gchar, uri),
                                 GError** error)
{
  return g_bookmark_file_get_added (bookmark,
                                    GET_SML_CVECTOR_VAL(const gchar, uri),
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_get_app_info (GBookmarkFile* bookmark,
                                    SML_CVECTOR_VAL(const gchar, uri),
                                    SML_CVECTOR_VAL(const gchar, name),
                                    SML_CVECTOR_REF(gchar, exec),
                                    guint* count,
                                    time_t* stamp,
                                    GError** error)
{
  return g_bookmark_file_get_app_info (bookmark,
                                       GET_SML_CVECTOR_VAL(const gchar, uri),
                                       GET_SML_CVECTOR_VAL(const gchar, name),
                                       GET_SML_CVECTOR_REF(gchar, exec),
                                       count,
                                       stamp,
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gchar**
mlton_g_bookmark_file_get_applications (GBookmarkFile* bookmark,
                                        SML_CVECTOR_VAL(const gchar, uri),
                                        gsize* length,
                                        GError** error)
{
  return g_bookmark_file_get_applications (bookmark,
                                           GET_SML_CVECTOR_VAL(const gchar, uri),
                                           length,
                                           error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gchar*
mlton_g_bookmark_file_get_description (GBookmarkFile* bookmark,
                                       SML_CVECTOR_VAL(const gchar, uri),
                                       GError** error)
{
  return g_bookmark_file_get_description (bookmark,
                                          GET_SML_CVECTOR_VAL(const gchar, uri),
                                          error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gchar**
mlton_g_bookmark_file_get_groups (GBookmarkFile* bookmark,
                                  SML_CVECTOR_VAL(const gchar, uri),
                                  gsize* length,
                                  GError** error)
{
  return g_bookmark_file_get_groups (bookmark,
                                     GET_SML_CVECTOR_VAL(const gchar, uri),
                                     length,
                                     error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_get_icon (GBookmarkFile* bookmark,
                                SML_CVECTOR_VAL(const gchar, uri),
                                SML_CVECTOR_REF(gchar, href),
                                SML_CVECTOR_REF(gchar, mime_type),
                                GError** error)
{
  return g_bookmark_file_get_icon (bookmark,
                                   GET_SML_CVECTOR_VAL(const gchar, uri),
                                   GET_SML_CVECTOR_REF(gchar, href),
                                   GET_SML_CVECTOR_REF(gchar, mime_type),
                                   error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_get_is_private (GBookmarkFile* bookmark,
                                      SML_CVECTOR_VAL(const gchar, uri),
                                      GError** error)
{
  return g_bookmark_file_get_is_private (bookmark,
                                         GET_SML_CVECTOR_VAL(const gchar, uri),
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gchar*
mlton_g_bookmark_file_get_mime_type (GBookmarkFile* bookmark,
                                     SML_CVECTOR_VAL(const gchar, uri),
                                     GError** error)
{
  return g_bookmark_file_get_mime_type (bookmark,
                                        GET_SML_CVECTOR_VAL(const gchar, uri),
                                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
time_t
mlton_g_bookmark_file_get_modified (GBookmarkFile* bookmark,
                                    SML_CVECTOR_VAL(const gchar, uri),
                                    GError** error)
{
  return g_bookmark_file_get_modified (bookmark,
                                       GET_SML_CVECTOR_VAL(const gchar, uri),
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gchar*
mlton_g_bookmark_file_get_title (GBookmarkFile* bookmark,
                                 SML_CVECTOR_VAL(const gchar, uri),
                                 GError** error)
{
  return g_bookmark_file_get_title (bookmark,
                                    GET_SML_CVECTOR_VAL(const gchar, uri),
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
time_t
mlton_g_bookmark_file_get_visited (GBookmarkFile* bookmark,
                                   SML_CVECTOR_VAL(const gchar, uri),
                                   GError** error)
{
  return g_bookmark_file_get_visited (bookmark,
                                      GET_SML_CVECTOR_VAL(const gchar, uri),
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_has_application (GBookmarkFile* bookmark,
                                       SML_CVECTOR_VAL(const gchar, uri),
                                       SML_CVECTOR_VAL(const gchar, name),
                                       GError** error)
{
  return g_bookmark_file_has_application (bookmark,
                                          GET_SML_CVECTOR_VAL(const gchar, uri),
                                          GET_SML_CVECTOR_VAL(const gchar, name),
                                          error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_has_group (GBookmarkFile* bookmark,
                                 SML_CVECTOR_VAL(const gchar, uri),
                                 SML_CVECTOR_VAL(const gchar, group),
                                 GError** error)
{
  return g_bookmark_file_has_group (bookmark,
                                    GET_SML_CVECTOR_VAL(const gchar, uri),
                                    GET_SML_CVECTOR_VAL(const gchar, group),
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_has_item (GBookmarkFile* bookmark,
                                SML_CVECTOR_VAL(const gchar, uri))
{
  return g_bookmark_file_has_item (bookmark,
                                   GET_SML_CVECTOR_VAL(const gchar, uri));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_load_from_data (GBookmarkFile* bookmark,
                                      SML_CVECTOR_VAL(const gchar, data),
                                      gsize length,
                                      GError** error)
{
  return g_bookmark_file_load_from_data (bookmark,
                                         GET_SML_CVECTOR_VAL(const gchar, data),
                                         length,
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_load_from_data_dirs (GBookmarkFile* bookmark,
                                           SML_CVECTOR_VAL(gchar, file),
                                           SML_CVECTOR_VAL(gchar*, full_path),
                                           GError** error)
{
  return g_bookmark_file_load_from_data_dirs (bookmark,
                                              GET_SML_CVECTOR_VAL(gchar, file),
                                              GET_SML_CVECTOR_VAL(gchar*, full_path),
                                              error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_load_from_file (GBookmarkFile* bookmark,
                                      SML_CVECTOR_VAL(gchar, filename),
                                      GError** error)
{
  return g_bookmark_file_load_from_file (bookmark,
                                         GET_SML_CVECTOR_VAL(gchar, filename),
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_move_item (GBookmarkFile* bookmark,
                                 SML_CVECTOR_VAL(const gchar, old_uri),
                                 SML_CVECTOR_VAL(const gchar, new_uri),
                                 GError** error)
{
  return g_bookmark_file_move_item (bookmark,
                                    GET_SML_CVECTOR_VAL(const gchar, old_uri),
                                    GET_SML_CVECTOR_VAL(const gchar, new_uri),
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_remove_application (GBookmarkFile* bookmark,
                                          SML_CVECTOR_VAL(const gchar, uri),
                                          SML_CVECTOR_VAL(const gchar, name),
                                          GError** error)
{
  return g_bookmark_file_remove_application (bookmark,
                                             GET_SML_CVECTOR_VAL(const gchar, uri),
                                             GET_SML_CVECTOR_VAL(const gchar, name),
                                             error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_remove_group (GBookmarkFile* bookmark,
                                    SML_CVECTOR_VAL(const gchar, uri),
                                    SML_CVECTOR_VAL(const gchar, group),
                                    GError** error)
{
  return g_bookmark_file_remove_group (bookmark,
                                       GET_SML_CVECTOR_VAL(const gchar, uri),
                                       GET_SML_CVECTOR_VAL(const gchar, group),
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_remove_item (GBookmarkFile* bookmark,
                                   SML_CVECTOR_VAL(const gchar, uri),
                                   GError** error)
{
  return g_bookmark_file_remove_item (bookmark,
                                      GET_SML_CVECTOR_VAL(const gchar, uri),
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_added (GBookmarkFile* bookmark,
                                 SML_CVECTOR_VAL(const gchar, uri),
                                 time_t added)
{
  g_bookmark_file_set_added (bookmark,
                             GET_SML_CVECTOR_VAL(const gchar, uri),
                             added);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_set_app_info (GBookmarkFile* bookmark,
                                    SML_CVECTOR_VAL(const gchar, uri),
                                    SML_CVECTOR_VAL(const gchar, name),
                                    SML_CVECTOR_VAL(const gchar, exec),
                                    gint count,
                                    time_t stamp,
                                    GError** error)
{
  return g_bookmark_file_set_app_info (bookmark,
                                       GET_SML_CVECTOR_VAL(const gchar, uri),
                                       GET_SML_CVECTOR_VAL(const gchar, name),
                                       GET_SML_CVECTOR_VAL(const gchar, exec),
                                       count,
                                       stamp,
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_description (GBookmarkFile* bookmark,
                                       SML_CVECTOR_VAL(const gchar, uri),
                                       SML_CVECTOR_VAL(const gchar, description))
{
  g_bookmark_file_set_description (bookmark,
                                   GET_SML_CVECTOR_VAL(const gchar, uri),
                                   GET_SML_CVECTOR_VAL(const gchar, description));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_groups (GBookmarkFile* bookmark,
                                  SML_CVECTOR_VAL(const gchar, uri),
                                  SML_CVECTOR_VAL(const gchar*, groups),
                                  gsize length)
{
  g_bookmark_file_set_groups (bookmark,
                              GET_SML_CVECTOR_VAL(const gchar, uri),
                              GET_SML_CVECTOR_VAL(const gchar*, groups),
                              length);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_icon (GBookmarkFile* bookmark,
                                SML_CVECTOR_VAL(const gchar, uri),
                                SML_CVECTOR_VAL(const gchar, href),
                                SML_CVECTOR_VAL(const gchar, mime_type))
{
  g_bookmark_file_set_icon (bookmark,
                            GET_SML_CVECTOR_VAL(const gchar, uri),
                            GET_SML_CVECTOR_VAL(const gchar, href),
                            GET_SML_CVECTOR_VAL(const gchar, mime_type));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_is_private (GBookmarkFile* bookmark,
                                      SML_CVECTOR_VAL(const gchar, uri),
                                      gboolean is_private)
{
  g_bookmark_file_set_is_private (bookmark,
                                  GET_SML_CVECTOR_VAL(const gchar, uri),
                                  is_private);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_mime_type (GBookmarkFile* bookmark,
                                     SML_CVECTOR_VAL(const gchar, uri),
                                     SML_CVECTOR_VAL(const gchar, mime_type))
{
  g_bookmark_file_set_mime_type (bookmark,
                                 GET_SML_CVECTOR_VAL(const gchar, uri),
                                 GET_SML_CVECTOR_VAL(const gchar, mime_type));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_modified (GBookmarkFile* bookmark,
                                    SML_CVECTOR_VAL(const gchar, uri),
                                    time_t modified)
{
  g_bookmark_file_set_modified (bookmark,
                                GET_SML_CVECTOR_VAL(const gchar, uri),
                                modified);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_title (GBookmarkFile* bookmark,
                                 SML_CVECTOR_VAL(const gchar, uri),
                                 SML_CVECTOR_VAL(const gchar, title))
{
  g_bookmark_file_set_title (bookmark,
                             GET_SML_CVECTOR_VAL(const gchar, uri),
                             GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_bookmark_file_set_visited (GBookmarkFile* bookmark,
                                   SML_CVECTOR_VAL(const gchar, uri),
                                   time_t visited)
{
  g_bookmark_file_set_visited (bookmark,
                               GET_SML_CVECTOR_VAL(const gchar, uri),
                               visited);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_bookmark_file_to_file (GBookmarkFile* bookmark,
                               SML_CVECTOR_VAL(gchar, filename),
                               GError** error)
{
  return g_bookmark_file_to_file (bookmark,
                                  GET_SML_CVECTOR_VAL(gchar, filename),
                                  error);
}
#endif

guint8*
mlton_g_byte_array_free (SML_CVECTOR_VAL(GByteArray, array),
                         gboolean free_segment)
{
  return g_byte_array_free (GET_SML_CVECTOR_VAL(GByteArray, array),
                            free_segment);
}

#if GLIB_CHECK_VERSION(2, 32, 0)
GBytes*
mlton_g_byte_array_free_to_bytes (SML_CVECTOR_VAL(GByteArray, array))
{
  return g_byte_array_free_to_bytes (GET_SML_CVECTOR_VAL(GByteArray, array));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GByteArray*
mlton_g_byte_array_new_take (SML_CVECTOR_VAL(guint8, data),
                             gsize len)
{
  return g_byte_array_new_take (GET_SML_CVECTOR_VAL(guint8, data),
                                len);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
void
mlton_g_byte_array_unref (SML_CVECTOR_VAL(GByteArray, array))
{
  g_byte_array_unref (GET_SML_CVECTOR_VAL(GByteArray, array));
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
void
mlton_g_checksum_update (GChecksum* checksum,
                         SML_CVECTOR_VAL(guchar, data),
                         gssize length)
{
  g_checksum_update (checksum,
                     GET_SML_CVECTOR_VAL(guchar, data),
                     length);
}
#endif

void
mlton_g_date_set_parse (GDate* date,
                        SML_CVECTOR_VAL(const gchar, str))
{
  g_date_set_parse (date,
                    GET_SML_CVECTOR_VAL(const gchar, str));
}

gsize
mlton_g_date_strftime (SML_CVECTOR_VAL(gchar, s),
                       gsize slen,
                       SML_CVECTOR_VAL(const gchar, format),
                       const GDate* date)
{
  return g_date_strftime (GET_SML_CVECTOR_VAL(gchar, s),
                          slen,
                          GET_SML_CVECTOR_VAL(const gchar, format),
                          date);
}

#if GLIB_CHECK_VERSION(2, 26, 0)
gchar*
mlton_g_date_time_format (GDateTime* datetime,
                          SML_CVECTOR_VAL(const gchar, format))
{
  return g_date_time_format (datetime,
                             GET_SML_CVECTOR_VAL(const gchar, format));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gchar*
mlton_g_dir_make_tmp (SML_CVECTOR_VAL(gchar, tmpl),
                      GError** error)
{
  return g_dir_make_tmp (GET_SML_CVECTOR_VAL(gchar, tmpl),
                         error);
}
#endif

GError*
mlton_g_error_new_literal (GQuark domain,
                           gint code,
                           SML_CVECTOR_VAL(const gchar, message))
{
  return g_error_new_literal (domain,
                              code,
                              GET_SML_CVECTOR_VAL(const gchar, message));
}

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_hmac_update (GHmac* hmac,
                     SML_CVECTOR_VAL(guchar, data),
                     gssize length)
{
  g_hmac_update (hmac,
                 GET_SML_CVECTOR_VAL(guchar, data),
                 length);
}
#endif

GIOChannel*
mlton_g_io_channel_new_file (SML_CVECTOR_VAL(gchar, filename),
                             SML_CVECTOR_VAL(const gchar, mode),
                             GError** error)
{
  return g_io_channel_new_file (GET_SML_CVECTOR_VAL(gchar, filename),
                                GET_SML_CVECTOR_VAL(const gchar, mode),
                                error);
}

GIOError
mlton_g_io_channel_read (GIOChannel* channel,
                         SML_CVECTOR_VAL(gchar, buf),
                         gsize count,
                         gsize* bytes_read)
{
  return g_io_channel_read (channel,
                            GET_SML_CVECTOR_VAL(gchar, buf),
                            count,
                            bytes_read);
}

GIOStatus
mlton_g_io_channel_read_line (GIOChannel* channel,
                              SML_CVECTOR_REF(gchar, str_return),
                              gsize* length,
                              gsize* terminator_pos,
                              GError** error)
{
  return g_io_channel_read_line (channel,
                                 GET_SML_CVECTOR_REF(gchar, str_return),
                                 length,
                                 terminator_pos,
                                 error);
}

GIOStatus
mlton_g_io_channel_read_to_end (GIOChannel* channel,
                                SML_CVECTOR_REF(gchar, str_return),
                                gsize* length,
                                GError** error)
{
  return g_io_channel_read_to_end (channel,
                                   GET_SML_CVECTOR_REF(gchar, str_return),
                                   length,
                                   error);
}

GIOStatus
mlton_g_io_channel_set_encoding (GIOChannel* channel,
                                 SML_CVECTOR_VAL(const gchar, encoding),
                                 GError** error)
{
  return g_io_channel_set_encoding (channel,
                                    GET_SML_CVECTOR_VAL(const gchar, encoding),
                                    error);
}

void
mlton_g_io_channel_set_line_term (GIOChannel* channel,
                                  SML_CVECTOR_VAL(const gchar, line_term),
                                  gint length)
{
  g_io_channel_set_line_term (channel,
                              GET_SML_CVECTOR_VAL(const gchar, line_term),
                              length);
}

GIOError
mlton_g_io_channel_write (GIOChannel* channel,
                          SML_CVECTOR_VAL(const gchar, buf),
                          gsize count,
                          gsize* bytes_written)
{
  return g_io_channel_write (channel,
                             GET_SML_CVECTOR_VAL(const gchar, buf),
                             count,
                             bytes_written);
}

GIOStatus
mlton_g_io_channel_write_chars (GIOChannel* channel,
                                SML_CVECTOR_VAL(gchar, buf),
                                gssize count,
                                gsize* bytes_written,
                                GError** error)
{
  return g_io_channel_write_chars (channel,
                                   GET_SML_CVECTOR_VAL(gchar, buf),
                                   count,
                                   bytes_written,
                                   error);
}

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_get_boolean (GKeyFile* key_file,
                              SML_CVECTOR_VAL(const gchar, group_name),
                              SML_CVECTOR_VAL(const gchar, key),
                              GError** error)
{
  return g_key_file_get_boolean (key_file,
                                 GET_SML_CVECTOR_VAL(const gchar, group_name),
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean*
mlton_g_key_file_get_boolean_list (GKeyFile* key_file,
                                   SML_CVECTOR_VAL(const gchar, group_name),
                                   SML_CVECTOR_VAL(const gchar, key),
                                   gsize* length,
                                   GError** error)
{
  return g_key_file_get_boolean_list (key_file,
                                      GET_SML_CVECTOR_VAL(const gchar, group_name),
                                      GET_SML_CVECTOR_VAL(const gchar, key),
                                      length,
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar*
mlton_g_key_file_get_comment (GKeyFile* key_file,
                              SML_CVECTOR_VAL(const gchar, group_name),
                              SML_CVECTOR_VAL(const gchar, key),
                              GError** error)
{
  return g_key_file_get_comment (key_file,
                                 GET_SML_CVECTOR_VAL(const gchar, group_name),
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gdouble
mlton_g_key_file_get_double (GKeyFile* key_file,
                             SML_CVECTOR_VAL(const gchar, group_name),
                             SML_CVECTOR_VAL(const gchar, key),
                             GError** error)
{
  return g_key_file_get_double (key_file,
                                GET_SML_CVECTOR_VAL(const gchar, group_name),
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gdouble*
mlton_g_key_file_get_double_list (GKeyFile* key_file,
                                  SML_CVECTOR_VAL(const gchar, group_name),
                                  SML_CVECTOR_VAL(const gchar, key),
                                  gsize* length,
                                  GError** error)
{
  return g_key_file_get_double_list (key_file,
                                     GET_SML_CVECTOR_VAL(const gchar, group_name),
                                     GET_SML_CVECTOR_VAL(const gchar, key),
                                     length,
                                     error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gint64
mlton_g_key_file_get_int64 (GKeyFile* key_file,
                            SML_CVECTOR_VAL(const gchar, group_name),
                            SML_CVECTOR_VAL(const gchar, key),
                            GError** error)
{
  return g_key_file_get_int64 (key_file,
                               GET_SML_CVECTOR_VAL(const gchar, group_name),
                               GET_SML_CVECTOR_VAL(const gchar, key),
                               error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gint
mlton_g_key_file_get_integer (GKeyFile* key_file,
                              SML_CVECTOR_VAL(const gchar, group_name),
                              SML_CVECTOR_VAL(const gchar, key),
                              GError** error)
{
  return g_key_file_get_integer (key_file,
                                 GET_SML_CVECTOR_VAL(const gchar, group_name),
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gint*
mlton_g_key_file_get_integer_list (GKeyFile* key_file,
                                   SML_CVECTOR_VAL(const gchar, group_name),
                                   SML_CVECTOR_VAL(const gchar, key),
                                   gsize* length,
                                   GError** error)
{
  return g_key_file_get_integer_list (key_file,
                                      GET_SML_CVECTOR_VAL(const gchar, group_name),
                                      GET_SML_CVECTOR_VAL(const gchar, key),
                                      length,
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar**
mlton_g_key_file_get_keys (GKeyFile* key_file,
                           SML_CVECTOR_VAL(const gchar, group_name),
                           gsize* length,
                           GError** error)
{
  return g_key_file_get_keys (key_file,
                              GET_SML_CVECTOR_VAL(const gchar, group_name),
                              length,
                              error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar*
mlton_g_key_file_get_locale_string (GKeyFile* key_file,
                                    SML_CVECTOR_VAL(const gchar, group_name),
                                    SML_CVECTOR_VAL(const gchar, key),
                                    SML_CVECTOR_VAL(const gchar, locale),
                                    GError** error)
{
  return g_key_file_get_locale_string (key_file,
                                       GET_SML_CVECTOR_VAL(const gchar, group_name),
                                       GET_SML_CVECTOR_VAL(const gchar, key),
                                       GET_SML_CVECTOR_VAL(const gchar, locale),
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar**
mlton_g_key_file_get_locale_string_list (GKeyFile* key_file,
                                         SML_CVECTOR_VAL(const gchar, group_name),
                                         SML_CVECTOR_VAL(const gchar, key),
                                         SML_CVECTOR_VAL(const gchar, locale),
                                         gsize* length,
                                         GError** error)
{
  return g_key_file_get_locale_string_list (key_file,
                                            GET_SML_CVECTOR_VAL(const gchar, group_name),
                                            GET_SML_CVECTOR_VAL(const gchar, key),
                                            GET_SML_CVECTOR_VAL(const gchar, locale),
                                            length,
                                            error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar*
mlton_g_key_file_get_string (GKeyFile* key_file,
                             SML_CVECTOR_VAL(const gchar, group_name),
                             SML_CVECTOR_VAL(const gchar, key),
                             GError** error)
{
  return g_key_file_get_string (key_file,
                                GET_SML_CVECTOR_VAL(const gchar, group_name),
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar**
mlton_g_key_file_get_string_list (GKeyFile* key_file,
                                  SML_CVECTOR_VAL(const gchar, group_name),
                                  SML_CVECTOR_VAL(const gchar, key),
                                  gsize* length,
                                  GError** error)
{
  return g_key_file_get_string_list (key_file,
                                     GET_SML_CVECTOR_VAL(const gchar, group_name),
                                     GET_SML_CVECTOR_VAL(const gchar, key),
                                     length,
                                     error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
guint64
mlton_g_key_file_get_uint64 (GKeyFile* key_file,
                             SML_CVECTOR_VAL(const gchar, group_name),
                             SML_CVECTOR_VAL(const gchar, key),
                             GError** error)
{
  return g_key_file_get_uint64 (key_file,
                                GET_SML_CVECTOR_VAL(const gchar, group_name),
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar*
mlton_g_key_file_get_value (GKeyFile* key_file,
                            SML_CVECTOR_VAL(const gchar, group_name),
                            SML_CVECTOR_VAL(const gchar, key),
                            GError** error)
{
  return g_key_file_get_value (key_file,
                               GET_SML_CVECTOR_VAL(const gchar, group_name),
                               GET_SML_CVECTOR_VAL(const gchar, key),
                               error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_has_group (GKeyFile* key_file,
                            SML_CVECTOR_VAL(const gchar, group_name))
{
  return g_key_file_has_group (key_file,
                               GET_SML_CVECTOR_VAL(const gchar, group_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_load_from_data (GKeyFile* key_file,
                                 SML_CVECTOR_VAL(const gchar, data),
                                 gsize length,
                                 GKeyFileFlags flags,
                                 GError** error)
{
  return g_key_file_load_from_data (key_file,
                                    GET_SML_CVECTOR_VAL(const gchar, data),
                                    length,
                                    flags,
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_load_from_data_dirs (GKeyFile* key_file,
                                      SML_CVECTOR_VAL(gchar, file),
                                      SML_CVECTOR_REF(gchar, full_path),
                                      GKeyFileFlags flags,
                                      GError** error)
{
  return g_key_file_load_from_data_dirs (key_file,
                                         GET_SML_CVECTOR_VAL(gchar, file),
                                         GET_SML_CVECTOR_REF(gchar, full_path),
                                         flags,
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gboolean
mlton_g_key_file_load_from_dirs (GKeyFile* key_file,
                                 SML_CVECTOR_VAL(gchar, file),
                                 SML_CVECTORVECTOR_VAL(const gchar, search_dirs),
                                 SML_CVECTOR_REF(gchar, full_path),
                                 GKeyFileFlags flags,
                                 GError** error)
{
  return g_key_file_load_from_dirs (key_file,
                                    GET_SML_CVECTOR_VAL(gchar, file),
                                    GET_SML_CVECTORVECTOR_VAL(const gchar, search_dirs),
                                    GET_SML_CVECTOR_REF(gchar, full_path),
                                    flags,
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_load_from_file (GKeyFile* key_file,
                                 SML_CVECTOR_VAL(gchar, file),
                                 GKeyFileFlags flags,
                                 GError** error)
{
  return g_key_file_load_from_file (key_file,
                                    GET_SML_CVECTOR_VAL(gchar, file),
                                    flags,
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_remove_comment (GKeyFile* key_file,
                                 SML_CVECTOR_VAL(const gchar, group_name),
                                 SML_CVECTOR_VAL(const gchar, key),
                                 GError** error)
{
  return g_key_file_remove_comment (key_file,
                                    GET_SML_CVECTOR_VAL(const gchar, group_name),
                                    GET_SML_CVECTOR_VAL(const gchar, key),
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_remove_group (GKeyFile* key_file,
                               SML_CVECTOR_VAL(const gchar, group_name),
                               GError** error)
{
  return g_key_file_remove_group (key_file,
                                  GET_SML_CVECTOR_VAL(const gchar, group_name),
                                  error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_remove_key (GKeyFile* key_file,
                             SML_CVECTOR_VAL(const gchar, group_name),
                             SML_CVECTOR_VAL(const gchar, key),
                             GError** error)
{
  return g_key_file_remove_key (key_file,
                                GET_SML_CVECTOR_VAL(const gchar, group_name),
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gboolean
mlton_g_key_file_save_to_file (GKeyFile* key_file,
                               SML_CVECTOR_VAL(const gchar, filename),
                               GError** error)
{
  return g_key_file_save_to_file (key_file,
                                  GET_SML_CVECTOR_VAL(const gchar, filename),
                                  error);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
void
mlton_g_key_file_set_boolean (GKeyFile* key_file,
                              SML_CVECTOR_VAL(const gchar, group_name),
                              SML_CVECTOR_VAL(const gchar, key),
                              gboolean value)
{
  g_key_file_set_boolean (key_file,
                          GET_SML_CVECTOR_VAL(const gchar, group_name),
                          GET_SML_CVECTOR_VAL(const gchar, key),
                          value);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_key_file_set_comment (GKeyFile* key_file,
                              SML_CVECTOR_VAL(const gchar, group_name),
                              SML_CVECTOR_VAL(const gchar, key),
                              SML_CVECTOR_VAL(const gchar, comment),
                              GError** error)
{
  return g_key_file_set_comment (key_file,
                                 GET_SML_CVECTOR_VAL(const gchar, group_name),
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 GET_SML_CVECTOR_VAL(const gchar, comment),
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_key_file_set_double (GKeyFile* key_file,
                             SML_CVECTOR_VAL(const gchar, group_name),
                             SML_CVECTOR_VAL(const gchar, key),
                             gdouble value)
{
  g_key_file_set_double (key_file,
                         GET_SML_CVECTOR_VAL(const gchar, group_name),
                         GET_SML_CVECTOR_VAL(const gchar, key),
                         value);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_key_file_set_int64 (GKeyFile* key_file,
                            SML_CVECTOR_VAL(const gchar, group_name),
                            SML_CVECTOR_VAL(const gchar, key),
                            gint64 value)
{
  g_key_file_set_int64 (key_file,
                        GET_SML_CVECTOR_VAL(const gchar, group_name),
                        GET_SML_CVECTOR_VAL(const gchar, key),
                        value);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
void
mlton_g_key_file_set_integer (GKeyFile* key_file,
                              SML_CVECTOR_VAL(const gchar, group_name),
                              SML_CVECTOR_VAL(const gchar, key),
                              gint value)
{
  g_key_file_set_integer (key_file,
                          GET_SML_CVECTOR_VAL(const gchar, group_name),
                          GET_SML_CVECTOR_VAL(const gchar, key),
                          value);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
void
mlton_g_key_file_set_locale_string (GKeyFile* key_file,
                                    SML_CVECTOR_VAL(const gchar, group_name),
                                    SML_CVECTOR_VAL(const gchar, key),
                                    SML_CVECTOR_VAL(const gchar, locale),
                                    SML_CVECTOR_VAL(const gchar, string))
{
  g_key_file_set_locale_string (key_file,
                                GET_SML_CVECTOR_VAL(const gchar, group_name),
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                GET_SML_CVECTOR_VAL(const gchar, locale),
                                GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
void
mlton_g_key_file_set_string (GKeyFile* key_file,
                             SML_CVECTOR_VAL(const gchar, group_name),
                             SML_CVECTOR_VAL(const gchar, key),
                             SML_CVECTOR_VAL(const gchar, string))
{
  g_key_file_set_string (key_file,
                         GET_SML_CVECTOR_VAL(const gchar, group_name),
                         GET_SML_CVECTOR_VAL(const gchar, key),
                         GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_key_file_set_uint64 (GKeyFile* key_file,
                             SML_CVECTOR_VAL(const gchar, group_name),
                             SML_CVECTOR_VAL(const gchar, key),
                             guint64 value)
{
  g_key_file_set_uint64 (key_file,
                         GET_SML_CVECTOR_VAL(const gchar, group_name),
                         GET_SML_CVECTOR_VAL(const gchar, key),
                         value);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
void
mlton_g_key_file_set_value (GKeyFile* key_file,
                            SML_CVECTOR_VAL(const gchar, group_name),
                            SML_CVECTOR_VAL(const gchar, key),
                            SML_CVECTOR_VAL(const gchar, value))
{
  g_key_file_set_value (key_file,
                        GET_SML_CVECTOR_VAL(const gchar, group_name),
                        GET_SML_CVECTOR_VAL(const gchar, key),
                        GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

gint
mlton_g_main_context_check (GMainContext* context,
                            gint max_priority,
                            SML_CVECTOR_VAL(GPollFD, fds),
                            gint n_fds)
{
  return g_main_context_check (context,
                               max_priority,
                               GET_SML_CVECTOR_VAL(GPollFD, fds),
                               n_fds);
}

#if GLIB_CHECK_VERSION(2, 8, 0)
GMappedFile*
mlton_g_mapped_file_new (SML_CVECTOR_VAL(gchar, filename),
                         gboolean writable,
                         GError** error)
{
  return g_mapped_file_new (GET_SML_CVECTOR_VAL(gchar, filename),
                            writable,
                            error);
}
#endif

gboolean
mlton_g_markup_parse_context_parse (GMarkupParseContext* context,
                                    SML_CVECTOR_VAL(const gchar, text),
                                    gssize text_len,
                                    GError** error)
{
  return g_markup_parse_context_parse (context,
                                       GET_SML_CVECTOR_VAL(const gchar, text),
                                       text_len,
                                       error);
}

#if GLIB_CHECK_VERSION(2, 14, 0)
gchar*
mlton_g_match_info_expand_references (const GMatchInfo* match_info,
                                      SML_CVECTOR_VAL(const gchar, string_to_expand),
                                      GError** error)
{
  return g_match_info_expand_references (match_info,
                                         GET_SML_CVECTOR_VAL(const gchar, string_to_expand),
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gchar*
mlton_g_match_info_fetch_named (const GMatchInfo* match_info,
                                SML_CVECTOR_VAL(const gchar, name))
{
  return g_match_info_fetch_named (match_info,
                                   GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gboolean
mlton_g_match_info_fetch_named_pos (const GMatchInfo* match_info,
                                    SML_CVECTOR_VAL(const gchar, name),
                                    gint* start_pos,
                                    gint* end_pos)
{
  return g_match_info_fetch_named_pos (match_info,
                                       GET_SML_CVECTOR_VAL(const gchar, name),
                                       start_pos,
                                       end_pos);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
void
mlton_g_option_context_add_main_entries (GOptionContext* context,
                                         const GOptionEntry* entries,
                                         SML_CVECTOR_VAL(const gchar, translation_domain))
{
  g_option_context_add_main_entries (context,
                                     entries,
                                     GET_SML_CVECTOR_VAL(const gchar, translation_domain));
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_option_context_parse (GOptionContext* context,
                              gint* argc,
                              SML_CVECTORVECTOR_REF(gchar, argv),
                              GError** error)
{
  return g_option_context_parse (context,
                                 argc,
                                 GET_SML_CVECTORVECTOR_REF(gchar, argv),
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gboolean
mlton_g_option_context_parse_strv (GOptionContext* context,
                                   SML_CVECTORVECTOR_REF(gchar, arguments),
                                   GError** error)
{
  return g_option_context_parse_strv (context,
                                      GET_SML_CVECTORVECTOR_REF(gchar, arguments),
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_option_context_set_description (GOptionContext* context,
                                        SML_CVECTOR_VAL(const gchar, description))
{
  g_option_context_set_description (context,
                                    GET_SML_CVECTOR_VAL(const gchar, description));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_option_context_set_summary (GOptionContext* context,
                                    SML_CVECTOR_VAL(const gchar, summary))
{
  g_option_context_set_summary (context,
                                GET_SML_CVECTOR_VAL(const gchar, summary));
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
void
mlton_g_option_context_set_translation_domain (GOptionContext* context,
                                               SML_CVECTOR_VAL(const gchar, domain))
{
  g_option_context_set_translation_domain (context,
                                           GET_SML_CVECTOR_VAL(const gchar, domain));
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
GOptionGroup*
mlton_g_option_group_new (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, description),
                          SML_CVECTOR_VAL(const gchar, help_description),
                          gpointer user_data,
                          GDestroyNotify destroy)
{
  return g_option_group_new (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, description),
                             GET_SML_CVECTOR_VAL(const gchar, help_description),
                             user_data,
                             destroy);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
void
mlton_g_option_group_set_translation_domain (GOptionGroup* group,
                                             SML_CVECTOR_VAL(const gchar, domain))
{
  g_option_group_set_translation_domain (group,
                                         GET_SML_CVECTOR_VAL(const gchar, domain));
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
GRegex*
mlton_g_regex_new (SML_CVECTOR_VAL(const gchar, pattern),
                   GRegexCompileFlags compile_options,
                   GRegexMatchFlags match_options,
                   GError** error)
{
  return g_regex_new (GET_SML_CVECTOR_VAL(const gchar, pattern),
                      compile_options,
                      match_options,
                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gint
mlton_g_regex_get_string_number (const GRegex* regex,
                                 SML_CVECTOR_VAL(const gchar, name))
{
  return g_regex_get_string_number (regex,
                                    GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gboolean
mlton_g_regex_match (const GRegex* regex,
                     SML_CVECTOR_VAL(const gchar, string),
                     GRegexMatchFlags match_options,
                     GMatchInfo** match_info)
{
  return g_regex_match (regex,
                        GET_SML_CVECTOR_VAL(const gchar, string),
                        match_options,
                        match_info);
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gboolean
mlton_g_regex_match_all (const GRegex* regex,
                         SML_CVECTOR_VAL(const gchar, string),
                         GRegexMatchFlags match_options,
                         GMatchInfo** match_info)
{
  return g_regex_match_all (regex,
                            GET_SML_CVECTOR_VAL(const gchar, string),
                            match_options,
                            match_info);
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gchar**
mlton_g_regex_split (const GRegex* regex,
                     SML_CVECTOR_VAL(const gchar, string),
                     GRegexMatchFlags match_options)
{
  return g_regex_split (regex,
                        GET_SML_CVECTOR_VAL(const gchar, string),
                        match_options);
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gboolean
mlton_g_regex_check_replacement (SML_CVECTOR_VAL(const gchar, replacement),
                                 gboolean* has_references,
                                 GError** error)
{
  return g_regex_check_replacement (GET_SML_CVECTOR_VAL(const gchar, replacement),
                                    has_references,
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gchar*
mlton_g_regex_escape_nul (SML_CVECTOR_VAL(const gchar, string),
                          gint length)
{
  return g_regex_escape_nul (GET_SML_CVECTOR_VAL(const gchar, string),
                             length);
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gboolean
mlton_g_regex_match_simple (SML_CVECTOR_VAL(const gchar, pattern),
                            SML_CVECTOR_VAL(const gchar, string),
                            GRegexCompileFlags compile_options,
                            GRegexMatchFlags match_options)
{
  return g_regex_match_simple (GET_SML_CVECTOR_VAL(const gchar, pattern),
                               GET_SML_CVECTOR_VAL(const gchar, string),
                               compile_options,
                               match_options);
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
gchar**
mlton_g_regex_split_simple (SML_CVECTOR_VAL(const gchar, pattern),
                            SML_CVECTOR_VAL(const gchar, string),
                            GRegexCompileFlags compile_options,
                            GRegexMatchFlags match_options)
{
  return g_regex_split_simple (GET_SML_CVECTOR_VAL(const gchar, pattern),
                               GET_SML_CVECTOR_VAL(const gchar, string),
                               compile_options,
                               match_options);
}
#endif

void
mlton_g_scanner_input_text (GScanner* scanner,
                            SML_CVECTOR_VAL(const gchar, text),
                            guint text_len)
{
  g_scanner_input_text (scanner,
                        GET_SML_CVECTOR_VAL(const gchar, text),
                        text_len);
}

gpointer
mlton_g_scanner_lookup_symbol (GScanner* scanner,
                               SML_CVECTOR_VAL(const gchar, symbol))
{
  return g_scanner_lookup_symbol (scanner,
                                  GET_SML_CVECTOR_VAL(const gchar, symbol));
}

void
mlton_g_scanner_scope_add_symbol (GScanner* scanner,
                                  guint scope_id,
                                  SML_CVECTOR_VAL(const gchar, symbol),
                                  gpointer value)
{
  g_scanner_scope_add_symbol (scanner,
                              scope_id,
                              GET_SML_CVECTOR_VAL(const gchar, symbol),
                              value);
}

gpointer
mlton_g_scanner_scope_lookup_symbol (GScanner* scanner,
                                     guint scope_id,
                                     SML_CVECTOR_VAL(const gchar, symbol))
{
  return g_scanner_scope_lookup_symbol (scanner,
                                        scope_id,
                                        GET_SML_CVECTOR_VAL(const gchar, symbol));
}

void
mlton_g_scanner_scope_remove_symbol (GScanner* scanner,
                                     guint scope_id,
                                     SML_CVECTOR_VAL(const gchar, symbol))
{
  g_scanner_scope_remove_symbol (scanner,
                                 scope_id,
                                 GET_SML_CVECTOR_VAL(const gchar, symbol));
}

void
mlton_g_scanner_unexp_token (GScanner* scanner,
                             GTokenType expected_token,
                             SML_CVECTOR_VAL(const gchar, identifier_spec),
                             SML_CVECTOR_VAL(const gchar, symbol_spec),
                             SML_CVECTOR_VAL(const gchar, symbol_name),
                             SML_CVECTOR_VAL(const gchar, message),
                             gint is_error)
{
  g_scanner_unexp_token (scanner,
                         expected_token,
                         GET_SML_CVECTOR_VAL(const gchar, identifier_spec),
                         GET_SML_CVECTOR_VAL(const gchar, symbol_spec),
                         GET_SML_CVECTOR_VAL(const gchar, symbol_name),
                         GET_SML_CVECTOR_VAL(const gchar, message),
                         is_error);
}

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_source_set_name (GSource* source,
                         SML_CVECTOR_VAL(const char, name))
{
  g_source_set_name (source,
                     GET_SML_CVECTOR_VAL(const char, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_source_set_name_by_id (guint tag,
                               SML_CVECTOR_VAL(const char, name))
{
  g_source_set_name_by_id (tag,
                           GET_SML_CVECTOR_VAL(const char, name));
}
#endif

GString*
mlton_g_string_append (GString* string,
                       SML_CVECTOR_VAL(const gchar, val))
{
  return g_string_append (string,
                          GET_SML_CVECTOR_VAL(const gchar, val));
}

GString*
mlton_g_string_append_len (GString* string,
                           SML_CVECTOR_VAL(const gchar, val),
                           gssize len)
{
  return g_string_append_len (string,
                              GET_SML_CVECTOR_VAL(const gchar, val),
                              len);
}

#if GLIB_CHECK_VERSION(2, 16, 0)
GString*
mlton_g_string_append_uri_escaped (GString* string,
                                   SML_CVECTOR_VAL(const gchar, unescaped),
                                   SML_CVECTOR_VAL(const gchar, reserved_chars_allowed),
                                   gboolean allow_utf8)
{
  return g_string_append_uri_escaped (string,
                                      GET_SML_CVECTOR_VAL(const gchar, unescaped),
                                      GET_SML_CVECTOR_VAL(const gchar, reserved_chars_allowed),
                                      allow_utf8);
}
#endif

GString*
mlton_g_string_assign (GString* string,
                       SML_CVECTOR_VAL(const gchar, rval))
{
  return g_string_assign (string,
                          GET_SML_CVECTOR_VAL(const gchar, rval));
}

GString*
mlton_g_string_insert (GString* string,
                       gssize pos,
                       SML_CVECTOR_VAL(const gchar, val))
{
  return g_string_insert (string,
                          pos,
                          GET_SML_CVECTOR_VAL(const gchar, val));
}

GString*
mlton_g_string_insert_len (GString* string,
                           gssize pos,
                           SML_CVECTOR_VAL(const gchar, val),
                           gssize len)
{
  return g_string_insert_len (string,
                              pos,
                              GET_SML_CVECTOR_VAL(const gchar, val),
                              len);
}

#if GLIB_CHECK_VERSION(2, 14, 0)
GString*
mlton_g_string_overwrite (GString* string,
                          gsize pos,
                          SML_CVECTOR_VAL(const gchar, val))
{
  return g_string_overwrite (string,
                             pos,
                             GET_SML_CVECTOR_VAL(const gchar, val));
}
#endif

#if GLIB_CHECK_VERSION(2, 14, 0)
GString*
mlton_g_string_overwrite_len (GString* string,
                              gsize pos,
                              SML_CVECTOR_VAL(const gchar, val),
                              gssize len)
{
  return g_string_overwrite_len (string,
                                 pos,
                                 GET_SML_CVECTOR_VAL(const gchar, val),
                                 len);
}
#endif

GString*
mlton_g_string_prepend (GString* string,
                        SML_CVECTOR_VAL(const gchar, val))
{
  return g_string_prepend (string,
                           GET_SML_CVECTOR_VAL(const gchar, val));
}

GString*
mlton_g_string_prepend_len (GString* string,
                            SML_CVECTOR_VAL(const gchar, val),
                            gssize len)
{
  return g_string_prepend_len (string,
                               GET_SML_CVECTOR_VAL(const gchar, val),
                               len);
}

gchar*
mlton_g_string_chunk_insert (GStringChunk* chunk,
                             SML_CVECTOR_VAL(const gchar, string))
{
  return g_string_chunk_insert (chunk,
                                GET_SML_CVECTOR_VAL(const gchar, string));
}

gchar*
mlton_g_string_chunk_insert_const (GStringChunk* chunk,
                                   SML_CVECTOR_VAL(const gchar, string))
{
  return g_string_chunk_insert_const (chunk,
                                      GET_SML_CVECTOR_VAL(const gchar, string));
}

#if GLIB_CHECK_VERSION(2, 4, 0)
gchar*
mlton_g_string_chunk_insert_len (GStringChunk* chunk,
                                 SML_CVECTOR_VAL(const gchar, string),
                                 gssize len)
{
  return g_string_chunk_insert_len (chunk,
                                    GET_SML_CVECTOR_VAL(const gchar, string),
                                    len);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gboolean
mlton_g_time_val_from_iso8601 (SML_CVECTOR_VAL(const gchar, iso_date),
                               GTimeVal* time_)
{
  return g_time_val_from_iso8601 (GET_SML_CVECTOR_VAL(const gchar, iso_date),
                                  time_);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GTimeZone*
mlton_g_time_zone_new (SML_CVECTOR_VAL(const gchar, identifier))
{
  return g_time_zone_new (GET_SML_CVECTOR_VAL(const gchar, identifier));
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GVariant*
mlton_g_variant_new_array (const GVariantType* child_type,
                           SML_CVECTOR_VAL(GVariant*, children),
                           gsize n_children)
{
  return g_variant_new_array (child_type,
                              GET_SML_CVECTOR_VAL(GVariant*, children),
                              n_children);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GVariant*
mlton_g_variant_new_bytestring (SML_CVECTOR_VAL(gchar, string))
{
  return g_variant_new_bytestring (GET_SML_CVECTOR_VAL(gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GVariant*
mlton_g_variant_new_bytestring_array (SML_CVECTORVECTOR_VAL(const gchar, strv),
                                      gssize length)
{
  return g_variant_new_bytestring_array (GET_SML_CVECTORVECTOR_VAL(const gchar, strv),
                                         length);
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GVariant*
mlton_g_variant_new_object_path (SML_CVECTOR_VAL(const gchar, object_path))
{
  return g_variant_new_object_path (GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GVariant*
mlton_g_variant_new_objv (SML_CVECTORVECTOR_VAL(const gchar, strv),
                          gssize length)
{
  return g_variant_new_objv (GET_SML_CVECTORVECTOR_VAL(const gchar, strv),
                             length);
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GVariant*
mlton_g_variant_new_signature (SML_CVECTOR_VAL(const gchar, signature))
{
  return g_variant_new_signature (GET_SML_CVECTOR_VAL(const gchar, signature));
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GVariant*
mlton_g_variant_new_string (SML_CVECTOR_VAL(const gchar, string))
{
  return g_variant_new_string (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GVariant*
mlton_g_variant_new_strv (SML_CVECTORVECTOR_VAL(const gchar, strv),
                          gssize length)
{
  return g_variant_new_strv (GET_SML_CVECTORVECTOR_VAL(const gchar, strv),
                             length);
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GVariant*
mlton_g_variant_new_tuple (SML_CVECTOR_VAL(GVariant*, children),
                           gsize n_children)
{
  return g_variant_new_tuple (GET_SML_CVECTOR_VAL(GVariant*, children),
                              n_children);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
gboolean
mlton_g_variant_check_format_string (GVariant* value,
                                     SML_CVECTOR_VAL(const gchar, format_string),
                                     gboolean copy_only)
{
  return g_variant_check_format_string (value,
                                        GET_SML_CVECTOR_VAL(const gchar, format_string),
                                        copy_only);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GVariant*
mlton_g_variant_lookup_value (GVariant* dictionary,
                              SML_CVECTOR_VAL(const gchar, key),
                              const GVariantType* expected_type)
{
  return g_variant_lookup_value (dictionary,
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 expected_type);
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
gboolean
mlton_g_variant_is_object_path (SML_CVECTOR_VAL(const gchar, string))
{
  return g_variant_is_object_path (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
gboolean
mlton_g_variant_is_signature (SML_CVECTOR_VAL(const gchar, string))
{
  return g_variant_is_signature (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

GVariant*
mlton_g_variant_parse (const GVariantType* type,
                       SML_CVECTOR_VAL(const gchar, text),
                       SML_CVECTOR_VAL(const gchar, limit),
                       SML_CVECTOR_VAL(const gchar*, endptr),
                       GError** error)
{
  return g_variant_parse (type,
                          GET_SML_CVECTOR_VAL(const gchar, text),
                          GET_SML_CVECTOR_VAL(const gchar, limit),
                          GET_SML_CVECTOR_VAL(const gchar*, endptr),
                          error);
}

#if GLIB_CHECK_VERSION(2, 40, 0)
gchar*
mlton_g_variant_parse_error_print_context (GError* error,
                                           SML_CVECTOR_VAL(const gchar, source_str))
{
  return g_variant_parse_error_print_context (error,
                                              GET_SML_CVECTOR_VAL(const gchar, source_str));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gboolean
mlton_g_variant_dict_contains (GVariantDict* dict,
                               SML_CVECTOR_VAL(const gchar, key))
{
  return g_variant_dict_contains (dict,
                                  GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_variant_dict_insert_value (GVariantDict* dict,
                                   SML_CVECTOR_VAL(const gchar, key),
                                   GVariant* value)
{
  g_variant_dict_insert_value (dict,
                               GET_SML_CVECTOR_VAL(const gchar, key),
                               value);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
GVariant*
mlton_g_variant_dict_lookup_value (GVariantDict* dict,
                                   SML_CVECTOR_VAL(const gchar, key),
                                   const GVariantType* expected_type)
{
  return g_variant_dict_lookup_value (dict,
                                      GET_SML_CVECTOR_VAL(const gchar, key),
                                      expected_type);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gboolean
mlton_g_variant_dict_remove (GVariantDict* dict,
                             SML_CVECTOR_VAL(const gchar, key))
{
  return g_variant_dict_remove (dict,
                                GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GVariantType*
mlton_g_variant_type_new (SML_CVECTOR_VAL(const gchar, type_string))
{
  return g_variant_type_new (GET_SML_CVECTOR_VAL(const gchar, type_string));
}
#endif

GVariantType*
mlton_g_variant_type_new_tuple (SML_CVECTOR_VAL(const GVariantType*, items),
                                gint length)
{
  return g_variant_type_new_tuple (GET_SML_CVECTOR_VAL(const GVariantType*, items),
                                   length);
}

const GVariantType*
mlton_g_variant_type_checked_ (SML_CVECTOR_VAL(const gchar, arg0))
{
  return g_variant_type_checked_ (GET_SML_CVECTOR_VAL(const gchar, arg0));
}

gboolean
mlton_g_variant_type_string_is_valid (SML_CVECTOR_VAL(const gchar, type_string))
{
  return g_variant_type_string_is_valid (GET_SML_CVECTOR_VAL(const gchar, type_string));
}

#if GLIB_CHECK_VERSION(2, 24, 0)
gboolean
mlton_g_variant_type_string_scan (SML_CVECTOR_VAL(const gchar, string),
                                  SML_CVECTOR_VAL(const gchar, limit),
                                  SML_CVECTOR_REF(const gchar, endptr))
{
  return g_variant_type_string_scan (GET_SML_CVECTOR_VAL(const gchar, string),
                                     GET_SML_CVECTOR_VAL(const gchar, limit),
                                     GET_SML_CVECTOR_REF(const gchar, endptr));
}
#endif

#if GLIB_CHECK_VERSION(2, 8, 0)
int
mlton_g_access (SML_CVECTOR_VAL(gchar, filename),
                int mode)
{
  return g_access (GET_SML_CVECTOR_VAL(gchar, filename),
                   mode);
}
#endif

gchar*
mlton_g_ascii_dtostr (SML_CVECTOR_VAL(gchar, buffer),
                      gint buf_len,
                      gdouble d)
{
  return g_ascii_dtostr (GET_SML_CVECTOR_VAL(gchar, buffer),
                         buf_len,
                         d);
}

gchar*
mlton_g_ascii_formatd (SML_CVECTOR_VAL(gchar, buffer),
                       gint buf_len,
                       SML_CVECTOR_VAL(const gchar, format),
                       gdouble d)
{
  return g_ascii_formatd (GET_SML_CVECTOR_VAL(gchar, buffer),
                          buf_len,
                          GET_SML_CVECTOR_VAL(const gchar, format),
                          d);
}

gint
mlton_g_ascii_strcasecmp (SML_CVECTOR_VAL(const gchar, s1),
                          SML_CVECTOR_VAL(const gchar, s2))
{
  return g_ascii_strcasecmp (GET_SML_CVECTOR_VAL(const gchar, s1),
                             GET_SML_CVECTOR_VAL(const gchar, s2));
}

gchar*
mlton_g_ascii_strdown (SML_CVECTOR_VAL(const gchar, str),
                       gssize len)
{
  return g_ascii_strdown (GET_SML_CVECTOR_VAL(const gchar, str),
                          len);
}

gint
mlton_g_ascii_strncasecmp (SML_CVECTOR_VAL(const gchar, s1),
                           SML_CVECTOR_VAL(const gchar, s2),
                           gsize n)
{
  return g_ascii_strncasecmp (GET_SML_CVECTOR_VAL(const gchar, s1),
                              GET_SML_CVECTOR_VAL(const gchar, s2),
                              n);
}

gdouble
mlton_g_ascii_strtod (SML_CVECTOR_VAL(const gchar, nptr),
                      SML_CVECTOR_REF(gchar, endptr))
{
  return g_ascii_strtod (GET_SML_CVECTOR_VAL(const gchar, nptr),
                         GET_SML_CVECTOR_REF(gchar, endptr));
}

#if GLIB_CHECK_VERSION(2, 12, 0)
gint64
mlton_g_ascii_strtoll (SML_CVECTOR_VAL(const gchar, nptr),
                       SML_CVECTOR_REF(gchar, endptr),
                       guint base)
{
  return g_ascii_strtoll (GET_SML_CVECTOR_VAL(const gchar, nptr),
                          GET_SML_CVECTOR_REF(gchar, endptr),
                          base);
}
#endif

#if GLIB_CHECK_VERSION(2, 2, 0)
guint64
mlton_g_ascii_strtoull (SML_CVECTOR_VAL(const gchar, nptr),
                        SML_CVECTOR_REF(gchar, endptr),
                        guint base)
{
  return g_ascii_strtoull (GET_SML_CVECTOR_VAL(const gchar, nptr),
                           GET_SML_CVECTOR_REF(gchar, endptr),
                           base);
}
#endif

gchar*
mlton_g_ascii_strup (SML_CVECTOR_VAL(const gchar, str),
                     gssize len)
{
  return g_ascii_strup (GET_SML_CVECTOR_VAL(const gchar, str),
                        len);
}

void
mlton_g_assert_warning (SML_CVECTOR_VAL(const char, log_domain),
                        SML_CVECTOR_VAL(const char, file),
                        const int line,
                        SML_CVECTOR_VAL(const char, pretty_function),
                        SML_CVECTOR_VAL(const char, expression))
{
  g_assert_warning (GET_SML_CVECTOR_VAL(const char, log_domain),
                    GET_SML_CVECTOR_VAL(const char, file),
                    line,
                    GET_SML_CVECTOR_VAL(const char, pretty_function),
                    GET_SML_CVECTOR_VAL(const char, expression));
}

void
mlton_g_assertion_message (SML_CVECTOR_VAL(const char, domain),
                           SML_CVECTOR_VAL(const char, file),
                           int line,
                           SML_CVECTOR_VAL(const char, func),
                           SML_CVECTOR_VAL(const char, message))
{
  g_assertion_message (GET_SML_CVECTOR_VAL(const char, domain),
                       GET_SML_CVECTOR_VAL(const char, file),
                       line,
                       GET_SML_CVECTOR_VAL(const char, func),
                       GET_SML_CVECTOR_VAL(const char, message));
}

void
mlton_g_assertion_message_cmpstr (SML_CVECTOR_VAL(const char, domain),
                                  SML_CVECTOR_VAL(const char, file),
                                  int line,
                                  SML_CVECTOR_VAL(const char, func),
                                  SML_CVECTOR_VAL(const char, expr),
                                  SML_CVECTOR_VAL(const char, arg1),
                                  SML_CVECTOR_VAL(const char, cmp),
                                  SML_CVECTOR_VAL(const char, arg2))
{
  g_assertion_message_cmpstr (GET_SML_CVECTOR_VAL(const char, domain),
                              GET_SML_CVECTOR_VAL(const char, file),
                              line,
                              GET_SML_CVECTOR_VAL(const char, func),
                              GET_SML_CVECTOR_VAL(const char, expr),
                              GET_SML_CVECTOR_VAL(const char, arg1),
                              GET_SML_CVECTOR_VAL(const char, cmp),
                              GET_SML_CVECTOR_VAL(const char, arg2));
}

void
mlton_g_assertion_message_error (SML_CVECTOR_VAL(const char, domain),
                                 SML_CVECTOR_VAL(const char, file),
                                 int line,
                                 SML_CVECTOR_VAL(const char, func),
                                 SML_CVECTOR_VAL(const char, expr),
                                 const GError* error,
                                 GQuark error_domain,
                                 int error_code)
{
  g_assertion_message_error (GET_SML_CVECTOR_VAL(const char, domain),
                             GET_SML_CVECTOR_VAL(const char, file),
                             line,
                             GET_SML_CVECTOR_VAL(const char, func),
                             GET_SML_CVECTOR_VAL(const char, expr),
                             error,
                             error_domain,
                             error_code);
}

#if GLIB_CHECK_VERSION(2, 12, 0)
guchar*
mlton_g_base64_decode (SML_CVECTOR_VAL(const gchar, text),
                       gsize* out_len)
{
  return g_base64_decode (GET_SML_CVECTOR_VAL(const gchar, text),
                          out_len);
}
#endif

#if GLIB_CHECK_VERSION(2, 12, 0)
gchar*
mlton_g_base64_encode (SML_CVECTOR_VAL(guchar, data),
                       gsize len)
{
  return g_base64_encode (GET_SML_CVECTOR_VAL(guchar, data),
                          len);
}
#endif

const gchar*
mlton_g_basename (SML_CVECTOR_VAL(gchar, file_name))
{
  return g_basename (GET_SML_CVECTOR_VAL(gchar, file_name));
}

#if GLIB_CHECK_VERSION(2, 8, 0)
gchar*
mlton_g_build_filenamev (SML_CVECTORVECTOR_VAL(gchar, args))
{
  return g_build_filenamev (GET_SML_CVECTORVECTOR_VAL(gchar, args));
}
#endif

#if GLIB_CHECK_VERSION(2, 8, 0)
gchar*
mlton_g_build_pathv (SML_CVECTOR_VAL(const gchar, separator),
                     SML_CVECTORVECTOR_VAL(gchar, args))
{
  return g_build_pathv (GET_SML_CVECTOR_VAL(const gchar, separator),
                        GET_SML_CVECTORVECTOR_VAL(gchar, args));
}
#endif

#if GLIB_CHECK_VERSION(2, 8, 0)
int
mlton_g_chdir (SML_CVECTOR_VAL(gchar, path))
{
  return g_chdir (GET_SML_CVECTOR_VAL(gchar, path));
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
gchar*
mlton_g_compute_checksum_for_data (GChecksumType checksum_type,
                                   SML_CVECTOR_VAL(guchar, data),
                                   gsize length)
{
  return g_compute_checksum_for_data (checksum_type,
                                      GET_SML_CVECTOR_VAL(guchar, data),
                                      length);
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
gchar*
mlton_g_compute_checksum_for_string (GChecksumType checksum_type,
                                     SML_CVECTOR_VAL(const gchar, str),
                                     gssize length)
{
  return g_compute_checksum_for_string (checksum_type,
                                        GET_SML_CVECTOR_VAL(const gchar, str),
                                        length);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gchar*
mlton_g_compute_hmac_for_data (GChecksumType digest_type,
                               SML_CVECTOR_VAL(guchar, key),
                               gsize key_len,
                               SML_CVECTOR_VAL(guchar, data),
                               gsize length)
{
  return g_compute_hmac_for_data (digest_type,
                                  GET_SML_CVECTOR_VAL(guchar, key),
                                  key_len,
                                  GET_SML_CVECTOR_VAL(guchar, data),
                                  length);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gchar*
mlton_g_compute_hmac_for_string (GChecksumType digest_type,
                                 SML_CVECTOR_VAL(guchar, key),
                                 gsize key_len,
                                 SML_CVECTOR_VAL(const gchar, str),
                                 gssize length)
{
  return g_compute_hmac_for_string (digest_type,
                                    GET_SML_CVECTOR_VAL(guchar, key),
                                    key_len,
                                    GET_SML_CVECTOR_VAL(const gchar, str),
                                    length);
}
#endif

gchar*
mlton_g_convert (SML_CVECTOR_VAL(const gchar, str),
                 gssize len,
                 SML_CVECTOR_VAL(const gchar, to_codeset),
                 SML_CVECTOR_VAL(const gchar, from_codeset),
                 gsize* bytes_read,
                 gsize* bytes_written,
                 GError** error)
{
  return g_convert (GET_SML_CVECTOR_VAL(const gchar, str),
                    len,
                    GET_SML_CVECTOR_VAL(const gchar, to_codeset),
                    GET_SML_CVECTOR_VAL(const gchar, from_codeset),
                    bytes_read,
                    bytes_written,
                    error);
}

gchar*
mlton_g_convert_with_fallback (SML_CVECTOR_VAL(const gchar, str),
                               gssize len,
                               SML_CVECTOR_VAL(const gchar, to_codeset),
                               SML_CVECTOR_VAL(const gchar, from_codeset),
                               SML_CVECTOR_VAL(const gchar, fallback),
                               gsize* bytes_read,
                               gsize* bytes_written,
                               GError** error)
{
  return g_convert_with_fallback (GET_SML_CVECTOR_VAL(const gchar, str),
                                  len,
                                  GET_SML_CVECTOR_VAL(const gchar, to_codeset),
                                  GET_SML_CVECTOR_VAL(const gchar, from_codeset),
                                  GET_SML_CVECTOR_VAL(const gchar, fallback),
                                  bytes_read,
                                  bytes_written,
                                  error);
}

gchar*
mlton_g_convert_with_iconv (SML_CVECTOR_VAL(const gchar, str),
                            gssize len,
                            GIConv converter,
                            gsize* bytes_read,
                            gsize* bytes_written,
                            GError** error)
{
  return g_convert_with_iconv (GET_SML_CVECTOR_VAL(const gchar, str),
                               len,
                               converter,
                               bytes_read,
                               bytes_written,
                               error);
}

gpointer
mlton_g_datalist_get_data (GData** datalist,
                           SML_CVECTOR_VAL(const gchar, key))
{
  return g_datalist_get_data (datalist,
                              GET_SML_CVECTOR_VAL(const gchar, key));
}

#if GLIB_CHECK_VERSION(2, 26, 0)
const gchar*
mlton_g_dcgettext (SML_CVECTOR_VAL(const gchar, domain),
                   SML_CVECTOR_VAL(const gchar, msgid),
                   gint category)
{
  return g_dcgettext (GET_SML_CVECTOR_VAL(const gchar, domain),
                      GET_SML_CVECTOR_VAL(const gchar, msgid),
                      category);
}
#endif

#if GLIB_CHECK_VERSION(2, 18, 0)
const gchar*
mlton_g_dgettext (SML_CVECTOR_VAL(const gchar, domain),
                  SML_CVECTOR_VAL(const gchar, msgid))
{
  return g_dgettext (GET_SML_CVECTOR_VAL(const gchar, domain),
                     GET_SML_CVECTOR_VAL(const gchar, msgid));
}
#endif

#if GLIB_CHECK_VERSION(2, 18, 0)
const gchar*
mlton_g_dngettext (SML_CVECTOR_VAL(const gchar, domain),
                   SML_CVECTOR_VAL(const gchar, msgid),
                   SML_CVECTOR_VAL(const gchar, msgid_plural),
                   gulong n)
{
  return g_dngettext (GET_SML_CVECTOR_VAL(const gchar, domain),
                      GET_SML_CVECTOR_VAL(const gchar, msgid),
                      GET_SML_CVECTOR_VAL(const gchar, msgid_plural),
                      n);
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
const gchar*
mlton_g_dpgettext (SML_CVECTOR_VAL(const gchar, domain),
                   SML_CVECTOR_VAL(const gchar, msgctxtid),
                   gsize msgidoffset)
{
  return g_dpgettext (GET_SML_CVECTOR_VAL(const gchar, domain),
                      GET_SML_CVECTOR_VAL(const gchar, msgctxtid),
                      msgidoffset);
}
#endif

#if GLIB_CHECK_VERSION(2, 18, 0)
const gchar*
mlton_g_dpgettext2 (SML_CVECTOR_VAL(const gchar, domain),
                    SML_CVECTOR_VAL(const gchar, context),
                    SML_CVECTOR_VAL(const gchar, msgid))
{
  return g_dpgettext2 (GET_SML_CVECTOR_VAL(const gchar, domain),
                       GET_SML_CVECTOR_VAL(const gchar, context),
                       GET_SML_CVECTOR_VAL(const gchar, msgid));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
const gchar*
mlton_g_environ_getenv (SML_CVECTORVECTOR_VAL(gchar, envp),
                        SML_CVECTOR_VAL(const gchar, variable))
{
  return g_environ_getenv (GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                           GET_SML_CVECTOR_VAL(const gchar, variable));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gchar**
mlton_g_environ_setenv (SML_CVECTORVECTOR_VAL(gchar, envp),
                        SML_CVECTOR_VAL(const gchar, variable),
                        SML_CVECTOR_VAL(const gchar, value),
                        gboolean overwrite)
{
  return g_environ_setenv (GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                           GET_SML_CVECTOR_VAL(const gchar, variable),
                           GET_SML_CVECTOR_VAL(const gchar, value),
                           overwrite);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gchar**
mlton_g_environ_unsetenv (SML_CVECTORVECTOR_VAL(gchar, envp),
                          SML_CVECTOR_VAL(const gchar, variable))
{
  return g_environ_unsetenv (GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                             GET_SML_CVECTOR_VAL(const gchar, variable));
}
#endif

gboolean
mlton_g_file_get_contents (SML_CVECTOR_VAL(gchar, filename),
                           SML_CVECTOR_REF(gchar, contents),
                           gsize* length,
                           GError** error)
{
  return g_file_get_contents (GET_SML_CVECTOR_VAL(gchar, filename),
                              GET_SML_CVECTOR_REF(gchar, contents),
                              length,
                              error);
}

gint
mlton_g_file_open_tmp (SML_CVECTOR_VAL(gchar, tmpl),
                       SML_CVECTOR_REF(gchar, name_used),
                       GError** error)
{
  return g_file_open_tmp (GET_SML_CVECTOR_VAL(gchar, tmpl),
                          GET_SML_CVECTOR_REF(gchar, name_used),
                          error);
}

#if GLIB_CHECK_VERSION(2, 4, 0)
gchar*
mlton_g_file_read_link (SML_CVECTOR_VAL(gchar, filename),
                        GError** error)
{
  return g_file_read_link (GET_SML_CVECTOR_VAL(gchar, filename),
                           error);
}
#endif

#if GLIB_CHECK_VERSION(2, 8, 0)
gboolean
mlton_g_file_set_contents (SML_CVECTOR_VAL(gchar, filename),
                           SML_CVECTOR_VAL(gchar, contents),
                           gssize length,
                           GError** error)
{
  return g_file_set_contents (GET_SML_CVECTOR_VAL(gchar, filename),
                              GET_SML_CVECTOR_VAL(gchar, contents),
                              length,
                              error);
}
#endif

gboolean
mlton_g_file_test (SML_CVECTOR_VAL(gchar, filename),
                   GFileTest test)
{
  return g_file_test (GET_SML_CVECTOR_VAL(gchar, filename),
                      test);
}

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar*
mlton_g_filename_display_basename (SML_CVECTOR_VAL(gchar, filename))
{
  return g_filename_display_basename (GET_SML_CVECTOR_VAL(gchar, filename));
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar*
mlton_g_filename_display_name (SML_CVECTOR_VAL(gchar, filename))
{
  return g_filename_display_name (GET_SML_CVECTOR_VAL(gchar, filename));
}
#endif

gchar*
mlton_g_filename_from_uri (SML_CVECTOR_VAL(const gchar, uri),
                           SML_CVECTOR_REF(gchar, hostname),
                           GError** error)
{
  return g_filename_from_uri (GET_SML_CVECTOR_VAL(const gchar, uri),
                              GET_SML_CVECTOR_REF(gchar, hostname),
                              error);
}

gchar*
mlton_g_filename_from_utf8 (SML_CVECTOR_VAL(const gchar, utf8string),
                            gssize len,
                            gsize* bytes_read,
                            gsize* bytes_written,
                            GError** error)
{
  return g_filename_from_utf8 (GET_SML_CVECTOR_VAL(const gchar, utf8string),
                               len,
                               bytes_read,
                               bytes_written,
                               error);
}

gchar*
mlton_g_filename_to_uri (SML_CVECTOR_VAL(gchar, filename),
                         SML_CVECTOR_VAL(const gchar, hostname),
                         GError** error)
{
  return g_filename_to_uri (GET_SML_CVECTOR_VAL(gchar, filename),
                            GET_SML_CVECTOR_VAL(const gchar, hostname),
                            error);
}

gchar*
mlton_g_filename_to_utf8 (SML_CVECTOR_VAL(gchar, opsysstring),
                          gssize len,
                          gsize* bytes_read,
                          gsize* bytes_written,
                          GError** error)
{
  return g_filename_to_utf8 (GET_SML_CVECTOR_VAL(gchar, opsysstring),
                             len,
                             bytes_read,
                             bytes_written,
                             error);
}

gchar*
mlton_g_find_program_in_path (SML_CVECTOR_VAL(gchar, program))
{
  return g_find_program_in_path (GET_SML_CVECTOR_VAL(gchar, program));
}

gboolean
mlton_g_get_charset (SML_CVECTOR_REF(const char, charset))
{
  return g_get_charset (GET_SML_CVECTOR_REF(const char, charset));
}

#if GLIB_CHECK_VERSION(2, 6, 0)
gboolean
mlton_g_get_filename_charsets (SML_CVECTOR_VAL(const gchar**, charsets))
{
  return g_get_filename_charsets (GET_SML_CVECTOR_VAL(const gchar**, charsets));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
gchar**
mlton_g_get_locale_variants (SML_CVECTOR_VAL(const gchar, locale))
{
  return g_get_locale_variants (GET_SML_CVECTOR_VAL(const gchar, locale));
}
#endif

const gchar*
mlton_g_getenv (SML_CVECTOR_VAL(const gchar, variable))
{
  return g_getenv (GET_SML_CVECTOR_VAL(const gchar, variable));
}

#if GLIB_CHECK_VERSION(2, 22, 0)
gboolean
mlton_g_hostname_is_ascii_encoded (SML_CVECTOR_VAL(const gchar, hostname))
{
  return g_hostname_is_ascii_encoded (GET_SML_CVECTOR_VAL(const gchar, hostname));
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gboolean
mlton_g_hostname_is_ip_address (SML_CVECTOR_VAL(const gchar, hostname))
{
  return g_hostname_is_ip_address (GET_SML_CVECTOR_VAL(const gchar, hostname));
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gboolean
mlton_g_hostname_is_non_ascii (SML_CVECTOR_VAL(const gchar, hostname))
{
  return g_hostname_is_non_ascii (GET_SML_CVECTOR_VAL(const gchar, hostname));
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gchar*
mlton_g_hostname_to_ascii (SML_CVECTOR_VAL(const gchar, hostname))
{
  return g_hostname_to_ascii (GET_SML_CVECTOR_VAL(const gchar, hostname));
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gchar*
mlton_g_hostname_to_unicode (SML_CVECTOR_VAL(const gchar, hostname))
{
  return g_hostname_to_unicode (GET_SML_CVECTOR_VAL(const gchar, hostname));
}
#endif

gsize
mlton_g_iconv (GIConv converter,
               SML_CVECTOR_VAL(gchar*, inbuf),
               gsize* inbytes_left,
               SML_CVECTOR_VAL(gchar*, outbuf),
               gsize* outbytes_left)
{
  return g_iconv (converter,
                  GET_SML_CVECTOR_VAL(gchar*, inbuf),
                  inbytes_left,
                  GET_SML_CVECTOR_VAL(gchar*, outbuf),
                  outbytes_left);
}

#if GLIB_CHECK_VERSION(2, 10, 0)
const gchar*
mlton_g_intern_static_string (SML_CVECTOR_VAL(const gchar, string))
{
  return g_intern_static_string (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 10, 0)
const gchar*
mlton_g_intern_string (SML_CVECTOR_VAL(const gchar, string))
{
  return g_intern_string (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

gchar*
mlton_g_locale_from_utf8 (SML_CVECTOR_VAL(const gchar, utf8string),
                          gssize len,
                          gsize* bytes_read,
                          gsize* bytes_written,
                          GError** error)
{
  return g_locale_from_utf8 (GET_SML_CVECTOR_VAL(const gchar, utf8string),
                             len,
                             bytes_read,
                             bytes_written,
                             error);
}

gchar*
mlton_g_locale_to_utf8 (SML_CVECTOR_VAL(const gchar, opsysstring),
                        gssize len,
                        gsize* bytes_read,
                        gsize* bytes_written,
                        GError** error)
{
  return g_locale_to_utf8 (GET_SML_CVECTOR_VAL(const gchar, opsysstring),
                           len,
                           bytes_read,
                           bytes_written,
                           error);
}

void
mlton_g_log_default_handler (SML_CVECTOR_VAL(const gchar, log_domain),
                             GLogLevelFlags log_level,
                             SML_CVECTOR_VAL(const gchar, message),
                             gpointer unused_data)
{
  g_log_default_handler (GET_SML_CVECTOR_VAL(const gchar, log_domain),
                         log_level,
                         GET_SML_CVECTOR_VAL(const gchar, message),
                         unused_data);
}

void
mlton_g_log_remove_handler (SML_CVECTOR_VAL(const gchar, log_domain),
                            guint handler_id)
{
  g_log_remove_handler (GET_SML_CVECTOR_VAL(const gchar, log_domain),
                        handler_id);
}

GLogLevelFlags
mlton_g_log_set_fatal_mask (SML_CVECTOR_VAL(const gchar, log_domain),
                            GLogLevelFlags fatal_mask)
{
  return g_log_set_fatal_mask (GET_SML_CVECTOR_VAL(const gchar, log_domain),
                               fatal_mask);
}

#if GLIB_CHECK_VERSION(2, 46, 0)
guint
mlton_g_log_set_handler_full (SML_CVECTOR_VAL(const gchar, log_domain),
                              GLogLevelFlags log_levels,
                              GLogFunc log_func,
                              gpointer user_data,
                              GDestroyNotify destroy)
{
  return g_log_set_handler_full (GET_SML_CVECTOR_VAL(const gchar, log_domain),
                                 log_levels,
                                 log_func,
                                 user_data,
                                 destroy);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
void
mlton_g_log_structured_array (GLogLevelFlags log_level,
                              SML_CVECTOR_VAL(GLogField, fields),
                              gsize n_fields)
{
  g_log_structured_array (log_level,
                          GET_SML_CVECTOR_VAL(GLogField, fields),
                          n_fields);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
void
mlton_g_log_variant (SML_CVECTOR_VAL(const gchar, log_domain),
                     GLogLevelFlags log_level,
                     GVariant* fields)
{
  g_log_variant (GET_SML_CVECTOR_VAL(const gchar, log_domain),
                 log_level,
                 fields);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
GLogWriterOutput
mlton_g_log_writer_default (GLogLevelFlags log_level,
                            SML_CVECTOR_VAL(GLogField, fields),
                            gsize n_fields,
                            gpointer user_data)
{
  return g_log_writer_default (log_level,
                               GET_SML_CVECTOR_VAL(GLogField, fields),
                               n_fields,
                               user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
gchar*
mlton_g_log_writer_format_fields (GLogLevelFlags log_level,
                                  SML_CVECTOR_VAL(GLogField, fields),
                                  gsize n_fields,
                                  gboolean use_color)
{
  return g_log_writer_format_fields (log_level,
                                     GET_SML_CVECTOR_VAL(GLogField, fields),
                                     n_fields,
                                     use_color);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
GLogWriterOutput
mlton_g_log_writer_journald (GLogLevelFlags log_level,
                             SML_CVECTOR_VAL(GLogField, fields),
                             gsize n_fields,
                             gpointer user_data)
{
  return g_log_writer_journald (log_level,
                                GET_SML_CVECTOR_VAL(GLogField, fields),
                                n_fields,
                                user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
GLogWriterOutput
mlton_g_log_writer_standard_streams (GLogLevelFlags log_level,
                                     SML_CVECTOR_VAL(GLogField, fields),
                                     gsize n_fields,
                                     gpointer user_data)
{
  return g_log_writer_standard_streams (log_level,
                                        GET_SML_CVECTOR_VAL(GLogField, fields),
                                        n_fields,
                                        user_data);
}
#endif

gchar*
mlton_g_markup_escape_text (SML_CVECTOR_VAL(const gchar, text),
                            gssize length)
{
  return g_markup_escape_text (GET_SML_CVECTOR_VAL(const gchar, text),
                               length);
}

#if GLIB_CHECK_VERSION(2, 8, 0)
gint
mlton_g_mkdir_with_parents (SML_CVECTOR_VAL(gchar, pathname),
                            gint mode)
{
  return g_mkdir_with_parents (GET_SML_CVECTOR_VAL(gchar, pathname),
                               mode);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gchar*
mlton_g_mkdtemp (SML_CVECTOR_VAL(gchar, tmpl))
{
  return g_mkdtemp (GET_SML_CVECTOR_VAL(gchar, tmpl));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gchar*
mlton_g_mkdtemp_full (SML_CVECTOR_VAL(gchar, tmpl),
                      gint mode)
{
  return g_mkdtemp_full (GET_SML_CVECTOR_VAL(gchar, tmpl),
                         mode);
}
#endif

gint
mlton_g_mkstemp (SML_CVECTOR_VAL(gchar, tmpl))
{
  return g_mkstemp (GET_SML_CVECTOR_VAL(gchar, tmpl));
}

#if GLIB_CHECK_VERSION(2, 22, 0)
gint
mlton_g_mkstemp_full (SML_CVECTOR_VAL(gchar, tmpl),
                      gint flags,
                      gint mode)
{
  return g_mkstemp_full (GET_SML_CVECTOR_VAL(gchar, tmpl),
                         flags,
                         mode);
}
#endif

void
mlton_g_on_error_query (SML_CVECTOR_VAL(const gchar, prg_name))
{
  g_on_error_query (GET_SML_CVECTOR_VAL(const gchar, prg_name));
}

void
mlton_g_on_error_stack_trace (SML_CVECTOR_VAL(const gchar, prg_name))
{
  g_on_error_stack_trace (GET_SML_CVECTOR_VAL(const gchar, prg_name));
}

guint
mlton_g_parse_debug_string (SML_CVECTOR_VAL(const gchar, string),
                            SML_CVECTOR_VAL(GDebugKey, keys),
                            guint nkeys)
{
  return g_parse_debug_string (GET_SML_CVECTOR_VAL(const gchar, string),
                               GET_SML_CVECTOR_VAL(GDebugKey, keys),
                               nkeys);
}

gchar*
mlton_g_path_get_basename (SML_CVECTOR_VAL(gchar, file_name))
{
  return g_path_get_basename (GET_SML_CVECTOR_VAL(gchar, file_name));
}

gchar*
mlton_g_path_get_dirname (SML_CVECTOR_VAL(gchar, file_name))
{
  return g_path_get_dirname (GET_SML_CVECTOR_VAL(gchar, file_name));
}

gboolean
mlton_g_path_is_absolute (SML_CVECTOR_VAL(gchar, file_name))
{
  return g_path_is_absolute (GET_SML_CVECTOR_VAL(gchar, file_name));
}

const gchar*
mlton_g_path_skip_root (SML_CVECTOR_VAL(gchar, file_name))
{
  return g_path_skip_root (GET_SML_CVECTOR_VAL(gchar, file_name));
}

gboolean
mlton_g_pattern_match (GPatternSpec* pspec,
                       guint string_length,
                       SML_CVECTOR_VAL(const gchar, string),
                       SML_CVECTOR_VAL(const gchar, string_reversed))
{
  return g_pattern_match (pspec,
                          string_length,
                          GET_SML_CVECTOR_VAL(const gchar, string),
                          GET_SML_CVECTOR_VAL(const gchar, string_reversed));
}

gboolean
mlton_g_pattern_match_simple (SML_CVECTOR_VAL(const gchar, pattern),
                              SML_CVECTOR_VAL(const gchar, string))
{
  return g_pattern_match_simple (GET_SML_CVECTOR_VAL(const gchar, pattern),
                                 GET_SML_CVECTOR_VAL(const gchar, string));
}

gboolean
mlton_g_pattern_match_string (GPatternSpec* pspec,
                              SML_CVECTOR_VAL(const gchar, string))
{
  return g_pattern_match_string (pspec,
                                 GET_SML_CVECTOR_VAL(const gchar, string));
}

GQuark
mlton_g_quark_from_static_string (SML_CVECTOR_VAL(const gchar, string))
{
  return g_quark_from_static_string (GET_SML_CVECTOR_VAL(const gchar, string));
}

GQuark
mlton_g_quark_from_string (SML_CVECTOR_VAL(const gchar, string))
{
  return g_quark_from_string (GET_SML_CVECTOR_VAL(const gchar, string));
}

GQuark
mlton_g_quark_try_string (SML_CVECTOR_VAL(const gchar, string))
{
  return g_quark_try_string (GET_SML_CVECTOR_VAL(const gchar, string));
}

#if GLIB_CHECK_VERSION(2, 6, 0)
int
mlton_g_rmdir (SML_CVECTOR_VAL(gchar, filename))
{
  return g_rmdir (GET_SML_CVECTOR_VAL(gchar, filename));
}
#endif

#if GLIB_CHECK_VERSION(2, 2, 0)
void
mlton_g_set_application_name (SML_CVECTOR_VAL(const gchar, application_name))
{
  g_set_application_name (GET_SML_CVECTOR_VAL(const gchar, application_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 18, 0)
void
mlton_g_set_error_literal (GError** err,
                           GQuark domain,
                           gint code,
                           SML_CVECTOR_VAL(const gchar, message))
{
  g_set_error_literal (err,
                       domain,
                       code,
                       GET_SML_CVECTOR_VAL(const gchar, message));
}
#endif

void
mlton_g_set_prgname (SML_CVECTOR_VAL(const gchar, prgname))
{
  g_set_prgname (GET_SML_CVECTOR_VAL(const gchar, prgname));
}

#if GLIB_CHECK_VERSION(2, 4, 0)
gboolean
mlton_g_setenv (SML_CVECTOR_VAL(const gchar, variable),
                SML_CVECTOR_VAL(const gchar, value),
                gboolean overwrite)
{
  return g_setenv (GET_SML_CVECTOR_VAL(const gchar, variable),
                   GET_SML_CVECTOR_VAL(const gchar, value),
                   overwrite);
}
#endif

gboolean
mlton_g_shell_parse_argv (SML_CVECTOR_VAL(const gchar, command_line),
                          gint* argcp,
                          SML_CVECTORVECTOR_REF(gchar, argvp),
                          GError** error)
{
  return g_shell_parse_argv (GET_SML_CVECTOR_VAL(const gchar, command_line),
                             argcp,
                             GET_SML_CVECTORVECTOR_REF(gchar, argvp),
                             error);
}

gchar*
mlton_g_shell_quote (SML_CVECTOR_VAL(const gchar, unquoted_string))
{
  return g_shell_quote (GET_SML_CVECTOR_VAL(const gchar, unquoted_string));
}

gchar*
mlton_g_shell_unquote (SML_CVECTOR_VAL(const gchar, quoted_string),
                       GError** error)
{
  return g_shell_unquote (GET_SML_CVECTOR_VAL(const gchar, quoted_string),
                          error);
}

gboolean
mlton_g_spawn_async (SML_CVECTOR_VAL(gchar, working_directory),
                     SML_CVECTORVECTOR_VAL(gchar, argv),
                     SML_CVECTORVECTOR_VAL(gchar, envp),
                     GSpawnFlags flags,
                     GSpawnChildSetupFunc child_setup,
                     gpointer user_data,
                     GPid* child_pid,
                     GError** error)
{
  return g_spawn_async (GET_SML_CVECTOR_VAL(gchar, working_directory),
                        GET_SML_CVECTORVECTOR_VAL(gchar, argv),
                        GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                        flags,
                        child_setup,
                        user_data,
                        child_pid,
                        error);
}

gboolean
mlton_g_spawn_async_with_pipes (SML_CVECTOR_VAL(gchar, working_directory),
                                SML_CVECTORVECTOR_VAL(gchar, argv),
                                SML_CVECTORVECTOR_VAL(gchar, envp),
                                GSpawnFlags flags,
                                GSpawnChildSetupFunc child_setup,
                                gpointer user_data,
                                GPid* child_pid,
                                gint* standard_input,
                                gint* standard_output,
                                gint* standard_error,
                                GError** error)
{
  return g_spawn_async_with_pipes (GET_SML_CVECTOR_VAL(gchar, working_directory),
                                   GET_SML_CVECTORVECTOR_VAL(gchar, argv),
                                   GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                                   flags,
                                   child_setup,
                                   user_data,
                                   child_pid,
                                   standard_input,
                                   standard_output,
                                   standard_error,
                                   error);
}

gboolean
mlton_g_spawn_command_line_async (SML_CVECTOR_VAL(const gchar, command_line),
                                  GError** error)
{
  return g_spawn_command_line_async (GET_SML_CVECTOR_VAL(const gchar, command_line),
                                     error);
}

gboolean
mlton_g_spawn_command_line_sync (SML_CVECTOR_VAL(const gchar, command_line),
                                 SML_CVECTOR_REF(gchar, standard_output),
                                 SML_CVECTOR_REF(gchar, standard_error),
                                 gint* exit_status,
                                 GError** error)
{
  return g_spawn_command_line_sync (GET_SML_CVECTOR_VAL(const gchar, command_line),
                                    GET_SML_CVECTOR_REF(gchar, standard_output),
                                    GET_SML_CVECTOR_REF(gchar, standard_error),
                                    exit_status,
                                    error);
}

gboolean
mlton_g_spawn_sync (SML_CVECTOR_VAL(gchar, working_directory),
                    SML_CVECTORVECTOR_VAL(gchar, argv),
                    SML_CVECTORVECTOR_VAL(gchar, envp),
                    GSpawnFlags flags,
                    GSpawnChildSetupFunc child_setup,
                    gpointer user_data,
                    SML_CVECTOR_REF(gchar, standard_output),
                    SML_CVECTOR_REF(gchar, standard_error),
                    gint* exit_status,
                    GError** error)
{
  return g_spawn_sync (GET_SML_CVECTOR_VAL(gchar, working_directory),
                       GET_SML_CVECTORVECTOR_VAL(gchar, argv),
                       GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                       flags,
                       child_setup,
                       user_data,
                       GET_SML_CVECTOR_REF(gchar, standard_output),
                       GET_SML_CVECTOR_REF(gchar, standard_error),
                       exit_status,
                       error);
}

gchar*
mlton_g_stpcpy (SML_CVECTOR_VAL(gchar, dest),
                SML_CVECTOR_VAL(const char, src))
{
  return g_stpcpy (GET_SML_CVECTOR_VAL(gchar, dest),
                   GET_SML_CVECTOR_VAL(const char, src));
}

#if GLIB_CHECK_VERSION(2, 2, 0)
gboolean
mlton_g_str_has_prefix (SML_CVECTOR_VAL(const gchar, str),
                        SML_CVECTOR_VAL(const gchar, prefix))
{
  return g_str_has_prefix (GET_SML_CVECTOR_VAL(const gchar, str),
                           GET_SML_CVECTOR_VAL(const gchar, prefix));
}
#endif

#if GLIB_CHECK_VERSION(2, 2, 0)
gboolean
mlton_g_str_has_suffix (SML_CVECTOR_VAL(const gchar, str),
                        SML_CVECTOR_VAL(const gchar, suffix))
{
  return g_str_has_suffix (GET_SML_CVECTOR_VAL(const gchar, str),
                           GET_SML_CVECTOR_VAL(const gchar, suffix));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gboolean
mlton_g_str_is_ascii (SML_CVECTOR_VAL(const gchar, str))
{
  return g_str_is_ascii (GET_SML_CVECTOR_VAL(const gchar, str));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gboolean
mlton_g_str_match_string (SML_CVECTOR_VAL(const gchar, search_term),
                          SML_CVECTOR_VAL(const gchar, potential_hit),
                          gboolean accept_alternates)
{
  return g_str_match_string (GET_SML_CVECTOR_VAL(const gchar, search_term),
                             GET_SML_CVECTOR_VAL(const gchar, potential_hit),
                             accept_alternates);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gchar*
mlton_g_str_to_ascii (SML_CVECTOR_VAL(const gchar, str),
                      SML_CVECTOR_VAL(const gchar, from_locale))
{
  return g_str_to_ascii (GET_SML_CVECTOR_VAL(const gchar, str),
                         GET_SML_CVECTOR_VAL(const gchar, from_locale));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gchar**
mlton_g_str_tokenize_and_fold (SML_CVECTOR_VAL(const gchar, string),
                               SML_CVECTOR_VAL(const gchar, translit_locale),
                               SML_CVECTORVECTOR_REF(gchar, ascii_alternates))
{
  return g_str_tokenize_and_fold (GET_SML_CVECTOR_VAL(const gchar, string),
                                  GET_SML_CVECTOR_VAL(const gchar, translit_locale),
                                  GET_SML_CVECTORVECTOR_REF(gchar, ascii_alternates));
}
#endif

gchar*
mlton_g_strcanon (SML_CVECTOR_VAL(gchar, string),
                  SML_CVECTOR_VAL(const gchar, valid_chars),
                  gchar substitutor)
{
  return g_strcanon (GET_SML_CVECTOR_VAL(gchar, string),
                     GET_SML_CVECTOR_VAL(const gchar, valid_chars),
                     substitutor);
}

gint
mlton_g_strcasecmp (SML_CVECTOR_VAL(const gchar, s1),
                    SML_CVECTOR_VAL(const gchar, s2))
{
  return g_strcasecmp (GET_SML_CVECTOR_VAL(const gchar, s1),
                       GET_SML_CVECTOR_VAL(const gchar, s2));
}

gchar*
mlton_g_strchomp (SML_CVECTOR_VAL(gchar, string))
{
  return g_strchomp (GET_SML_CVECTOR_VAL(gchar, string));
}

gchar*
mlton_g_strchug (SML_CVECTOR_VAL(gchar, string))
{
  return g_strchug (GET_SML_CVECTOR_VAL(gchar, string));
}

#if GLIB_CHECK_VERSION(2, 16, 0)
int
mlton_g_strcmp0 (SML_CVECTOR_VAL(const char, str1),
                 SML_CVECTOR_VAL(const char, str2))
{
  return g_strcmp0 (GET_SML_CVECTOR_VAL(const char, str1),
                    GET_SML_CVECTOR_VAL(const char, str2));
}
#endif

gchar*
mlton_g_strcompress (SML_CVECTOR_VAL(const gchar, source))
{
  return g_strcompress (GET_SML_CVECTOR_VAL(const gchar, source));
}

gchar*
mlton_g_strdelimit (SML_CVECTOR_VAL(gchar, string),
                    SML_CVECTOR_VAL(const gchar, delimiters),
                    gchar new_delimiter)
{
  return g_strdelimit (GET_SML_CVECTOR_VAL(gchar, string),
                       GET_SML_CVECTOR_VAL(const gchar, delimiters),
                       new_delimiter);
}

gchar*
mlton_g_strdown (SML_CVECTOR_VAL(gchar, string))
{
  return g_strdown (GET_SML_CVECTOR_VAL(gchar, string));
}

gchar*
mlton_g_strdup (SML_CVECTOR_VAL(const gchar, str))
{
  return g_strdup (GET_SML_CVECTOR_VAL(const gchar, str));
}

gchar*
mlton_g_strescape (SML_CVECTOR_VAL(const gchar, source),
                   SML_CVECTOR_VAL(const gchar, exceptions))
{
  return g_strescape (GET_SML_CVECTOR_VAL(const gchar, source),
                      GET_SML_CVECTOR_VAL(const gchar, exceptions));
}

void
mlton_g_strfreev (SML_CVECTOR_VAL(gchar*, str_array))
{
  g_strfreev (GET_SML_CVECTOR_VAL(gchar*, str_array));
}

GString*
mlton_g_string_new (SML_CVECTOR_VAL(const gchar, init))
{
  return g_string_new (GET_SML_CVECTOR_VAL(const gchar, init));
}

GString*
mlton_g_string_new_len (SML_CVECTOR_VAL(const gchar, init),
                        gssize len)
{
  return g_string_new_len (GET_SML_CVECTOR_VAL(const gchar, init),
                           len);
}

#if GLIB_CHECK_VERSION(2, 4, 0)
const gchar*
mlton_g_strip_context (SML_CVECTOR_VAL(const gchar, msgid),
                       SML_CVECTOR_VAL(const gchar, msgval))
{
  return g_strip_context (GET_SML_CVECTOR_VAL(const gchar, msgid),
                          GET_SML_CVECTOR_VAL(const gchar, msgval));
}
#endif

gchar*
mlton_g_strjoinv (SML_CVECTOR_VAL(const gchar, separator),
                  SML_CVECTOR_VAL(gchar*, str_array))
{
  return g_strjoinv (GET_SML_CVECTOR_VAL(const gchar, separator),
                     GET_SML_CVECTOR_VAL(gchar*, str_array));
}

gsize
mlton_g_strlcat (SML_CVECTOR_VAL(gchar, dest),
                 SML_CVECTOR_VAL(const gchar, src),
                 gsize dest_size)
{
  return g_strlcat (GET_SML_CVECTOR_VAL(gchar, dest),
                    GET_SML_CVECTOR_VAL(const gchar, src),
                    dest_size);
}

gsize
mlton_g_strlcpy (SML_CVECTOR_VAL(gchar, dest),
                 SML_CVECTOR_VAL(const gchar, src),
                 gsize dest_size)
{
  return g_strlcpy (GET_SML_CVECTOR_VAL(gchar, dest),
                    GET_SML_CVECTOR_VAL(const gchar, src),
                    dest_size);
}

gint
mlton_g_strncasecmp (SML_CVECTOR_VAL(const gchar, s1),
                     SML_CVECTOR_VAL(const gchar, s2),
                     guint n)
{
  return g_strncasecmp (GET_SML_CVECTOR_VAL(const gchar, s1),
                        GET_SML_CVECTOR_VAL(const gchar, s2),
                        n);
}

gchar*
mlton_g_strndup (SML_CVECTOR_VAL(const gchar, str),
                 gsize n)
{
  return g_strndup (GET_SML_CVECTOR_VAL(const gchar, str),
                    n);
}

gchar*
mlton_g_strreverse (SML_CVECTOR_VAL(gchar, string))
{
  return g_strreverse (GET_SML_CVECTOR_VAL(gchar, string));
}

gchar*
mlton_g_strrstr (SML_CVECTOR_VAL(const gchar, haystack),
                 SML_CVECTOR_VAL(const gchar, needle))
{
  return g_strrstr (GET_SML_CVECTOR_VAL(const gchar, haystack),
                    GET_SML_CVECTOR_VAL(const gchar, needle));
}

gchar*
mlton_g_strrstr_len (SML_CVECTOR_VAL(const gchar, haystack),
                     gssize haystack_len,
                     SML_CVECTOR_VAL(const gchar, needle))
{
  return g_strrstr_len (GET_SML_CVECTOR_VAL(const gchar, haystack),
                        haystack_len,
                        GET_SML_CVECTOR_VAL(const gchar, needle));
}

gchar*
mlton_g_strstr_len (SML_CVECTOR_VAL(const gchar, haystack),
                    gssize haystack_len,
                    SML_CVECTOR_VAL(const gchar, needle))
{
  return g_strstr_len (GET_SML_CVECTOR_VAL(const gchar, haystack),
                       haystack_len,
                       GET_SML_CVECTOR_VAL(const gchar, needle));
}

gdouble
mlton_g_strtod (SML_CVECTOR_VAL(const gchar, nptr),
                SML_CVECTOR_REF(gchar, endptr))
{
  return g_strtod (GET_SML_CVECTOR_VAL(const gchar, nptr),
                   GET_SML_CVECTOR_REF(gchar, endptr));
}

gchar*
mlton_g_strup (SML_CVECTOR_VAL(gchar, string))
{
  return g_strup (GET_SML_CVECTOR_VAL(gchar, string));
}

#if GLIB_CHECK_VERSION(2, 44, 0)
gboolean
mlton_g_strv_contains (SML_CVECTOR_VAL(const gchar* const, strv),
                       SML_CVECTOR_VAL(const gchar, str))
{
  return g_strv_contains (GET_SML_CVECTOR_VAL(const gchar* const, strv),
                          GET_SML_CVECTOR_VAL(const gchar, str));
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
guint
mlton_g_strv_length (SML_CVECTOR_VAL(gchar*, str_array))
{
  return g_strv_length (GET_SML_CVECTOR_VAL(gchar*, str_array));
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
void
mlton_g_test_add_data_func (SML_CVECTOR_VAL(const char, testpath),
                            gconstpointer test_data,
                            GTestDataFunc test_func)
{
  g_test_add_data_func (GET_SML_CVECTOR_VAL(const char, testpath),
                        test_data,
                        test_func);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
void
mlton_g_test_add_data_func_full (SML_CVECTOR_VAL(const char, testpath),
                                 gpointer test_data,
                                 GTestDataFunc test_func,
                                 GDestroyNotify data_free_func)
{
  g_test_add_data_func_full (GET_SML_CVECTOR_VAL(const char, testpath),
                             test_data,
                             test_func,
                             data_free_func);
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
void
mlton_g_test_add_func (SML_CVECTOR_VAL(const char, testpath),
                       GTestFunc test_func)
{
  g_test_add_func (GET_SML_CVECTOR_VAL(const char, testpath),
                   test_func);
}
#endif

void
mlton_g_test_assert_expected_messages_internal (SML_CVECTOR_VAL(const char, domain),
                                                SML_CVECTOR_VAL(const char, file),
                                                int line,
                                                SML_CVECTOR_VAL(const char, func))
{
  g_test_assert_expected_messages_internal (GET_SML_CVECTOR_VAL(const char, domain),
                                            GET_SML_CVECTOR_VAL(const char, file),
                                            line,
                                            GET_SML_CVECTOR_VAL(const char, func));
}

#if GLIB_CHECK_VERSION(2, 16, 0)
void
mlton_g_test_bug (SML_CVECTOR_VAL(const char, bug_uri_snippet))
{
  g_test_bug (GET_SML_CVECTOR_VAL(const char, bug_uri_snippet));
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
void
mlton_g_test_bug_base (SML_CVECTOR_VAL(const char, uri_pattern))
{
  g_test_bug_base (GET_SML_CVECTOR_VAL(const char, uri_pattern));
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
void
mlton_g_test_expect_message (SML_CVECTOR_VAL(const gchar, log_domain),
                             GLogLevelFlags log_level,
                             SML_CVECTOR_VAL(const gchar, pattern))
{
  g_test_expect_message (GET_SML_CVECTOR_VAL(const gchar, log_domain),
                         log_level,
                         GET_SML_CVECTOR_VAL(const gchar, pattern));
}
#endif

#if GLIB_CHECK_VERSION(2, 38, 0)
void
mlton_g_test_incomplete (SML_CVECTOR_VAL(const gchar, msg))
{
  g_test_incomplete (GET_SML_CVECTOR_VAL(const gchar, msg));
}
#endif

#if GLIB_CHECK_VERSION(2, 38, 0)
void
mlton_g_test_skip (SML_CVECTOR_VAL(const gchar, msg))
{
  g_test_skip (GET_SML_CVECTOR_VAL(const gchar, msg));
}
#endif

void
mlton_g_test_trap_assertions (SML_CVECTOR_VAL(const char, domain),
                              SML_CVECTOR_VAL(const char, file),
                              int line,
                              SML_CVECTOR_VAL(const char, func),
                              guint64 assertion_flags,
                              SML_CVECTOR_VAL(const char, pattern))
{
  g_test_trap_assertions (GET_SML_CVECTOR_VAL(const char, domain),
                          GET_SML_CVECTOR_VAL(const char, file),
                          line,
                          GET_SML_CVECTOR_VAL(const char, func),
                          assertion_flags,
                          GET_SML_CVECTOR_VAL(const char, pattern));
}

#if GLIB_CHECK_VERSION(2, 38, 0)
void
mlton_g_test_trap_subprocess (SML_CVECTOR_VAL(const char, test_path),
                              guint64 usec_timeout,
                              GTestSubprocessFlags test_flags)
{
  g_test_trap_subprocess (GET_SML_CVECTOR_VAL(const char, test_path),
                          usec_timeout,
                          test_flags);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
int
mlton_g_unlink (SML_CVECTOR_VAL(gchar, filename))
{
  return g_unlink (GET_SML_CVECTOR_VAL(gchar, filename));
}
#endif

#if GLIB_CHECK_VERSION(2, 4, 0)
void
mlton_g_unsetenv (SML_CVECTOR_VAL(const gchar, variable))
{
  g_unsetenv (GET_SML_CVECTOR_VAL(const gchar, variable));
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
char*
mlton_g_uri_escape_string (SML_CVECTOR_VAL(const char, unescaped),
                           SML_CVECTOR_VAL(const char, reserved_chars_allowed),
                           gboolean allow_utf8)
{
  return g_uri_escape_string (GET_SML_CVECTOR_VAL(const char, unescaped),
                              GET_SML_CVECTOR_VAL(const char, reserved_chars_allowed),
                              allow_utf8);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
gchar**
mlton_g_uri_list_extract_uris (SML_CVECTOR_VAL(const gchar, uri_list))
{
  return g_uri_list_extract_uris (GET_SML_CVECTOR_VAL(const gchar, uri_list));
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
char*
mlton_g_uri_parse_scheme (SML_CVECTOR_VAL(const char, uri))
{
  return g_uri_parse_scheme (GET_SML_CVECTOR_VAL(const char, uri));
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
char*
mlton_g_uri_unescape_segment (SML_CVECTOR_VAL(const char, escaped_string),
                              SML_CVECTOR_VAL(const char, escaped_string_end),
                              SML_CVECTOR_VAL(const char, illegal_characters))
{
  return g_uri_unescape_segment (GET_SML_CVECTOR_VAL(const char, escaped_string),
                                 GET_SML_CVECTOR_VAL(const char, escaped_string_end),
                                 GET_SML_CVECTOR_VAL(const char, illegal_characters));
}
#endif

#if GLIB_CHECK_VERSION(2, 16, 0)
char*
mlton_g_uri_unescape_string (SML_CVECTOR_VAL(const char, escaped_string),
                             SML_CVECTOR_VAL(const char, illegal_characters))
{
  return g_uri_unescape_string (GET_SML_CVECTOR_VAL(const char, escaped_string),
                                GET_SML_CVECTOR_VAL(const char, illegal_characters));
}
#endif

gchar*
mlton_g_utf8_casefold (SML_CVECTOR_VAL(const gchar, str),
                       gssize len)
{
  return g_utf8_casefold (GET_SML_CVECTOR_VAL(const gchar, str),
                          len);
}

gint
mlton_g_utf8_collate (SML_CVECTOR_VAL(const gchar, str1),
                      SML_CVECTOR_VAL(const gchar, str2))
{
  return g_utf8_collate (GET_SML_CVECTOR_VAL(const gchar, str1),
                         GET_SML_CVECTOR_VAL(const gchar, str2));
}

gchar*
mlton_g_utf8_collate_key (SML_CVECTOR_VAL(const gchar, str),
                          gssize len)
{
  return g_utf8_collate_key (GET_SML_CVECTOR_VAL(const gchar, str),
                             len);
}

#if GLIB_CHECK_VERSION(2, 8, 0)
gchar*
mlton_g_utf8_collate_key_for_filename (SML_CVECTOR_VAL(const gchar, str),
                                       gssize len)
{
  return g_utf8_collate_key_for_filename (GET_SML_CVECTOR_VAL(const gchar, str),
                                          len);
}
#endif

gchar*
mlton_g_utf8_find_next_char (SML_CVECTOR_VAL(const gchar, p),
                             SML_CVECTOR_VAL(const gchar, end))
{
  return g_utf8_find_next_char (GET_SML_CVECTOR_VAL(const gchar, p),
                                GET_SML_CVECTOR_VAL(const gchar, end));
}

gchar*
mlton_g_utf8_find_prev_char (SML_CVECTOR_VAL(const gchar, str),
                             SML_CVECTOR_VAL(const gchar, p))
{
  return g_utf8_find_prev_char (GET_SML_CVECTOR_VAL(const gchar, str),
                                GET_SML_CVECTOR_VAL(const gchar, p));
}

gunichar
mlton_g_utf8_get_char (SML_CVECTOR_VAL(const gchar, p))
{
  return g_utf8_get_char (GET_SML_CVECTOR_VAL(const gchar, p));
}

gunichar
mlton_g_utf8_get_char_validated (SML_CVECTOR_VAL(const gchar, p),
                                 gssize max_len)
{
  return g_utf8_get_char_validated (GET_SML_CVECTOR_VAL(const gchar, p),
                                    max_len);
}

gchar*
mlton_g_utf8_normalize (SML_CVECTOR_VAL(const gchar, str),
                        gssize len,
                        GNormalizeMode mode)
{
  return g_utf8_normalize (GET_SML_CVECTOR_VAL(const gchar, str),
                           len,
                           mode);
}

gchar*
mlton_g_utf8_offset_to_pointer (SML_CVECTOR_VAL(const gchar, str),
                                glong offset)
{
  return g_utf8_offset_to_pointer (GET_SML_CVECTOR_VAL(const gchar, str),
                                   offset);
}

glong
mlton_g_utf8_pointer_to_offset (SML_CVECTOR_VAL(const gchar, str),
                                SML_CVECTOR_VAL(const gchar, pos))
{
  return g_utf8_pointer_to_offset (GET_SML_CVECTOR_VAL(const gchar, str),
                                   GET_SML_CVECTOR_VAL(const gchar, pos));
}

gchar*
mlton_g_utf8_prev_char (SML_CVECTOR_VAL(const gchar, p))
{
  return g_utf8_prev_char (GET_SML_CVECTOR_VAL(const gchar, p));
}

gchar*
mlton_g_utf8_strchr (SML_CVECTOR_VAL(const gchar, p),
                     gssize len,
                     gunichar c)
{
  return g_utf8_strchr (GET_SML_CVECTOR_VAL(const gchar, p),
                        len,
                        c);
}

gchar*
mlton_g_utf8_strdown (SML_CVECTOR_VAL(const gchar, str),
                      gssize len)
{
  return g_utf8_strdown (GET_SML_CVECTOR_VAL(const gchar, str),
                         len);
}

glong
mlton_g_utf8_strlen (SML_CVECTOR_VAL(const gchar, p),
                     gssize max)
{
  return g_utf8_strlen (GET_SML_CVECTOR_VAL(const gchar, p),
                        max);
}

gchar*
mlton_g_utf8_strncpy (SML_CVECTOR_VAL(gchar, dest),
                      SML_CVECTOR_VAL(const gchar, src),
                      gsize n)
{
  return g_utf8_strncpy (GET_SML_CVECTOR_VAL(gchar, dest),
                         GET_SML_CVECTOR_VAL(const gchar, src),
                         n);
}

gchar*
mlton_g_utf8_strrchr (SML_CVECTOR_VAL(const gchar, p),
                      gssize len,
                      gunichar c)
{
  return g_utf8_strrchr (GET_SML_CVECTOR_VAL(const gchar, p),
                         len,
                         c);
}

#if GLIB_CHECK_VERSION(2, 2, 0)
gchar*
mlton_g_utf8_strreverse (SML_CVECTOR_VAL(const gchar, str),
                         gssize len)
{
  return g_utf8_strreverse (GET_SML_CVECTOR_VAL(const gchar, str),
                            len);
}
#endif

gchar*
mlton_g_utf8_strup (SML_CVECTOR_VAL(const gchar, str),
                    gssize len)
{
  return g_utf8_strup (GET_SML_CVECTOR_VAL(const gchar, str),
                       len);
}

#if GLIB_CHECK_VERSION(2, 30, 0)
gchar*
mlton_g_utf8_substring (SML_CVECTOR_VAL(const gchar, str),
                        glong start_pos,
                        glong end_pos)
{
  return g_utf8_substring (GET_SML_CVECTOR_VAL(const gchar, str),
                           start_pos,
                           end_pos);
}
#endif

gunichar*
mlton_g_utf8_to_ucs4 (SML_CVECTOR_VAL(const gchar, str),
                      glong len,
                      glong* items_read,
                      glong* items_written,
                      GError** error)
{
  return g_utf8_to_ucs4 (GET_SML_CVECTOR_VAL(const gchar, str),
                         len,
                         items_read,
                         items_written,
                         error);
}

gunichar*
mlton_g_utf8_to_ucs4_fast (SML_CVECTOR_VAL(const gchar, str),
                           glong len,
                           glong* items_written)
{
  return g_utf8_to_ucs4_fast (GET_SML_CVECTOR_VAL(const gchar, str),
                              len,
                              items_written);
}

gunichar2*
mlton_g_utf8_to_utf16 (SML_CVECTOR_VAL(const gchar, str),
                       glong len,
                       glong* items_read,
                       glong* items_written,
                       GError** error)
{
  return g_utf8_to_utf16 (GET_SML_CVECTOR_VAL(const gchar, str),
                          len,
                          items_read,
                          items_written,
                          error);
}

gboolean
mlton_g_utf8_validate (SML_CVECTOR_VAL(gchar, str),
                       gssize max_len,
                       SML_CVECTOR_REF(const gchar, end))
{
  return g_utf8_validate (GET_SML_CVECTOR_VAL(gchar, str),
                          max_len,
                          GET_SML_CVECTOR_REF(const gchar, end));
}
