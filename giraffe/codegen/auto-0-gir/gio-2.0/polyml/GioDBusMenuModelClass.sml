structure GioDBusMenuModelClass :>
  GIO_D_BUS_MENU_MODEL_CLASS
    where type 'a menu_model_class = 'a GioMenuModelClass.class
    where type C.opt = GioMenuModelClass.C.opt
    where type C.non_opt = GioMenuModelClass.C.non_opt
    where type 'a C.p = 'a GioMenuModelClass.C.p =
  struct
    type 'a menu_model_class = 'a GioMenuModelClass.class
    open GioMenuModelClass
    type 'a d_bus_menu_model = unit
    type 'a class = 'a d_bus_menu_model class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_menu_model_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
