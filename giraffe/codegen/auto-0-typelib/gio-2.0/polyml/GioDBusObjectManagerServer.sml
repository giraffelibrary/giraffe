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
      val setConnection_ = call (getSymbol "g_dbus_object_manager_server_set_connection") (GioDBusObjectManagerServerClass.PolyML.cPtr &&> GioDBusConnectionClass.PolyML.cOptPtr --> cVoid)
      val unexport_ = call (getSymbol "g_dbus_object_manager_server_unexport") (GioDBusObjectManagerServerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioDBusObjectManagerServerClass.class
    type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    type 'a d_bus_object_skeleton_class = 'a GioDBusObjectSkeletonClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type t = base class
    fun asDBusObjectManager self = (GObjectObjectClass.FFI.withPtr ---> GioDBusObjectManagerClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new objectPath = (Utf8.FFI.withPtr ---> GioDBusObjectManagerServerClass.FFI.fromPtr true) new_ objectPath
    fun export self object = (GioDBusObjectManagerServerClass.FFI.withPtr &&&> GioDBusObjectSkeletonClass.FFI.withPtr ---> I) export_ (self & object)
    fun exportUniquely self object = (GioDBusObjectManagerServerClass.FFI.withPtr &&&> GioDBusObjectSkeletonClass.FFI.withPtr ---> I) exportUniquely_ (self & object)
    fun getConnection self = (GioDBusObjectManagerServerClass.FFI.withPtr ---> GioDBusConnectionClass.FFI.fromPtr true) getConnection_ self
    fun setConnection self connection = (GioDBusObjectManagerServerClass.FFI.withPtr &&&> GioDBusConnectionClass.FFI.withOptPtr ---> I) setConnection_ (self & connection)
    fun unexport self objectPath = (GioDBusObjectManagerServerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) unexport_ (self & objectPath)
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
