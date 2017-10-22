structure GioDBusActionGroup :>
  GIO_D_BUS_ACTION_GROUP
    where type 'a class = 'a GioDBusActionGroupClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type 'a remote_action_group_class = 'a GioRemoteActionGroupClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_action_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val get_ =
        call (getSymbol "g_dbus_action_group_get")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusActionGroupClass.PolyML.cPtr
          )
    end
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
