structure GioDBusObjectManagerServer :>
  GIO_D_BUS_OBJECT_MANAGER_SERVER
    where type 'a class = 'a GioDBusObjectManagerServerClass.class
    where type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    where type 'a d_bus_object_skeleton_class = 'a GioDBusObjectSkeletonClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class =
  struct
    val getType_ = _import "g_dbus_object_manager_server_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_dbus_object_manager_server_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioDBusObjectManagerServerClass.FFI.non_opt GioDBusObjectManagerServerClass.FFI.p;
    val export_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_export" : GioDBusObjectManagerServerClass.FFI.non_opt GioDBusObjectManagerServerClass.FFI.p * GioDBusObjectSkeletonClass.FFI.non_opt GioDBusObjectSkeletonClass.FFI.p -> unit;) (x1, x2)
    val exportUniquely_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_export_uniquely" : GioDBusObjectManagerServerClass.FFI.non_opt GioDBusObjectManagerServerClass.FFI.p * GioDBusObjectSkeletonClass.FFI.non_opt GioDBusObjectSkeletonClass.FFI.p -> unit;) (x1, x2)
    val getConnection_ = _import "g_dbus_object_manager_server_get_connection" : GioDBusObjectManagerServerClass.FFI.non_opt GioDBusObjectManagerServerClass.FFI.p -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;
    val isExported_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_is_exported" : GioDBusObjectManagerServerClass.FFI.non_opt GioDBusObjectManagerServerClass.FFI.p * GioDBusObjectSkeletonClass.FFI.non_opt GioDBusObjectSkeletonClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setConnection_ = fn x1 & x2 => (_import "g_dbus_object_manager_server_set_connection" : GioDBusObjectManagerServerClass.FFI.non_opt GioDBusObjectManagerServerClass.FFI.p * GioDBusConnectionClass.FFI.opt GioDBusConnectionClass.FFI.p -> unit;) (x1, x2)
    val unexport_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_manager_server_unexport" :
              GioDBusObjectManagerServerClass.FFI.non_opt GioDBusObjectManagerServerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
