structure GtkMenuToolButtonClass :>
  GTK_MENU_TOOL_BUTTON_CLASS
    where type 'a tool_button_class = 'a GtkToolButtonClass.class
    where type C.opt = GtkToolButtonClass.C.opt
    where type C.non_opt = GtkToolButtonClass.C.non_opt
    where type 'a C.p = 'a GtkToolButtonClass.C.p =
  struct
    type 'a tool_button_class = 'a GtkToolButtonClass.class
    open GtkToolButtonClass
    type 'a menu_tool_button = unit
    type 'a class = 'a menu_tool_button class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_tool_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
