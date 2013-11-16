structure CairoSurface :>
  CAIRO_SURFACE
    where type record_t = CairoSurfaceRecord.t =
  struct
    val getType_ = _import "cairo_gobject_surface_get_type" : unit -> GObjectType.C.val_;
    type record_t = CairoSurfaceRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
