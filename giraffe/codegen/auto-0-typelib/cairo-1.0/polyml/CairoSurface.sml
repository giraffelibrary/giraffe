structure CairoSurface :>
  CAIRO_SURFACE
    where type t = CairoSurfaceRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "cairo_gobject_surface_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoSurfaceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
