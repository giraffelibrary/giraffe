structure CairoPattern :>
  CAIRO_PATTERN
    where type t = CairoPatternRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "cairo_gobject_pattern_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoPatternRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
