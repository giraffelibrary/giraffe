structure CairoSurface :>
  CAIRO_SURFACE
    where type t = CairoSurfaceRecord.t =
  struct
    val getType_ = _import "cairo_gobject_surface_get_type" : unit -> GObjectType.C.val_;
    type t = CairoSurfaceRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
