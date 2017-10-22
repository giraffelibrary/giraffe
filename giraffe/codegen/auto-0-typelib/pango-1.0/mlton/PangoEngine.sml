structure PangoEngine :>
  PANGO_ENGINE
    where type 'a class = 'a PangoEngineClass.class =
  struct
    val getType_ = _import "pango_engine_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a PangoEngineClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
