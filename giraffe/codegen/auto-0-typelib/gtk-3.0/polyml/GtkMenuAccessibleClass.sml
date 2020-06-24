structure GtkMenuAccessibleClass :>
  GTK_MENU_ACCESSIBLE_CLASS
    where type 'a menu_shell_accessible_class = 'a GtkMenuShellAccessibleClass.class
    where type C.opt = GtkMenuShellAccessibleClass.C.opt
    where type C.non_opt = GtkMenuShellAccessibleClass.C.non_opt
    where type 'a C.p = 'a GtkMenuShellAccessibleClass.C.p =
  struct
    type 'a menu_shell_accessible_class = 'a GtkMenuShellAccessibleClass.class
    open GtkMenuShellAccessibleClass
    type 'a menu_accessible = unit
    type 'a class = 'a menu_accessible class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
