structure GioDBusInterfaceSkeleton :>
  GIO_D_BUS_INTERFACE_SKELETON
    where type 'a class = 'a GioDBusInterfaceSkeletonClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    where type d_bus_interface_skeleton_flags_t = GioDBusInterfaceSkeletonFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_interface_skeleton_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val export_ =
        call (load_sym libgio "g_dbus_interface_skeleton_export")
          (
            GioDBusInterfaceSkeletonClass.PolyML.cPtr
             &&> GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val flush_ = call (load_sym libgio "g_dbus_interface_skeleton_flush") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getConnection_ = call (load_sym libgio "g_dbus_interface_skeleton_get_connection") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getFlags_ = call (load_sym libgio "g_dbus_interface_skeleton_get_flags") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> GioDBusInterfaceSkeletonFlags.PolyML.cVal)
      val getInfo_ = call (load_sym libgio "g_dbus_interface_skeleton_get_info") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> GioDBusInterfaceInfoRecord.PolyML.cPtr)
      val getObjectPath_ = call (load_sym libgio "g_dbus_interface_skeleton_get_object_path") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProperties_ = call (load_sym libgio "g_dbus_interface_skeleton_get_properties") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val setFlags_ = call (load_sym libgio "g_dbus_interface_skeleton_set_flags") (GioDBusInterfaceSkeletonClass.PolyML.cPtr &&> GioDBusInterfaceSkeletonFlags.PolyML.cVal --> FFI.PolyML.cVoid)
      val unexport_ = call (load_sym libgio "g_dbus_interface_skeleton_unexport") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioDBusInterfaceSkeletonClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    type d_bus_interface_skeleton_flags_t = GioDBusInterfaceSkeletonFlags.t
    type t = base class
    fun asDBusInterface self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun export self connection objectPath =
      (
        GioDBusInterfaceSkeletonClass.C.withPtr
         &&&> GioDBusConnectionClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        export_
        (
          self
           & connection
           & objectPath
           & []
        )
    fun flush self = (GioDBusInterfaceSkeletonClass.C.withPtr ---> I) flush_ self
    fun getConnection self = (GioDBusInterfaceSkeletonClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getFlags self = (GioDBusInterfaceSkeletonClass.C.withPtr ---> GioDBusInterfaceSkeletonFlags.C.fromVal) getFlags_ self
    fun getInfo self = (GioDBusInterfaceSkeletonClass.C.withPtr ---> GioDBusInterfaceInfoRecord.C.fromPtr false) getInfo_ self
    fun getObjectPath self = (GioDBusInterfaceSkeletonClass.C.withPtr ---> Utf8.C.fromPtr false) getObjectPath_ self
    fun getProperties self = (GioDBusInterfaceSkeletonClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getProperties_ self
    fun setFlags self flags = (GioDBusInterfaceSkeletonClass.C.withPtr &&&> GioDBusInterfaceSkeletonFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun unexport self = (GioDBusInterfaceSkeletonClass.C.withPtr ---> I) unexport_ self
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
