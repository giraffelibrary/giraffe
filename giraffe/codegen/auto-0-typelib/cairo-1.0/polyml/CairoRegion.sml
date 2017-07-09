structure CairoRegion :>
  CAIRO_REGION
    where type t = CairoRegionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "cairo_gobject_region_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoRegionRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
