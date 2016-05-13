structure CairoSurface :>
  CAIRO_SURFACE
    where type t = CairoSurfaceRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_surface_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoSurfaceRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
