structure GioDBusInterfaceSkeleton :>
  GIO_D_BUS_INTERFACE_SKELETON
    where type 'a class_t = 'a GioDBusInterfaceSkeletonClass.t
    where type 'a d_bus_interface_class_t = 'a GioDBusInterfaceClass.t
    where type 'a d_bus_connection_class_t = 'a GioDBusConnectionClass.t
    where type d_bus_interface_info_record_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_method_invocation_class_t = 'a GioDBusMethodInvocationClass.t
    where type d_bus_interface_skeleton_flags_t = GioDBusInterfaceSkeletonFlags.t =
  struct
    val getType_ = _import "g_dbus_interface_skeleton_get_type" : unit -> GObjectType.C.val_;
    val export_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_dbus_interface_skeleton_export" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val flush_ = _import "g_dbus_interface_skeleton_flush" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getConnection_ = _import "g_dbus_interface_skeleton_get_connection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFlags_ = _import "g_dbus_interface_skeleton_get_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDBusInterfaceSkeletonFlags.C.val_;
    val getInfo_ = _import "g_dbus_interface_skeleton_get_info" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDBusInterfaceInfoRecord.C.notnull GioDBusInterfaceInfoRecord.C.p;
    val getObjectPath_ = _import "g_dbus_interface_skeleton_get_object_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getProperties_ = _import "g_dbus_interface_skeleton_get_properties" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val setFlags_ = fn x1 & x2 => (_import "g_dbus_interface_skeleton_set_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioDBusInterfaceSkeletonFlags.C.val_ -> unit;) (x1, x2)
    val unexport_ = _import "g_dbus_interface_skeleton_unexport" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GioDBusInterfaceSkeletonClass.t
    type 'a d_bus_interface_class_t = 'a GioDBusInterfaceClass.t
    type 'a d_bus_connection_class_t = 'a GioDBusConnectionClass.t
    type d_bus_interface_info_record_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_method_invocation_class_t = 'a GioDBusMethodInvocationClass.t
    type d_bus_interface_skeleton_flags_t = GioDBusInterfaceSkeletonFlags.t
    type t = base class_t
    fun asDBusInterface self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun export self connection objectPath =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        export_
        (
          self
           & connection
           & objectPath
           & []
        )
    fun flush self = (GObjectObjectClass.C.withPtr ---> I) flush_ self
    fun getConnection self = (GObjectObjectClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceSkeletonFlags.C.fromVal) getFlags_ self
    fun getInfo self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceInfoRecord.C.fromPtr false) getInfo_ self
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getObjectPath_ self
    fun getProperties self = (GObjectObjectClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getProperties_ self
    fun setFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioDBusInterfaceSkeletonFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun unexport self = (GObjectObjectClass.C.withPtr ---> I) unexport_ self
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
