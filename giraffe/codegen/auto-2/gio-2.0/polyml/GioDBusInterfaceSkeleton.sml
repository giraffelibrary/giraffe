structure GioDBusInterfaceSkeleton :>
  GIO_D_BUS_INTERFACE_SKELETON
    where type 'a class_t = 'a GioDBusInterfaceSkeletonClass.t
    where type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    where type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    where type dbusinterfaceinforecord_t = GioDBusInterfaceInfoRecord.t
    where type 'a dbusmethodinvocationclass_t = 'a GioDBusMethodInvocationClass.t
    where type dbusinterfaceskeletonflags_t = GioDBusInterfaceSkeletonFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_interface_skeleton_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val export_ =
        call (load_sym libgio "g_dbus_interface_skeleton_export")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val flush_ = call (load_sym libgio "g_dbus_interface_skeleton_flush") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getConnection_ = call (load_sym libgio "g_dbus_interface_skeleton_get_connection") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFlags_ = call (load_sym libgio "g_dbus_interface_skeleton_get_flags") (GObjectObjectClass.PolyML.PTR --> GioDBusInterfaceSkeletonFlags.PolyML.VAL)
      val getInfo_ = call (load_sym libgio "g_dbus_interface_skeleton_get_info") (GObjectObjectClass.PolyML.PTR --> GioDBusInterfaceInfoRecord.PolyML.PTR)
      val getObjectPath_ = call (load_sym libgio "g_dbus_interface_skeleton_get_object_path") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getProperties_ = call (load_sym libgio "g_dbus_interface_skeleton_get_properties") (GObjectObjectClass.PolyML.PTR --> GLibVariantRecord.PolyML.PTR)
      val setFlags_ = call (load_sym libgio "g_dbus_interface_skeleton_set_flags") (GObjectObjectClass.PolyML.PTR &&> GioDBusInterfaceSkeletonFlags.PolyML.VAL --> FFI.PolyML.VOID)
      val unexport_ = call (load_sym libgio "g_dbus_interface_skeleton_unexport") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioDBusInterfaceSkeletonClass.t
    type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    type dbusinterfaceinforecord_t = GioDBusInterfaceInfoRecord.t
    type 'a dbusmethodinvocationclass_t = 'a GioDBusMethodInvocationClass.t
    type dbusinterfaceskeletonflags_t = GioDBusInterfaceSkeletonFlags.t
    fun asDBusInterface self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun export self connection objectPath =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getObjectPath_ self
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
