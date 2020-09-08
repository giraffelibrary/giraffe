structure GioDBusObjectProxy :>
  GIO_D_BUS_OBJECT_PROXY
    where type 'a class = 'a GioDBusObjectProxyClass.class
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_object_proxy_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_dbus_object_proxy_new") (GioDBusConnectionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusObjectProxyClass.PolyML.cPtr)
      val getConnection_ = call (getSymbol "g_dbus_object_proxy_get_connection") (GioDBusObjectProxyClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
    end
    type 'a class = 'a GioDBusObjectProxyClass.class
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type t = base class
    fun asDBusObject self = (GObjectObjectClass.FFI.withPtr false ---> GioDBusObjectClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (connection, objectPath) = (GioDBusConnectionClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioDBusObjectProxyClass.FFI.fromPtr true) new_ (connection & objectPath)
    fun getConnection self = (GioDBusObjectProxyClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self
    local
      open ValueAccessor
    in
      val gConnectionProp =
        {
          name = "g-connection",
          gtype = fn () => C.gtype GioDBusConnectionClass.tOpt (),
          get = fn x => fn () => C.get GioDBusConnectionClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioDBusConnectionClass.tOpt x
        }
      val gObjectPathProp =
        {
          name = "g-object-path",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
