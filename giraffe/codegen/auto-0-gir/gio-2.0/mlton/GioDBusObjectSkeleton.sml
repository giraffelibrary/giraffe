structure GioDBusObjectSkeleton :>
  GIO_D_BUS_OBJECT_SKELETON
    where type 'a class = 'a GioDBusObjectSkeletonClass.class
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    where type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    where type 'a d_bus_interface_skeleton_class = 'a GioDBusInterfaceSkeletonClass.class =
  struct
    val getType_ = _import "g_dbus_object_skeleton_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_dbus_object_skeleton_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addInterface_ = fn x1 & x2 => (_import "g_dbus_object_skeleton_add_interface" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val flush_ = _import "g_dbus_object_skeleton_flush" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val removeInterface_ = fn x1 & x2 => (_import "g_dbus_object_skeleton_remove_interface" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val removeInterfaceByName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_skeleton_remove_interface_by_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
    fun asDBusObject self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new objectPath = (Utf8.C.withPtr ---> GioDBusObjectSkeletonClass.C.fromPtr true) new_ objectPath
    fun addInterface self interface = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addInterface_ (self & interface)
    fun flush self = (GObjectObjectClass.C.withPtr ---> I) flush_ self
    fun removeInterface self interface = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeInterface_ (self & interface)
    fun removeInterfaceByName self interfaceName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) removeInterfaceByName_ (self & interfaceName)
    fun setObjectPath self objectPath = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setObjectPath_ (self & objectPath)
    local
      open ClosureMarshal Signal
    in
      fun authorizeMethodSig f = signal "authorize-method" (get 0w1 GioDBusInterfaceSkeletonClass.t &&&> get 0w2 GioDBusMethodInvocationClass.t ---> ret boolean) (fn interface & invocation => f interface invocation)
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
