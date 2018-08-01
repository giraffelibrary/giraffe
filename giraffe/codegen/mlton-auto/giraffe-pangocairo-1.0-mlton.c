#include "cvector.h"
#include "cvectorvector.h"

#if PANGO_CHECK_VERSION(1, 22, 0)
void
mlton_pango_cairo_show_glyph_item (cairo_t* cr,
                                   SML_CVECTOR_VAL(const char, text),
                                   PangoGlyphItem* glyph_item)
{
  pango_cairo_show_glyph_item (cr,
                               GET_SML_CVECTOR_VAL(const char, text),
                               glyph_item);
}
#endif
