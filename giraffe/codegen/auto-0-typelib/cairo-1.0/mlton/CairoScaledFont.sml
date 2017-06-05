structure CairoScaledFont :>
  CAIRO_SCALED_FONT
    where type t = CairoScaledFontRecord.t =
  struct
    val getType_ = _import "cairo_gobject_scaled_font_get_type" : unit -> GObjectType.FFI.val_;
    type t = CairoScaledFontRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
