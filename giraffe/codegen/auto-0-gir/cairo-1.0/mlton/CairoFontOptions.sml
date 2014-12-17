structure CairoFontOptions :>
  CAIRO_FONT_OPTIONS
    where type record_t = CairoFontOptionsRecord.t =
  struct
    type record_t = CairoFontOptionsRecord.t
    type t = record_t
  end
