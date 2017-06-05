structure CairoPattern :>
  CAIRO_PATTERN
    where type t = CairoPatternRecord.t =
  struct
    val getType_ = _import "cairo_gobject_pattern_get_type" : unit -> GObjectType.FFI.val_;
    type t = CairoPatternRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
