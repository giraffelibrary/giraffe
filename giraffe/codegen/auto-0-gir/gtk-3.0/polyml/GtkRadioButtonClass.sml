structure GtkRadioButtonClass :>
  GTK_RADIO_BUTTON_CLASS
    where type 'a check_button_class = 'a GtkCheckButtonClass.class
    where type C.opt = GtkCheckButtonClass.C.opt
    where type C.non_opt = GtkCheckButtonClass.C.non_opt
    where type 'a C.p = 'a GtkCheckButtonClass.C.p =
  struct
    type 'a check_button_class = 'a GtkCheckButtonClass.class
    open GtkCheckButtonClass
    type 'a radio_button = unit
    type 'a class = 'a radio_button class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_radio_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
