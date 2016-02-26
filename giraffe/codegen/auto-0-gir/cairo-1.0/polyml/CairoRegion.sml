structure CairoRegion :>
  CAIRO_REGION
    where type record_t = CairoRegionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_region_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type record_t = CairoRegionRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
