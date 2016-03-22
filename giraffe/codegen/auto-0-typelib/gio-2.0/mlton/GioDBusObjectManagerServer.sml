structure GioDBusObjectManagerServer :>
  GIO_D_BUS_OBJECT_MANAGER_SERVER
    where type 'a class = 'a GioDBusObjectManagerServerClass.class
    where type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    where type 'a d_bus_object_skeleton_class = 'a GioDBusObjectSkeletonClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    val getType_ = _import "g_dbus_object_manager_server_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_dbus_object_manager_server_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioDBusObjectManagerServerClass.C.notnull GioDBusObjectManagerServerClass.C.p;
    val export_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_export" : GioDBusObjectManagerServerClass.C.notnull GioDBusObjectManagerServerClass.C.p * GioDBusObjectSkeletonClass.C.notnull GioDBusObjectSkeletonClass.C.p -> unit;) (x1, x2)
    val exportUniquely_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_export_uniquely" : GioDBusObjectManagerServerClass.C.notnull GioDBusObjectManagerServerClass.C.p * GioDBusObjectSkeletonClass.C.notnull GioDBusObjectSkeletonClass.C.p -> unit;) (x1, x2)
    val getConnection_ = _import "g_dbus_object_manager_server_get_connection" : GioDBusObjectManagerServerClass.C.notnull GioDBusObjectManagerServerClass.C.p -> GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p;
    val setConnection_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_set_connection" : GioDBusObjectManagerServerClass.C.notnull GioDBusObjectManagerServerClass.C.p * unit GioDBusConnectionClass.C.p -> unit;) (x1, x2)
    val unexport_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_manager_server_unexport" :
              GioDBusObjectManagerServerClass.C.notnull GioDBusObjectManagerServerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDBusObjectManagerServerClass.class
    type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    type 'a d_bus_object_skeleton_class = 'a GioDBusObjectSkeletonClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type t = base class
    fun asDBusObjectManager self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectManagerClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new objectPath = (Utf8.C.withPtr ---> GioDBusObjectManagerServerClass.C.fromPtr true) new_ objectPath
    fun export self object = (GioDBusObjectManagerServerClass.C.withPtr &&&> GioDBusObjectSkeletonClass.C.withPtr ---> I) export_ (self & object)
    fun exportUniquely self object = (GioDBusObjectManagerServerClass.C.withPtr &&&> GioDBusObjectSkeletonClass.C.withPtr ---> I) exportUniquely_ (self & object)
    fun getConnection self = (GioDBusObjectManagerServerClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr true) getConnection_ self
    fun setConnection self connection = (GioDBusObjectManagerServerClass.C.withPtr &&&> GioDBusConnectionClass.C.withOptPtr ---> I) setConnection_ (self & connection)
    fun unexport self objectPath = (GioDBusObjectManagerServerClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) unexport_ (self & objectPath)
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
