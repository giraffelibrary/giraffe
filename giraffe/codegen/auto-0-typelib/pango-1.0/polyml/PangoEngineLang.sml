structure PangoEngineLang :>
  PANGO_ENGINE_LANG
    where type 'a class = 'a PangoEngineLangClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_engine_lang_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a PangoEngineLangClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
