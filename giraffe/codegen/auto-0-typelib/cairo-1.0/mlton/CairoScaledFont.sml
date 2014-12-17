structure CairoScaledFont :>
  CAIRO_SCALED_FONT
    where type record_t = CairoScaledFontRecord.t =
  struct
    val getType_ = _import "cairo_gobject_scaled_font_get_type" : unit -> GObjectType.C.val_;
    type record_t = CairoScaledFontRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
