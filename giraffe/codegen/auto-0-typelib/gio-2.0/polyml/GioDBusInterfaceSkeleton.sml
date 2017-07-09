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
      val getType_ = call (getSymbol "g_dbus_interface_skeleton_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val export_ =
        call (getSymbol "g_dbus_interface_skeleton_export")
          (
            GioDBusInterfaceSkeletonClass.PolyML.cPtr
             &&> GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val flush_ = call (getSymbol "g_dbus_interface_skeleton_flush") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> cVoid)
      val getConnection_ = call (getSymbol "g_dbus_interface_skeleton_get_connection") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getFlags_ = call (getSymbol "g_dbus_interface_skeleton_get_flags") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> GioDBusInterfaceSkeletonFlags.PolyML.cVal)
      val getInfo_ = call (getSymbol "g_dbus_interface_skeleton_get_info") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> GioDBusInterfaceInfoRecord.PolyML.cPtr)
      val getObjectPath_ = call (getSymbol "g_dbus_interface_skeleton_get_object_path") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProperties_ = call (getSymbol "g_dbus_interface_skeleton_get_properties") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val setFlags_ = call (getSymbol "g_dbus_interface_skeleton_set_flags") (GioDBusInterfaceSkeletonClass.PolyML.cPtr &&> GioDBusInterfaceSkeletonFlags.PolyML.cVal --> cVoid)
      val unexport_ = call (getSymbol "g_dbus_interface_skeleton_unexport") (GioDBusInterfaceSkeletonClass.PolyML.cPtr --> cVoid)
    end
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
