structure CairoScaledFont :>
  CAIRO_SCALED_FONT
    where type t = CairoScaledFontRecord.t =
  struct
    val getType_ = _import "cairo_gobject_scaled_font_get_type" : unit -> GObjectType.C.val_;
    type t = CairoScaledFontRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
