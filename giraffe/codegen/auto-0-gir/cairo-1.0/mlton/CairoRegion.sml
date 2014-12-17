structure CairoRegion :>
  CAIRO_REGION
    where type record_t = CairoRegionRecord.t =
  struct
    val getType_ = _import "cairo_gobject_region_get_type" : unit -> GObjectType.C.val_;
    type record_t = CairoRegionRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
