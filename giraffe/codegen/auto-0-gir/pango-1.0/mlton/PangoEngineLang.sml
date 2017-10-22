structure PangoEngineLang :>
  PANGO_ENGINE_LANG
    where type 'a class = 'a PangoEngineLangClass.class =
  struct
    val getType_ = _import "pango_engine_lang_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a PangoEngineLangClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
