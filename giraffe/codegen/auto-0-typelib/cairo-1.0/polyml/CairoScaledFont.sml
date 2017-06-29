structure CairoScaledFont :>
  CAIRO_SCALED_FONT
    where type t = CairoScaledFontRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "cairo_gobject_scaled_font_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoScaledFontRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
