structure CairoContext :>
  CAIRO_CONTEXT
    where type t = CairoContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoContextRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
