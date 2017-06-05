structure GioDBusObjectProxy :>
  GIO_D_BUS_OBJECT_PROXY
    where type 'a class = 'a GioDBusObjectProxyClass.class
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_proxy_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_dbus_object_proxy_new") (GioDBusConnectionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusObjectProxyClass.PolyML.cPtr)
      val getConnection_ = call (load_sym libgio "g_dbus_object_proxy_get_connection") (GioDBusObjectProxyClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
    end
    type 'a class = 'a GioDBusObjectProxyClass.class
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type t = base class
    fun asDBusObject self = (GObjectObjectClass.FFI.withPtr ---> GioDBusObjectClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new connection objectPath = (GioDBusConnectionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusObjectProxyClass.FFI.fromPtr true) new_ (connection & objectPath)
    fun getConnection self = (GioDBusObjectProxyClass.FFI.withPtr ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self
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
