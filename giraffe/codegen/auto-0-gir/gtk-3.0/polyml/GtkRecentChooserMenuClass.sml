structure GtkRecentChooserMenuClass :>
  GTK_RECENT_CHOOSER_MENU_CLASS
    where type 'a menu_class = 'a GtkMenuClass.class
    where type C.opt = GtkMenuClass.C.opt
    where type C.non_opt = GtkMenuClass.C.non_opt
    where type 'a C.p = 'a GtkMenuClass.C.p =
  struct
    type 'a menu_class = 'a GtkMenuClass.class
    open GtkMenuClass
    type 'a recent_chooser_menu = unit
    type 'a class = 'a recent_chooser_menu class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_chooser_menu_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
