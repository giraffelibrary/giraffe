structure GtkLockButtonAccessibleClass :>
  GTK_LOCK_BUTTON_ACCESSIBLE_CLASS
    where type 'a button_accessible_class = 'a GtkButtonAccessibleClass.class
    where type C.opt = GtkButtonAccessibleClass.C.opt
    where type C.non_opt = GtkButtonAccessibleClass.C.non_opt
    where type 'a C.p = 'a GtkButtonAccessibleClass.C.p =
  struct
    type 'a button_accessible_class = 'a GtkButtonAccessibleClass.class
    open GtkButtonAccessibleClass
    type 'a lock_button_accessible = unit
    type 'a class = 'a lock_button_accessible class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_lock_button_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
