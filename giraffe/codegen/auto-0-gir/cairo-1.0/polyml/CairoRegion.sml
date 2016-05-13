structure CairoRegion :>
  CAIRO_REGION
    where type t = CairoRegionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_region_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoRegionRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
