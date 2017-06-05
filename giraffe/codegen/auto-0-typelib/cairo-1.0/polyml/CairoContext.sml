structure CairoContext :>
  CAIRO_CONTEXT
    where type t = CairoContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_context_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoContextRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
