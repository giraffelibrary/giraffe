structure GioDBusObjectManagerServer :>
  GIO_D_BUS_OBJECT_MANAGER_SERVER
    where type 'a class = 'a GioDBusObjectManagerServerClass.class
    where type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    where type 'a d_bus_object_skeleton_class = 'a GioDBusObjectSkeletonClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_object_manager_server_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_dbus_object_manager_server_new") (Utf8.PolyML.cInPtr --> GioDBusObjectManagerServerClass.PolyML.cPtr)
      val export_ = call (getSymbol "g_dbus_object_manager_server_export") (GioDBusObjectManagerServerClass.PolyML.cPtr &&> GioDBusObjectSkeletonClass.PolyML.cPtr --> cVoid)
      val exportUniquely_ = call (getSymbol "g_dbus_object_manager_server_export_uniquely") (GioDBusObjectManagerServerClass.PolyML.cPtr &&> GioDBusObjectSkeletonClass.PolyML.cPtr --> cVoid)
      val getConnection_ = call (getSymbol "g_dbus_object_manager_server_get_connection") (GioDBusObjectManagerServerClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val isExported_ = call (getSymbol "g_dbus_object_manager_server_is_exported") (GioDBusObjectManagerServerClass.PolyML.cPtr &&> GioDBusObjectSkeletonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setConnection_ = call (getSymbol "g_dbus_object_manager_server_set_connection") (GioDBusObjectManagerServerClass.PolyML.cPtr &&> GioDBusConnectionClass.PolyML.cOptPtr --> cVoid)
      val unexport_ = call (getSymbol "g_dbus_object_manager_server_unexport") (GioDBusObjectManagerServerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioDBusObjectManagerServerClass.class
    type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    type 'a d_bus_object_skeleton_class = 'a GioDBusObjectSkeletonClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type t = base class
    fun asDBusObjectManager self = (GObjectObjectClass.FFI.withPtr false ---> GioDBusObjectManagerClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new objectPath = (Utf8.FFI.withPtr 0 ---> GioDBusObjectManagerServerClass.FFI.fromPtr true) new_ objectPath
    fun export self object = (GioDBusObjectManagerServerClass.FFI.withPtr false &&&> GioDBusObjectSkeletonClass.FFI.withPtr false ---> I) export_ (self & object)
    fun exportUniquely self object = (GioDBusObjectManagerServerClass.FFI.withPtr false &&&> GioDBusObjectSkeletonClass.FFI.withPtr false ---> I) exportUniquely_ (self & object)
    fun getConnection self = (GioDBusObjectManagerServerClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr true) getConnection_ self
    fun isExported self object = (GioDBusObjectManagerServerClass.FFI.withPtr false &&&> GioDBusObjectSkeletonClass.FFI.withPtr false ---> GBool.FFI.fromVal) isExported_ (self & object)
    fun setConnection self connection = (GioDBusObjectManagerServerClass.FFI.withPtr false &&&> GioDBusConnectionClass.FFI.withOptPtr false ---> I) setConnection_ (self & connection)
    fun unexport self objectPath = (GioDBusObjectManagerServerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) unexport_ (self & objectPath)
    local
      open ValueAccessor
    in
      val connectionProp =
        {
          name = "connection",
          gtype = fn () => C.gtype GioDBusConnectionClass.tOpt (),
          get = fn x => fn () => C.get GioDBusConnectionClass.tOpt x,
          set = fn x => C.set GioDBusConnectionClass.tOpt x,
          init = fn x => C.set GioDBusConnectionClass.tOpt x
        }
      val objectPathProp =
        {
          name = "object-path",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
