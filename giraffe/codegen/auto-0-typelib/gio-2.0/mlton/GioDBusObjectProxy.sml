structure GioDBusObjectProxy :>
  GIO_D_BUS_OBJECT_PROXY
    where type 'a class_t = 'a GioDBusObjectProxyClass.t
    where type 'a dbusobjectclass_t = 'a GioDBusObjectClass.t
    where type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t =
  struct
    val getType_ = _import "g_dbus_object_proxy_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_proxy_new" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getConnection_ = _import "g_dbus_object_proxy_get_connection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GioDBusObjectProxyClass.t
    type 'a dbusobjectclass_t = 'a GioDBusObjectClass.t
    type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    type t = base class_t
    fun asDBusObject self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new connection objectPath = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioDBusObjectProxyClass.C.fromPtr true) new_ (connection & objectPath)
    fun getConnection self = (GObjectObjectClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    local
      open Property
    in
      val connectionProp =
        {
          get = fn x => get "connection" GioDBusConnectionClass.tOpt x,
          set = fn x => set "connection" GioDBusConnectionClass.tOpt x
        }
      val objectPathProp =
        {
          get = fn x => get "object-path" stringOpt x,
          set = fn x => set "object-path" stringOpt x
        }
    end
  end
