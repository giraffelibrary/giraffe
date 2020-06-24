structure GioDBusActionGroup :>
  GIO_D_BUS_ACTION_GROUP
    where type 'a class = 'a GioDBusActionGroupClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type 'a remote_action_group_class = 'a GioRemoteActionGroupClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    val getType_ = _import "g_dbus_action_group_get_type" : unit -> GObjectType.FFI.val_;
    val get_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_action_group_get" :
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioDBusActionGroupClass.FFI.non_opt GioDBusActionGroupClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a GioDBusActionGroupClass.class
    type 'a action_group_class = 'a GioActionGroupClass.class
    type 'a remote_action_group_class = 'a GioRemoteActionGroupClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asRemoteActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioRemoteActionGroupClass.FFI.fromPtr false) I self
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
         ---> GioDBusActionGroupClass.FFI.fromPtr true
      )
        get_
        (
          connection
           & busName
           & objectPath
        )
  end
