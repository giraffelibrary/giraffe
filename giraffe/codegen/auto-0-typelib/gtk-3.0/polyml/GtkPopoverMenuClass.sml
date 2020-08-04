structure GtkPopoverMenuClass :>
  GTK_POPOVER_MENU_CLASS
    where type 'a popover_class = 'a GtkPopoverClass.class
    where type C.opt = GtkPopoverClass.C.opt
    where type C.non_opt = GtkPopoverClass.C.non_opt
    where type 'a C.p = 'a GtkPopoverClass.C.p =
  struct
    type 'a popover_class = 'a GtkPopoverClass.class
    open GtkPopoverClass
    type 'a popover_menu = unit
    type 'a class = 'a popover_menu class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_popover_menu_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
