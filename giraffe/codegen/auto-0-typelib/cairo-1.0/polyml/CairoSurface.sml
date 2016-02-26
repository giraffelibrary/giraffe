structure CairoSurface :>
  CAIRO_SURFACE
    where type record_t = CairoSurfaceRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_surface_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type record_t = CairoSurfaceRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
