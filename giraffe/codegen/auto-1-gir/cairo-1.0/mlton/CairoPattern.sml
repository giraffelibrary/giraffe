structure CairoPattern :>
  CAIRO_PATTERN
    where type record_t = CairoPatternRecord.t =
  struct
    val getType_ = _import "cairo_gobject_pattern_get_type" : unit -> GObjectType.C.val_;
    type record_t = CairoPatternRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
