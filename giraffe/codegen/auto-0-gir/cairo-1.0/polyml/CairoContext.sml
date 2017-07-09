structure CairoContext :>
  CAIRO_CONTEXT
    where type t = CairoContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "cairo_gobject_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoContextRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
