structure CairoRegion :>
  CAIRO_REGION
    where type t = CairoRegionRecord.t =
  struct
    val getType_ = _import "cairo_gobject_region_get_type" : unit -> GObjectType.C.val_;
    type t = CairoRegionRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
