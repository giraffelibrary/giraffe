structure PangoEngineShape :>
  PANGO_ENGINE_SHAPE
    where type 'a class = 'a PangoEngineShapeClass.class =
  struct
    val getType_ = _import "pango_engine_shape_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a PangoEngineShapeClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
