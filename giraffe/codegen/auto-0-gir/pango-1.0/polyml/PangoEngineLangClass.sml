structure PangoEngineLangClass :>
  PANGO_ENGINE_LANG_CLASS
    where type 'a engine_class = 'a PangoEngineClass.class
    where type C.opt = PangoEngineClass.C.opt
    where type C.non_opt = PangoEngineClass.C.non_opt
    where type 'a C.p = 'a PangoEngineClass.C.p =
  struct
    type 'a engine_class = 'a PangoEngineClass.class
    open PangoEngineClass
    type 'a engine_lang = unit
    type 'a class = 'a engine_lang class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_engine_lang_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
