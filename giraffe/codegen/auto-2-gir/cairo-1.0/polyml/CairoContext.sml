structure CairoContext :>
  CAIRO_CONTEXT
    where type record_t = CairoContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type record_t = CairoContextRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
