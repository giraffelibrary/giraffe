structure GioDBusObjectManagerServer :>
  GIO_D_BUS_OBJECT_MANAGER_SERVER
    where type 'a class = 'a GioDBusObjectManagerServerClass.class
    where type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    where type 'a d_bus_object_skeleton_class = 'a GioDBusObjectSkeletonClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    val getType_ = _import "g_dbus_object_manager_server_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_dbus_object_manager_server_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioDBusObjectManagerServerClass.FFI.notnull GioDBusObjectManagerServerClass.FFI.p;
    val export_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_export" : GioDBusObjectManagerServerClass.FFI.notnull GioDBusObjectManagerServerClass.FFI.p * GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p -> unit;) (x1, x2)
    val exportUniquely_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_export_uniquely" : GioDBusObjectManagerServerClass.FFI.notnull GioDBusObjectManagerServerClass.FFI.p * GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p -> unit;) (x1, x2)
    val getConnection_ = _import "g_dbus_object_manager_server_get_connection" : GioDBusObjectManagerServerClass.FFI.notnull GioDBusObjectManagerServerClass.FFI.p -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;
    val isExported_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_is_exported" : GioDBusObjectManagerServerClass.FFI.notnull GioDBusObjectManagerServerClass.FFI.p * GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setConnection_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_set_connection" : GioDBusObjectManagerServerClass.FFI.notnull GioDBusObjectManagerServerClass.FFI.p * unit GioDBusConnectionClass.FFI.p -> unit;) (x1, x2)
    val unexport_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_manager_server_unexport" :
              GioDBusObjectManagerServerClass.FFI.notnull GioDBusObjectManagerServerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
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
    fun asDBusObjectManager self = (GObjectObjectClass.FFI.withPtr ---> GioDBusObjectManagerClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new objectPath = (Utf8.FFI.withPtr ---> GioDBusObjectManagerServerClass.FFI.fromPtr true) new_ objectPath
    fun export self object = (GioDBusObjectManagerServerClass.FFI.withPtr &&&> GioDBusObjectSkeletonClass.FFI.withPtr ---> I) export_ (self & object)
    fun exportUniquely self object = (GioDBusObjectManagerServerClass.FFI.withPtr &&&> GioDBusObjectSkeletonClass.FFI.withPtr ---> I) exportUniquely_ (self & object)
    fun getConnection self = (GioDBusObjectManagerServerClass.FFI.withPtr ---> GioDBusConnectionClass.FFI.fromPtr true) getConnection_ self
    fun isExported self object = (GioDBusObjectManagerServerClass.FFI.withPtr &&&> GioDBusObjectSkeletonClass.FFI.withPtr ---> GBool.FFI.fromVal) isExported_ (self & object)
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
