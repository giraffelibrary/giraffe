structure GioDBusMenuModel :>
  GIO_D_BUS_MENU_MODEL
    where type 'a class = 'a GioDBusMenuModelClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_menu_model_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val get_ =
        call (getSymbol "g_dbus_menu_model_get")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusMenuModelClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioDBusMenuModelClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun get
      (
        connection,
        busName,
        objectPath
      ) =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> GioDBusMenuModelClass.FFI.fromPtr true
      )
        get_
        (
          connection
           & busName
           & objectPath
        )
  end
