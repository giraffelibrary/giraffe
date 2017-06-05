structure GioDBusInterfaceSkeleton :>
  GIO_D_BUS_INTERFACE_SKELETON
    where type 'a class = 'a GioDBusInterfaceSkeletonClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    where type d_bus_interface_skeleton_flags_t = GioDBusInterfaceSkeletonFlags.t =
  struct
    val getType_ = _import "g_dbus_interface_skeleton_get_type" : unit -> GObjectType.FFI.val_;
    val export_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_dbus_interface_skeleton_export" :
              GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p
               * GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val flush_ = _import "g_dbus_interface_skeleton_flush" : GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> unit;
    val getConnection_ = _import "g_dbus_interface_skeleton_get_connection" : GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;
    val getFlags_ = _import "g_dbus_interface_skeleton_get_flags" : GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> GioDBusInterfaceSkeletonFlags.FFI.val_;
    val getInfo_ = _import "g_dbus_interface_skeleton_get_info" : GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> GioDBusInterfaceInfoRecord.FFI.notnull GioDBusInterfaceInfoRecord.FFI.p;
    val getObjectPath_ = _import "g_dbus_interface_skeleton_get_object_path" : GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getProperties_ = _import "g_dbus_interface_skeleton_get_properties" : GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val setFlags_ = fn x1 & x2 => (_import "g_dbus_interface_skeleton_set_flags" : GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p * GioDBusInterfaceSkeletonFlags.FFI.val_ -> unit;) (x1, x2)
    val unexport_ = _import "g_dbus_interface_skeleton_unexport" : GioDBusInterfaceSkeletonClass.FFI.notnull GioDBusInterfaceSkeletonClass.FFI.p -> unit;
    type 'a class = 'a GioDBusInterfaceSkeletonClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    type d_bus_interface_skeleton_flags_t = GioDBusInterfaceSkeletonFlags.t
    type t = base class
    fun asDBusInterface self = (GObjectObjectClass.FFI.withPtr ---> GioDBusInterfaceClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun export self connection objectPath =
      (
        GioDBusInterfaceSkeletonClass.FFI.withPtr
         &&&> GioDBusConnectionClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        export_
        (
          self
           & connection
           & objectPath
           & []
        )
    fun flush self = (GioDBusInterfaceSkeletonClass.FFI.withPtr ---> I) flush_ self
    fun getConnection self = (GioDBusInterfaceSkeletonClass.FFI.withPtr ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self
    fun getFlags self = (GioDBusInterfaceSkeletonClass.FFI.withPtr ---> GioDBusInterfaceSkeletonFlags.FFI.fromVal) getFlags_ self
    fun getInfo self = (GioDBusInterfaceSkeletonClass.FFI.withPtr ---> GioDBusInterfaceInfoRecord.FFI.fromPtr false) getInfo_ self
    fun getObjectPath self = (GioDBusInterfaceSkeletonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getObjectPath_ self
    fun getProperties self = (GioDBusInterfaceSkeletonClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getProperties_ self
    fun setFlags self flags = (GioDBusInterfaceSkeletonClass.FFI.withPtr &&&> GioDBusInterfaceSkeletonFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun unexport self = (GioDBusInterfaceSkeletonClass.FFI.withPtr ---> I) unexport_ self
    local
      open ClosureMarshal Signal
    in
      fun gAuthorizeMethodSig f = signal "g-authorize-method" (get 0w1 GioDBusMethodInvocationClass.t ---> ret boolean) f
    end
    local
      open Property
    in
      val gFlagsProp =
        {
          get = fn x => get "g-flags" GioDBusInterfaceSkeletonFlags.t x,
          set = fn x => set "g-flags" GioDBusInterfaceSkeletonFlags.t x
        }
    end
  end
