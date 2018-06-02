structure GtkPadControllerClass :>
  GTK_PAD_CONTROLLER_CLASS
    where type 'a event_controller_class = 'a GtkEventControllerClass.class
    where type C.notnull = GtkEventControllerClass.C.notnull
    where type 'a C.p = 'a GtkEventControllerClass.C.p =
  struct
    type 'a event_controller_class = 'a GtkEventControllerClass.class
    open GtkEventControllerClass
    type 'a pad_controller = unit
    type 'a class = 'a pad_controller class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_pad_controller_get_type") (cVoid --> GObjectType.PolyML.cVal)
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