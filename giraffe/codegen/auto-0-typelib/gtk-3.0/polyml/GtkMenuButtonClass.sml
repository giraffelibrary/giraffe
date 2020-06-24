structure GtkMenuButtonClass :>
  GTK_MENU_BUTTON_CLASS
    where type 'a toggle_button_class = 'a GtkToggleButtonClass.class
    where type C.opt = GtkToggleButtonClass.C.opt
    where type C.non_opt = GtkToggleButtonClass.C.non_opt
    where type 'a C.p = 'a GtkToggleButtonClass.C.p =
  struct
    type 'a toggle_button_class = 'a GtkToggleButtonClass.class
    open GtkToggleButtonClass
    type 'a menu_button = unit
    type 'a class = 'a menu_button class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
