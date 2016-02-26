structure GioDBusObjectManagerServer :>
  GIO_D_BUS_OBJECT_MANAGER_SERVER
    where type 'a class_t = 'a GioDBusObjectManagerServerClass.t
    where type 'a d_bus_object_manager_class_t = 'a GioDBusObjectManagerClass.t
    where type 'a d_bus_object_skeleton_class_t = 'a GioDBusObjectSkeletonClass.t
    where type 'a d_bus_connection_class_t = 'a GioDBusConnectionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_manager_server_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_dbus_object_manager_server_new") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val export_ = call (load_sym libgio "g_dbus_object_manager_server_export") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val exportUniquely_ = call (load_sym libgio "g_dbus_object_manager_server_export_uniquely") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getConnection_ = call (load_sym libgio "g_dbus_object_manager_server_get_connection") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val setConnection_ = call (load_sym libgio "g_dbus_object_manager_server_set_connection") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val unexport_ = call (load_sym libgio "g_dbus_object_manager_server_unexport") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a GioDBusObjectManagerServerClass.t
    type 'a d_bus_object_manager_class_t = 'a GioDBusObjectManagerClass.t
    type 'a d_bus_object_skeleton_class_t = 'a GioDBusObjectSkeletonClass.t
    type 'a d_bus_connection_class_t = 'a GioDBusConnectionClass.t
    type t = base class_t
    fun asDBusObjectManager self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectManagerClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new objectPath = (Utf8.C.withPtr ---> GioDBusObjectManagerServerClass.C.fromPtr true) new_ objectPath
    fun export self object = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) export_ (self & object)
    fun exportUniquely self object = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) exportUniquely_ (self & object)
    fun getConnection self = (GObjectObjectClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr true) getConnection_ self
    fun setConnection self connection = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setConnection_ (self & connection)
    fun unexport self objectPath = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) unexport_ (self & objectPath)
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
