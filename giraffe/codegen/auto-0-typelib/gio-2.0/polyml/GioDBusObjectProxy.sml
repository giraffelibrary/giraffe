structure GioDBusObjectProxy :>
  GIO_D_BUS_OBJECT_PROXY
    where type 'a class_t = 'a GioDBusObjectProxyClass.t
    where type 'a d_bus_object_class_t = 'a GioDBusObjectClass.t
    where type 'a d_bus_connection_class_t = 'a GioDBusConnectionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_proxy_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_dbus_object_proxy_new") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getConnection_ = call (load_sym libgio "g_dbus_object_proxy_get_connection") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioDBusObjectProxyClass.t
    type 'a d_bus_object_class_t = 'a GioDBusObjectClass.t
    type 'a d_bus_connection_class_t = 'a GioDBusConnectionClass.t
    type t = base class_t
    fun asDBusObject self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new connection objectPath = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> GioDBusObjectProxyClass.C.fromPtr true) new_ (connection & objectPath)
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
