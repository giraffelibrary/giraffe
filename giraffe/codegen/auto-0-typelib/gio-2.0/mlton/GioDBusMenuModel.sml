structure GioDBusMenuModel :>
  GIO_D_BUS_MENU_MODEL
    where type 'a class = 'a GioDBusMenuModelClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    val getType_ = _import "g_dbus_menu_model_get_type" : unit -> GObjectType.FFI.val_;
    val get_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_menu_model_get" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioDBusMenuModelClass.FFI.notnull GioDBusMenuModelClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
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
        GioDBusConnectionClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GioDBusMenuModelClass.FFI.fromPtr true
      )
        get_
        (
          connection
           & busName
           & objectPath
        )
  end
