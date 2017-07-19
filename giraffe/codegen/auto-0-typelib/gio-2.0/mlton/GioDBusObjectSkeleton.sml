structure GioDBusObjectSkeleton :>
  GIO_D_BUS_OBJECT_SKELETON
    where type 'a class = 'a GioDBusObjectSkeletonClass.class
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    where type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    where type 'a d_bus_interface_skeleton_class = 'a GioDBusInterfaceSkeletonClass.class =
  struct
    val getType_ = _import "g_dbus_object_skeleton_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_dbus_object_skeleton_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p;
    val addInterface_ = fn x1 & x2 => (_import "g_dbus_object_skeleton_add_interface" : GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p * GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> unit;) (x1, x2)
    val flush_ = _import "g_dbus_object_skeleton_flush" : GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p -> unit;
    val removeInterface_ = fn x1 & x2 => (_import "g_dbus_object_skeleton_remove_interface" : GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p * GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> unit;) (x1, x2)
    val removeInterfaceByName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_skeleton_remove_interface_by_name" :
              GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setObjectPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_skeleton_set_object_path" :
              GioDBusObjectSkeletonClass.FFI.notnull GioDBusObjectSkeletonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDBusObjectSkeletonClass.class
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    type 'a d_bus_interface_skeleton_class = 'a GioDBusInterfaceSkeletonClass.class
    type t = base class
    fun asDBusObject self = (GObjectObjectClass.FFI.withPtr ---> GioDBusObjectClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new objectPath = (Utf8.FFI.withPtr ---> GioDBusObjectSkeletonClass.FFI.fromPtr true) new_ objectPath
    fun addInterface self interface = (GioDBusObjectSkeletonClass.FFI.withPtr &&&> GioDBusInterfaceSkeletonClass.FFI.withPtr ---> I) addInterface_ (self & interface)
    fun flush self = (GioDBusObjectSkeletonClass.FFI.withPtr ---> I) flush_ self
    fun removeInterface self interface = (GioDBusObjectSkeletonClass.FFI.withPtr &&&> GioDBusInterfaceSkeletonClass.FFI.withPtr ---> I) removeInterface_ (self & interface)
    fun removeInterfaceByName self interfaceName = (GioDBusObjectSkeletonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) removeInterfaceByName_ (self & interfaceName)
    fun setObjectPath self objectPath = (GioDBusObjectSkeletonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setObjectPath_ (self & objectPath)
    local
      open ClosureMarshal Signal
    in
      fun authorizeMethodSig f = signal "authorize-method" (get 0w1 GioDBusInterfaceSkeletonClass.t &&&> get 0w2 GioDBusMethodInvocationClass.t ---> ret boolean) (fn interface & invocation => f (interface, invocation))
    end
    local
      open Property
    in
      val objectPathProp =
        {
          get = fn x => get "object-path" stringOpt x,
          set = fn x => set "object-path" stringOpt x
        }
    end
  end
