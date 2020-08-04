structure GtkRecentActionClass :>
  GTK_RECENT_ACTION_CLASS
    where type 'a action_class = 'a GtkActionClass.class
    where type C.opt = GtkActionClass.C.opt
    where type C.non_opt = GtkActionClass.C.non_opt
    where type 'a C.p = 'a GtkActionClass.C.p =
  struct
    type 'a action_class = 'a GtkActionClass.class
    open GtkActionClass
    type 'a recent_action = unit
    type 'a class = 'a recent_action class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
