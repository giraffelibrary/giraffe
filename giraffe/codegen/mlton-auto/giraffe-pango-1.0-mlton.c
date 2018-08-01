#include "cvector.h"
#include "cvectorvector.h"

PangoAttrType
mlton_pango_attr_type_register (SML_CVECTOR_VAL(const gchar, name))
{
  return pango_attr_type_register (GET_SML_CVECTOR_VAL(const gchar, name));
}

gboolean
mlton_pango_color_parse (PangoColor* color,
                         SML_CVECTOR_VAL(const char, spec))
{
  return pango_color_parse (color,
                            GET_SML_CVECTOR_VAL(const char, spec));
}

void
mlton_pango_context_list_families (PangoContext* context,
                                   SML_CVECTOR_REF(PangoFontFamily*, families),
                                   int* n_families)
{
  pango_context_list_families (context,
                               GET_SML_CVECTOR_REF(PangoFontFamily*, families),
                               n_families);
}

void
mlton_pango_coverage_to_bytes (PangoCoverage* coverage,
                               SML_CVECTOR_REF(guchar, bytes),
                               int* n_bytes)
{
  pango_coverage_to_bytes (coverage,
                           GET_SML_CVECTOR_REF(guchar, bytes),
                           n_bytes);
}

void
mlton_pango_font_descriptions_free (SML_CVECTOR_VAL(PangoFontDescription*, descs),
                                    int n_descs)
{
  pango_font_descriptions_free (GET_SML_CVECTOR_VAL(PangoFontDescription*, descs),
                                n_descs);
}

void
mlton_pango_font_description_set_family (PangoFontDescription* desc,
                                         SML_CVECTOR_VAL(const char, family))
{
  pango_font_description_set_family (desc,
                                     GET_SML_CVECTOR_VAL(const char, family));
}

void
mlton_pango_font_description_set_family_static (PangoFontDescription* desc,
                                                SML_CVECTOR_VAL(const char, family))
{
  pango_font_description_set_family_static (desc,
                                            GET_SML_CVECTOR_VAL(const char, family));
}

PangoFontDescription*
mlton_pango_font_description_from_string (SML_CVECTOR_VAL(const char, str))
{
  return pango_font_description_from_string (GET_SML_CVECTOR_VAL(const char, str));
}

#if PANGO_CHECK_VERSION(1, 4, 0)
void
mlton_pango_font_face_list_sizes (PangoFontFace* face,
                                  SML_CVECTOR_REF(int, sizes),
                                  int* n_sizes)
{
  pango_font_face_list_sizes (face,
                              GET_SML_CVECTOR_REF(int, sizes),
                              n_sizes);
}
#endif

void
mlton_pango_font_family_list_faces (PangoFontFamily* family,
                                    SML_CVECTOR_REF(PangoFontFace*, faces),
                                    int* n_faces)
{
  pango_font_family_list_faces (family,
                                GET_SML_CVECTOR_REF(PangoFontFace*, faces),
                                n_faces);
}

void
mlton_pango_font_map_list_families (PangoFontMap* fontmap,
                                    SML_CVECTOR_REF(PangoFontFamily*, families),
                                    int* n_families)
{
  pango_font_map_list_families (fontmap,
                                GET_SML_CVECTOR_REF(PangoFontFamily*, families),
                                n_families);
}

#if PANGO_CHECK_VERSION(1, 2, 0)
GSList*
mlton_pango_glyph_item_apply_attrs (PangoGlyphItem* glyph_item,
                                    SML_CVECTOR_VAL(const char, text),
                                    PangoAttrList* list)
{
  return pango_glyph_item_apply_attrs (glyph_item,
                                       GET_SML_CVECTOR_VAL(const char, text),
                                       list);
}
#endif

#if PANGO_CHECK_VERSION(1, 26, 0)
void
mlton_pango_glyph_item_get_logical_widths (PangoGlyphItem* glyph_item,
                                           SML_CVECTOR_VAL(const char, text),
                                           SML_CVECTOR_VAL(int, logical_widths))
{
  pango_glyph_item_get_logical_widths (glyph_item,
                                       GET_SML_CVECTOR_VAL(const char, text),
                                       GET_SML_CVECTOR_VAL(int, logical_widths));
}
#endif

#if PANGO_CHECK_VERSION(1, 6, 0)
void
mlton_pango_glyph_item_letter_space (PangoGlyphItem* glyph_item,
                                     SML_CVECTOR_VAL(const char, text),
                                     SML_CVECTOR_VAL(PangoLogAttr, log_attrs),
                                     int letter_spacing)
{
  pango_glyph_item_letter_space (glyph_item,
                                 GET_SML_CVECTOR_VAL(const char, text),
                                 GET_SML_CVECTOR_VAL(PangoLogAttr, log_attrs),
                                 letter_spacing);
}
#endif

#if PANGO_CHECK_VERSION(1, 2, 0)
PangoGlyphItem*
mlton_pango_glyph_item_split (PangoGlyphItem* orig,
                              SML_CVECTOR_VAL(const char, text),
                              int split_index)
{
  return pango_glyph_item_split (orig,
                                 GET_SML_CVECTOR_VAL(const char, text),
                                 split_index);
}
#endif

#if PANGO_CHECK_VERSION(1, 22, 0)
gboolean
mlton_pango_glyph_item_iter_init_end (PangoGlyphItemIter* iter,
                                      PangoGlyphItem* glyph_item,
                                      SML_CVECTOR_VAL(const char, text))
{
  return pango_glyph_item_iter_init_end (iter,
                                         glyph_item,
                                         GET_SML_CVECTOR_VAL(const char, text));
}
#endif

#if PANGO_CHECK_VERSION(1, 22, 0)
gboolean
mlton_pango_glyph_item_iter_init_start (PangoGlyphItemIter* iter,
                                        PangoGlyphItem* glyph_item,
                                        SML_CVECTOR_VAL(const char, text))
{
  return pango_glyph_item_iter_init_start (iter,
                                           glyph_item,
                                           GET_SML_CVECTOR_VAL(const char, text));
}
#endif

void
mlton_pango_glyph_string_get_logical_widths (PangoGlyphString* glyphs,
                                             SML_CVECTOR_VAL(const char, text),
                                             int length,
                                             int embedding_level,
                                             SML_CVECTOR_VAL(int, logical_widths))
{
  pango_glyph_string_get_logical_widths (glyphs,
                                         GET_SML_CVECTOR_VAL(const char, text),
                                         length,
                                         embedding_level,
                                         GET_SML_CVECTOR_VAL(int, logical_widths));
}

void
mlton_pango_glyph_string_index_to_x (PangoGlyphString* glyphs,
                                     SML_CVECTOR_VAL(char, text),
                                     int length,
                                     PangoAnalysis* analysis,
                                     int index_,
                                     gboolean trailing,
                                     int* x_pos)
{
  pango_glyph_string_index_to_x (glyphs,
                                 GET_SML_CVECTOR_VAL(char, text),
                                 length,
                                 analysis,
                                 index_,
                                 trailing,
                                 x_pos);
}

void
mlton_pango_glyph_string_x_to_index (PangoGlyphString* glyphs,
                                     SML_CVECTOR_VAL(char, text),
                                     int length,
                                     PangoAnalysis* analysis,
                                     int x_pos,
                                     int* index_,
                                     int* trailing)
{
  pango_glyph_string_x_to_index (glyphs,
                                 GET_SML_CVECTOR_VAL(char, text),
                                 length,
                                 analysis,
                                 x_pos,
                                 index_,
                                 trailing);
}

gboolean
mlton_pango_language_matches (PangoLanguage* language,
                              SML_CVECTOR_VAL(const char, range_list))
{
  return pango_language_matches (language,
                                 GET_SML_CVECTOR_VAL(const char, range_list));
}

PangoLanguage*
mlton_pango_language_from_string (SML_CVECTOR_VAL(const char, language))
{
  return pango_language_from_string (GET_SML_CVECTOR_VAL(const char, language));
}

void
mlton_pango_layout_get_log_attrs (PangoLayout* layout,
                                  SML_CVECTOR_REF(PangoLogAttr, attrs),
                                  gint* n_attrs)
{
  pango_layout_get_log_attrs (layout,
                              GET_SML_CVECTOR_REF(PangoLogAttr, attrs),
                              n_attrs);
}

void
mlton_pango_layout_set_markup (PangoLayout* layout,
                               SML_CVECTOR_VAL(const char, markup),
                               int length)
{
  pango_layout_set_markup (layout,
                           GET_SML_CVECTOR_VAL(const char, markup),
                           length);
}

void
mlton_pango_layout_set_markup_with_accel (PangoLayout* layout,
                                          SML_CVECTOR_VAL(const char, markup),
                                          int length,
                                          gunichar accel_marker,
                                          gunichar* accel_char)
{
  pango_layout_set_markup_with_accel (layout,
                                      GET_SML_CVECTOR_VAL(const char, markup),
                                      length,
                                      accel_marker,
                                      accel_char);
}

void
mlton_pango_layout_set_text (PangoLayout* layout,
                             SML_CVECTOR_VAL(const char, text),
                             int length)
{
  pango_layout_set_text (layout,
                         GET_SML_CVECTOR_VAL(const char, text),
                         length);
}

void
mlton_pango_layout_line_get_x_ranges (PangoLayoutLine* line,
                                      int start_index,
                                      int end_index,
                                      SML_CVECTOR_REF(int, ranges),
                                      int* n_ranges)
{
  pango_layout_line_get_x_ranges (line,
                                  start_index,
                                  end_index,
                                  GET_SML_CVECTOR_REF(int, ranges),
                                  n_ranges);
}

#if PANGO_CHECK_VERSION(1, 22, 0)
void
mlton_pango_renderer_draw_glyph_item (PangoRenderer* renderer,
                                      SML_CVECTOR_VAL(const char, text),
                                      PangoGlyphItem* glyph_item,
                                      int x,
                                      int y)
{
  pango_renderer_draw_glyph_item (renderer,
                                  GET_SML_CVECTOR_VAL(const char, text),
                                  glyph_item,
                                  x,
                                  y);
}
#endif

#if PANGO_CHECK_VERSION(1, 4, 0)
void
mlton_pango_script_iter_get_range (PangoScriptIter* iter,
                                   SML_CVECTOR_REF(const char, start),
                                   SML_CVECTOR_REF(const char, end),
                                   PangoScript* script)
{
  pango_script_iter_get_range (iter,
                               GET_SML_CVECTOR_REF(const char, start),
                               GET_SML_CVECTOR_REF(const char, end),
                               script);
}
#endif

void
mlton_pango_tab_array_get_tabs (PangoTabArray* tab_array,
                                PangoTabAlign** alignments,
                                SML_CVECTOR_REF(gint, locations))
{
  pango_tab_array_get_tabs (tab_array,
                            alignments,
                            GET_SML_CVECTOR_REF(gint, locations));
}

void
mlton_pango_break (SML_CVECTOR_VAL(const gchar, text),
                   int length,
                   PangoAnalysis* analysis,
                   SML_CVECTOR_VAL(PangoLogAttr, attrs),
                   int attrs_len)
{
  pango_break (GET_SML_CVECTOR_VAL(const gchar, text),
               length,
               analysis,
               GET_SML_CVECTOR_VAL(PangoLogAttr, attrs),
               attrs_len);
}

char*
mlton_pango_config_key_get (SML_CVECTOR_VAL(const char, key))
{
  return pango_config_key_get (GET_SML_CVECTOR_VAL(const char, key));
}

char*
mlton_pango_config_key_get_system (SML_CVECTOR_VAL(const char, key))
{
  return pango_config_key_get_system (GET_SML_CVECTOR_VAL(const char, key));
}

void
mlton_pango_default_break (SML_CVECTOR_VAL(const gchar, text),
                           int length,
                           PangoAnalysis* analysis,
                           PangoLogAttr* attrs,
                           int attrs_len)
{
  pango_default_break (GET_SML_CVECTOR_VAL(const gchar, text),
                       length,
                       analysis,
                       attrs,
                       attrs_len);
}

#if PANGO_CHECK_VERSION(1, 4, 0)
PangoDirection
mlton_pango_find_base_dir (SML_CVECTOR_VAL(const gchar, text),
                           gint length)
{
  return pango_find_base_dir (GET_SML_CVECTOR_VAL(const gchar, text),
                              length);
}
#endif

void
mlton_pango_find_paragraph_boundary (SML_CVECTOR_VAL(const gchar, text),
                                     gint length,
                                     gint* paragraph_delimiter_index,
                                     gint* next_paragraph_start)
{
  pango_find_paragraph_boundary (GET_SML_CVECTOR_VAL(const gchar, text),
                                 length,
                                 paragraph_delimiter_index,
                                 next_paragraph_start);
}

void
mlton_pango_get_log_attrs (SML_CVECTOR_VAL(const char, text),
                           int length,
                           int level,
                           PangoLanguage* language,
                           SML_CVECTOR_VAL(PangoLogAttr, log_attrs),
                           int attrs_len)
{
  pango_get_log_attrs (GET_SML_CVECTOR_VAL(const char, text),
                       length,
                       level,
                       language,
                       GET_SML_CVECTOR_VAL(PangoLogAttr, log_attrs),
                       attrs_len);
}

GList*
mlton_pango_itemize (PangoContext* context,
                     SML_CVECTOR_VAL(const char, text),
                     int start_index,
                     int length,
                     PangoAttrList* attrs,
                     PangoAttrIterator* cached_iter)
{
  return pango_itemize (context,
                        GET_SML_CVECTOR_VAL(const char, text),
                        start_index,
                        length,
                        attrs,
                        cached_iter);
}

#if PANGO_CHECK_VERSION(1, 4, 0)
GList*
mlton_pango_itemize_with_base_dir (PangoContext* context,
                                   PangoDirection base_dir,
                                   SML_CVECTOR_VAL(const char, text),
                                   int start_index,
                                   int length,
                                   PangoAttrList* attrs,
                                   PangoAttrIterator* cached_iter)
{
  return pango_itemize_with_base_dir (context,
                                      base_dir,
                                      GET_SML_CVECTOR_VAL(const char, text),
                                      start_index,
                                      length,
                                      attrs,
                                      cached_iter);
}
#endif

#if PANGO_CHECK_VERSION(1, 4, 0)
guint8*
mlton_pango_log2vis_get_embedding_levels (SML_CVECTOR_VAL(const gchar, text),
                                          int length,
                                          PangoDirection* pbase_dir)
{
  return pango_log2vis_get_embedding_levels (GET_SML_CVECTOR_VAL(const gchar, text),
                                             length,
                                             pbase_dir);
}
#endif

void
mlton_pango_lookup_aliases (SML_CVECTOR_VAL(const char, fontname),
                            SML_CVECTORVECTOR_REF(char, families),
                            int* n_families)
{
  pango_lookup_aliases (GET_SML_CVECTOR_VAL(const char, fontname),
                        GET_SML_CVECTORVECTOR_REF(char, families),
                        n_families);
}

#if PANGO_CHECK_VERSION(1, 31, 0)
gboolean
mlton_pango_markup_parser_finish (GMarkupParseContext* context,
                                  PangoAttrList** attr_list,
                                  SML_CVECTOR_REF(char, text),
                                  gunichar* accel_char,
                                  GError** error)
{
  return pango_markup_parser_finish (context,
                                     attr_list,
                                     GET_SML_CVECTOR_REF(char, text),
                                     accel_char,
                                     error);
}
#endif

#if PANGO_CHECK_VERSION(1, 16, 0)
gboolean
mlton_pango_parse_enum (GType type,
                        SML_CVECTOR_VAL(const char, str),
                        int* value,
                        gboolean warn,
                        SML_CVECTOR_REF(char, possible_values))
{
  return pango_parse_enum (type,
                           GET_SML_CVECTOR_VAL(const char, str),
                           value,
                           warn,
                           GET_SML_CVECTOR_REF(char, possible_values));
}
#endif

gboolean
mlton_pango_parse_markup (SML_CVECTOR_VAL(const char, markup_text),
                          int length,
                          gunichar accel_marker,
                          PangoAttrList** attr_list,
                          SML_CVECTOR_REF(char, text),
                          gunichar* accel_char,
                          GError** error)
{
  return pango_parse_markup (GET_SML_CVECTOR_VAL(const char, markup_text),
                             length,
                             accel_marker,
                             attr_list,
                             GET_SML_CVECTOR_REF(char, text),
                             accel_char,
                             error);
}

gboolean
mlton_pango_parse_stretch (SML_CVECTOR_VAL(const char, str),
                           PangoStretch* stretch,
                           gboolean warn)
{
  return pango_parse_stretch (GET_SML_CVECTOR_VAL(const char, str),
                              stretch,
                              warn);
}

gboolean
mlton_pango_parse_style (SML_CVECTOR_VAL(const char, str),
                         PangoStyle* style,
                         gboolean warn)
{
  return pango_parse_style (GET_SML_CVECTOR_VAL(const char, str),
                            style,
                            warn);
}

gboolean
mlton_pango_parse_variant (SML_CVECTOR_VAL(const char, str),
                           PangoVariant* variant,
                           gboolean warn)
{
  return pango_parse_variant (GET_SML_CVECTOR_VAL(const char, str),
                              variant,
                              warn);
}

gboolean
mlton_pango_parse_weight (SML_CVECTOR_VAL(const char, str),
                          PangoWeight* weight,
                          gboolean warn)
{
  return pango_parse_weight (GET_SML_CVECTOR_VAL(const char, str),
                             weight,
                             warn);
}

gboolean
mlton_pango_scan_int (SML_CVECTOR_REF(const char, pos),
                      int* out)
{
  return pango_scan_int (GET_SML_CVECTOR_REF(const char, pos),
                         out);
}

gboolean
mlton_pango_scan_string (SML_CVECTOR_REF(const char, pos),
                         GString* out)
{
  return pango_scan_string (GET_SML_CVECTOR_REF(const char, pos),
                            out);
}

gboolean
mlton_pango_scan_word (SML_CVECTOR_REF(const char, pos),
                       GString* out)
{
  return pango_scan_word (GET_SML_CVECTOR_REF(const char, pos),
                          out);
}

void
mlton_pango_shape (SML_CVECTOR_VAL(const gchar, text),
                   gint length,
                   const PangoAnalysis* analysis,
                   PangoGlyphString* glyphs)
{
  pango_shape (GET_SML_CVECTOR_VAL(const gchar, text),
               length,
               analysis,
               glyphs);
}

#if PANGO_CHECK_VERSION(1, 32, 0)
void
mlton_pango_shape_full (SML_CVECTOR_VAL(const gchar, item_text),
                        gint item_length,
                        SML_CVECTOR_VAL(const gchar, paragraph_text),
                        gint paragraph_length,
                        const PangoAnalysis* analysis,
                        PangoGlyphString* glyphs)
{
  pango_shape_full (GET_SML_CVECTOR_VAL(const gchar, item_text),
                    item_length,
                    GET_SML_CVECTOR_VAL(const gchar, paragraph_text),
                    paragraph_length,
                    analysis,
                    glyphs);
}
#endif

gboolean
mlton_pango_skip_space (SML_CVECTOR_REF(const char, pos))
{
  return pango_skip_space (GET_SML_CVECTOR_REF(const char, pos));
}

char**
mlton_pango_split_file_list (SML_CVECTOR_VAL(const char, str))
{
  return pango_split_file_list (GET_SML_CVECTOR_VAL(const char, str));
}

char*
mlton_pango_trim_string (SML_CVECTOR_VAL(const char, str))
{
  return pango_trim_string (GET_SML_CVECTOR_VAL(const char, str));
}
