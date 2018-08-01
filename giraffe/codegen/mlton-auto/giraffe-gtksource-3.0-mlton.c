#include "cvector.h"
#include "cvectorvector.h"

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
gboolean
mlton_gtk_source_buffer_backward_iter_to_source_mark (GtkSourceBuffer* buffer,
                                                      GtkTextIter* iter,
                                                      SML_CVECTOR_VAL(const gchar, category))
{
  return gtk_source_buffer_backward_iter_to_source_mark (buffer,
                                                         iter,
                                                         GET_SML_CVECTOR_VAL(const gchar, category));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
GtkSourceMark*
mlton_gtk_source_buffer_create_source_mark (GtkSourceBuffer* buffer,
                                            SML_CVECTOR_VAL(const gchar, name),
                                            SML_CVECTOR_VAL(const gchar, category),
                                            const GtkTextIter* where)
{
  return gtk_source_buffer_create_source_mark (buffer,
                                               GET_SML_CVECTOR_VAL(const gchar, name),
                                               GET_SML_CVECTOR_VAL(const gchar, category),
                                               where);
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
gboolean
mlton_gtk_source_buffer_forward_iter_to_source_mark (GtkSourceBuffer* buffer,
                                                     GtkTextIter* iter,
                                                     SML_CVECTOR_VAL(const gchar, category))
{
  return gtk_source_buffer_forward_iter_to_source_mark (buffer,
                                                        iter,
                                                        GET_SML_CVECTOR_VAL(const gchar, category));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
GSList*
mlton_gtk_source_buffer_get_source_marks_at_iter (GtkSourceBuffer* buffer,
                                                  GtkTextIter* iter,
                                                  SML_CVECTOR_VAL(const gchar, category))
{
  return gtk_source_buffer_get_source_marks_at_iter (buffer,
                                                     iter,
                                                     GET_SML_CVECTOR_VAL(const gchar, category));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
GSList*
mlton_gtk_source_buffer_get_source_marks_at_line (GtkSourceBuffer* buffer,
                                                  gint line,
                                                  SML_CVECTOR_VAL(const gchar, category))
{
  return gtk_source_buffer_get_source_marks_at_line (buffer,
                                                     line,
                                                     GET_SML_CVECTOR_VAL(const gchar, category));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_source_buffer_iter_backward_to_context_class_toggle (GtkSourceBuffer* buffer,
                                                               GtkTextIter* iter,
                                                               SML_CVECTOR_VAL(const gchar, context_class))
{
  return gtk_source_buffer_iter_backward_to_context_class_toggle (buffer,
                                                                  iter,
                                                                  GET_SML_CVECTOR_VAL(const gchar, context_class));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_source_buffer_iter_forward_to_context_class_toggle (GtkSourceBuffer* buffer,
                                                              GtkTextIter* iter,
                                                              SML_CVECTOR_VAL(const gchar, context_class))
{
  return gtk_source_buffer_iter_forward_to_context_class_toggle (buffer,
                                                                 iter,
                                                                 GET_SML_CVECTOR_VAL(const gchar, context_class));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_source_buffer_iter_has_context_class (GtkSourceBuffer* buffer,
                                                const GtkTextIter* iter,
                                                SML_CVECTOR_VAL(const gchar, context_class))
{
  return gtk_source_buffer_iter_has_context_class (buffer,
                                                   iter,
                                                   GET_SML_CVECTOR_VAL(const gchar, context_class));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
void
mlton_gtk_source_buffer_remove_source_marks (GtkSourceBuffer* buffer,
                                             const GtkTextIter* start,
                                             const GtkTextIter* end,
                                             SML_CVECTOR_VAL(const gchar, category))
{
  gtk_source_buffer_remove_source_marks (buffer,
                                         start,
                                         end,
                                         GET_SML_CVECTOR_VAL(const gchar, category));
}
#endif

GtkSourceCompletionItem*
mlton_gtk_source_completion_item_new (SML_CVECTOR_VAL(const gchar, label),
                                      SML_CVECTOR_VAL(const gchar, text),
                                      GdkPixbuf* icon,
                                      SML_CVECTOR_VAL(const gchar, info))
{
  return gtk_source_completion_item_new (GET_SML_CVECTOR_VAL(const gchar, label),
                                         GET_SML_CVECTOR_VAL(const gchar, text),
                                         icon,
                                         GET_SML_CVECTOR_VAL(const gchar, info));
}

GtkSourceCompletionItem*
mlton_gtk_source_completion_item_new_from_stock (SML_CVECTOR_VAL(const gchar, label),
                                                 SML_CVECTOR_VAL(const gchar, text),
                                                 SML_CVECTOR_VAL(const gchar, stock),
                                                 SML_CVECTOR_VAL(const gchar, info))
{
  return gtk_source_completion_item_new_from_stock (GET_SML_CVECTOR_VAL(const gchar, label),
                                                    GET_SML_CVECTOR_VAL(const gchar, text),
                                                    GET_SML_CVECTOR_VAL(const gchar, stock),
                                                    GET_SML_CVECTOR_VAL(const gchar, info));
}

GtkSourceCompletionItem*
mlton_gtk_source_completion_item_new_with_markup (SML_CVECTOR_VAL(const gchar, markup),
                                                  SML_CVECTOR_VAL(const gchar, text),
                                                  GdkPixbuf* icon,
                                                  SML_CVECTOR_VAL(const gchar, info))
{
  return gtk_source_completion_item_new_with_markup (GET_SML_CVECTOR_VAL(const gchar, markup),
                                                     GET_SML_CVECTOR_VAL(const gchar, text),
                                                     icon,
                                                     GET_SML_CVECTOR_VAL(const gchar, info));
}

GtkSourceCompletionWords*
mlton_gtk_source_completion_words_new (SML_CVECTOR_VAL(const gchar, name),
                                       GdkPixbuf* icon)
{
  return gtk_source_completion_words_new (GET_SML_CVECTOR_VAL(const gchar, name),
                                          icon);
}

#if GTK_SOURCE_CHECK_VERSION(3, 14, 0)
const GtkSourceEncoding*
mlton_gtk_source_encoding_get_from_charset (SML_CVECTOR_VAL(const gchar, charset))
{
  return gtk_source_encoding_get_from_charset (GET_SML_CVECTOR_VAL(const gchar, charset));
}
#endif

void
mlton_gtk_source_gutter_renderer_pixbuf_set_icon_name (GtkSourceGutterRendererPixbuf* renderer,
                                                       SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_source_gutter_renderer_pixbuf_set_icon_name (renderer,
                                                   GET_SML_CVECTOR_VAL(const gchar, icon_name));
}

void
mlton_gtk_source_gutter_renderer_pixbuf_set_stock_id (GtkSourceGutterRendererPixbuf* renderer,
                                                      SML_CVECTOR_VAL(const gchar, stock_id))
{
  gtk_source_gutter_renderer_pixbuf_set_stock_id (renderer,
                                                  GET_SML_CVECTOR_VAL(const gchar, stock_id));
}

void
mlton_gtk_source_gutter_renderer_text_measure (GtkSourceGutterRendererText* renderer,
                                               SML_CVECTOR_VAL(const gchar, text),
                                               gint* width,
                                               gint* height)
{
  gtk_source_gutter_renderer_text_measure (renderer,
                                           GET_SML_CVECTOR_VAL(const gchar, text),
                                           width,
                                           height);
}

void
mlton_gtk_source_gutter_renderer_text_measure_markup (GtkSourceGutterRendererText* renderer,
                                                      SML_CVECTOR_VAL(const gchar, markup),
                                                      gint* width,
                                                      gint* height)
{
  gtk_source_gutter_renderer_text_measure_markup (renderer,
                                                  GET_SML_CVECTOR_VAL(const gchar, markup),
                                                  width,
                                                  height);
}

void
mlton_gtk_source_gutter_renderer_text_set_markup (GtkSourceGutterRendererText* renderer,
                                                  SML_CVECTOR_VAL(const gchar, markup),
                                                  gint length)
{
  gtk_source_gutter_renderer_text_set_markup (renderer,
                                              GET_SML_CVECTOR_VAL(const gchar, markup),
                                              length);
}

void
mlton_gtk_source_gutter_renderer_text_set_text (GtkSourceGutterRendererText* renderer,
                                                SML_CVECTOR_VAL(const gchar, text),
                                                gint length)
{
  gtk_source_gutter_renderer_text_set_text (renderer,
                                            GET_SML_CVECTOR_VAL(const gchar, text),
                                            length);
}

const gchar*
mlton_gtk_source_language_get_metadata (GtkSourceLanguage* language,
                                        SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_source_language_get_metadata (language,
                                           GET_SML_CVECTOR_VAL(const gchar, name));
}

#if GTK_SOURCE_CHECK_VERSION(3, 4, 0)
const gchar*
mlton_gtk_source_language_get_style_fallback (GtkSourceLanguage* language,
                                              SML_CVECTOR_VAL(const gchar, style_id))
{
  return gtk_source_language_get_style_fallback (language,
                                                 GET_SML_CVECTOR_VAL(const gchar, style_id));
}
#endif

const gchar*
mlton_gtk_source_language_get_style_name (GtkSourceLanguage* language,
                                          SML_CVECTOR_VAL(const gchar, style_id))
{
  return gtk_source_language_get_style_name (language,
                                             GET_SML_CVECTOR_VAL(const gchar, style_id));
}

GtkSourceLanguage*
mlton_gtk_source_language_manager_get_language (GtkSourceLanguageManager* lm,
                                                SML_CVECTOR_VAL(const gchar, id))
{
  return gtk_source_language_manager_get_language (lm,
                                                   GET_SML_CVECTOR_VAL(const gchar, id));
}

#if GTK_SOURCE_CHECK_VERSION(2, 4, 0)
GtkSourceLanguage*
mlton_gtk_source_language_manager_guess_language (GtkSourceLanguageManager* lm,
                                                  SML_CVECTOR_VAL(const gchar, filename),
                                                  SML_CVECTOR_VAL(const gchar, content_type))
{
  return gtk_source_language_manager_guess_language (lm,
                                                     GET_SML_CVECTOR_VAL(const gchar, filename),
                                                     GET_SML_CVECTOR_VAL(const gchar, content_type));
}
#endif

void
mlton_gtk_source_language_manager_set_search_path (GtkSourceLanguageManager* lm,
                                                   SML_CVECTORVECTOR_VAL(gchar, dirs))
{
  gtk_source_language_manager_set_search_path (lm,
                                               GET_SML_CVECTORVECTOR_VAL(gchar, dirs));
}

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
GtkSourceMark*
mlton_gtk_source_mark_new (SML_CVECTOR_VAL(const gchar, name),
                           SML_CVECTOR_VAL(const gchar, category))
{
  return gtk_source_mark_new (GET_SML_CVECTOR_VAL(const gchar, name),
                              GET_SML_CVECTOR_VAL(const gchar, category));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
GtkSourceMark*
mlton_gtk_source_mark_next (GtkSourceMark* mark,
                            SML_CVECTOR_VAL(const gchar, category))
{
  return gtk_source_mark_next (mark,
                               GET_SML_CVECTOR_VAL(const gchar, category));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
GtkSourceMark*
mlton_gtk_source_mark_prev (GtkSourceMark* mark,
                            SML_CVECTOR_VAL(const gchar, category))
{
  return gtk_source_mark_prev (mark,
                               GET_SML_CVECTOR_VAL(const gchar, category));
}
#endif

void
mlton_gtk_source_mark_attributes_set_icon_name (GtkSourceMarkAttributes* attributes,
                                                SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_source_mark_attributes_set_icon_name (attributes,
                                            GET_SML_CVECTOR_VAL(const gchar, icon_name));
}

void
mlton_gtk_source_mark_attributes_set_stock_id (GtkSourceMarkAttributes* attributes,
                                               SML_CVECTOR_VAL(const gchar, stock_id))
{
  gtk_source_mark_attributes_set_stock_id (attributes,
                                           GET_SML_CVECTOR_VAL(const gchar, stock_id));
}

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
void
mlton_gtk_source_print_compositor_set_body_font_name (GtkSourcePrintCompositor* compositor,
                                                      SML_CVECTOR_VAL(const gchar, font_name))
{
  gtk_source_print_compositor_set_body_font_name (compositor,
                                                  GET_SML_CVECTOR_VAL(const gchar, font_name));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
void
mlton_gtk_source_print_compositor_set_footer_font_name (GtkSourcePrintCompositor* compositor,
                                                        SML_CVECTOR_VAL(const gchar, font_name))
{
  gtk_source_print_compositor_set_footer_font_name (compositor,
                                                    GET_SML_CVECTOR_VAL(const gchar, font_name));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
void
mlton_gtk_source_print_compositor_set_footer_format (GtkSourcePrintCompositor* compositor,
                                                     gboolean separator,
                                                     SML_CVECTOR_VAL(const gchar, left),
                                                     SML_CVECTOR_VAL(const gchar, center),
                                                     SML_CVECTOR_VAL(const gchar, right))
{
  gtk_source_print_compositor_set_footer_format (compositor,
                                                 separator,
                                                 GET_SML_CVECTOR_VAL(const gchar, left),
                                                 GET_SML_CVECTOR_VAL(const gchar, center),
                                                 GET_SML_CVECTOR_VAL(const gchar, right));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
void
mlton_gtk_source_print_compositor_set_header_font_name (GtkSourcePrintCompositor* compositor,
                                                        SML_CVECTOR_VAL(const gchar, font_name))
{
  gtk_source_print_compositor_set_header_font_name (compositor,
                                                    GET_SML_CVECTOR_VAL(const gchar, font_name));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
void
mlton_gtk_source_print_compositor_set_header_format (GtkSourcePrintCompositor* compositor,
                                                     gboolean separator,
                                                     SML_CVECTOR_VAL(const gchar, left),
                                                     SML_CVECTOR_VAL(const gchar, center),
                                                     SML_CVECTOR_VAL(const gchar, right))
{
  gtk_source_print_compositor_set_header_format (compositor,
                                                 separator,
                                                 GET_SML_CVECTOR_VAL(const gchar, left),
                                                 GET_SML_CVECTOR_VAL(const gchar, center),
                                                 GET_SML_CVECTOR_VAL(const gchar, right));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 2, 0)
void
mlton_gtk_source_print_compositor_set_line_numbers_font_name (GtkSourcePrintCompositor* compositor,
                                                              SML_CVECTOR_VAL(const gchar, font_name))
{
  gtk_source_print_compositor_set_line_numbers_font_name (compositor,
                                                          GET_SML_CVECTOR_VAL(const gchar, font_name));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(3, 10, 0)
gboolean
mlton_gtk_source_search_context_replace (GtkSourceSearchContext* search,
                                         const GtkTextIter* match_start,
                                         const GtkTextIter* match_end,
                                         SML_CVECTOR_VAL(const gchar, replace),
                                         gint replace_length,
                                         GError** error)
{
  return gtk_source_search_context_replace (search,
                                            match_start,
                                            match_end,
                                            GET_SML_CVECTOR_VAL(const gchar, replace),
                                            replace_length,
                                            error);
}
#endif

#if GTK_SOURCE_CHECK_VERSION(3, 22, 0)
gboolean
mlton_gtk_source_search_context_replace2 (GtkSourceSearchContext* search,
                                          GtkTextIter* match_start,
                                          GtkTextIter* match_end,
                                          SML_CVECTOR_VAL(const gchar, replace),
                                          gint replace_length,
                                          GError** error)
{
  return gtk_source_search_context_replace2 (search,
                                             match_start,
                                             match_end,
                                             GET_SML_CVECTOR_VAL(const gchar, replace),
                                             replace_length,
                                             error);
}
#endif

#if GTK_SOURCE_CHECK_VERSION(3, 10, 0)
guint
mlton_gtk_source_search_context_replace_all (GtkSourceSearchContext* search,
                                             SML_CVECTOR_VAL(const gchar, replace),
                                             gint replace_length,
                                             GError** error)
{
  return gtk_source_search_context_replace_all (search,
                                                GET_SML_CVECTOR_VAL(const gchar, replace),
                                                replace_length,
                                                error);
}
#endif

#if GTK_SOURCE_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_source_search_settings_set_search_text (GtkSourceSearchSettings* settings,
                                                  SML_CVECTOR_VAL(const gchar, search_text))
{
  gtk_source_search_settings_set_search_text (settings,
                                              GET_SML_CVECTOR_VAL(const gchar, search_text));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(2, 0, 0)
GtkSourceStyle*
mlton_gtk_source_style_scheme_get_style (GtkSourceStyleScheme* scheme,
                                         SML_CVECTOR_VAL(const gchar, style_id))
{
  return gtk_source_style_scheme_get_style (scheme,
                                            GET_SML_CVECTOR_VAL(const gchar, style_id));
}
#endif

void
mlton_gtk_source_style_scheme_manager_append_search_path (GtkSourceStyleSchemeManager* manager,
                                                          SML_CVECTOR_VAL(const gchar, path))
{
  gtk_source_style_scheme_manager_append_search_path (manager,
                                                      GET_SML_CVECTOR_VAL(const gchar, path));
}

GtkSourceStyleScheme*
mlton_gtk_source_style_scheme_manager_get_scheme (GtkSourceStyleSchemeManager* manager,
                                                  SML_CVECTOR_VAL(const gchar, scheme_id))
{
  return gtk_source_style_scheme_manager_get_scheme (manager,
                                                     GET_SML_CVECTOR_VAL(const gchar, scheme_id));
}

void
mlton_gtk_source_style_scheme_manager_prepend_search_path (GtkSourceStyleSchemeManager* manager,
                                                           SML_CVECTOR_VAL(const gchar, path))
{
  gtk_source_style_scheme_manager_prepend_search_path (manager,
                                                       GET_SML_CVECTOR_VAL(const gchar, path));
}

void
mlton_gtk_source_style_scheme_manager_set_search_path (GtkSourceStyleSchemeManager* manager,
                                                       SML_CVECTORVECTOR_VAL(gchar, path))
{
  gtk_source_style_scheme_manager_set_search_path (manager,
                                                   GET_SML_CVECTORVECTOR_VAL(gchar, path));
}

#if GTK_SOURCE_CHECK_VERSION(3, 20, 0)
GtkTextTag*
mlton_gtk_source_tag_new (SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_source_tag_new (GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

GtkSourceMarkAttributes*
mlton_gtk_source_view_get_mark_attributes (GtkSourceView* view,
                                           SML_CVECTOR_VAL(const gchar, category),
                                           gint* priority)
{
  return gtk_source_view_get_mark_attributes (view,
                                              GET_SML_CVECTOR_VAL(const gchar, category),
                                              priority);
}

void
mlton_gtk_source_view_set_mark_attributes (GtkSourceView* view,
                                           SML_CVECTOR_VAL(const gchar, category),
                                           GtkSourceMarkAttributes* attributes,
                                           gint priority)
{
  gtk_source_view_set_mark_attributes (view,
                                       GET_SML_CVECTOR_VAL(const gchar, category),
                                       attributes,
                                       priority);
}

#if GTK_SOURCE_CHECK_VERSION(3, 10, 0)
gchar*
mlton_gtk_source_utils_escape_search_text (SML_CVECTOR_VAL(const gchar, text))
{
  return gtk_source_utils_escape_search_text (GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_SOURCE_CHECK_VERSION(3, 10, 0)
gchar*
mlton_gtk_source_utils_unescape_search_text (SML_CVECTOR_VAL(const gchar, text))
{
  return gtk_source_utils_unescape_search_text (GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif
