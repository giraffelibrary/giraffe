structure PangoFontsetSimpleClass :>
  PANGO_FONTSET_SIMPLE_CLASS
    where type 'a fontset_class = 'a PangoFontsetClass.class
    where type C.opt = PangoFontsetClass.C.opt
    where type C.non_opt = PangoFontsetClass.C.non_opt
    where type 'a C.p = 'a PangoFontsetClass.C.p =
  struct
    type 'a fontset_class = 'a PangoFontsetClass.class
    open PangoFontsetClass
    type 'a fontset_simple = unit
    type 'a class = 'a fontset_simple class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_fontset_simple_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
