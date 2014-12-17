structure GioDBusObjectSkeleton :>
  GIO_D_BUS_OBJECT_SKELETON
    where type 'a class_t = 'a GioDBusObjectSkeletonClass.t
    where type 'a dbusobjectclass_t = 'a GioDBusObjectClass.t
    where type 'a dbusmethodinvocationclass_t = 'a GioDBusMethodInvocationClass.t
    where type 'a dbusinterfaceskeletonclass_t = 'a GioDBusInterfaceSkeletonClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_skeleton_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_dbus_object_skeleton_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val addInterface_ = call (load_sym libgio "g_dbus_object_skeleton_add_interface") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val flush_ = call (load_sym libgio "g_dbus_object_skeleton_flush") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeInterface_ = call (load_sym libgio "g_dbus_object_skeleton_remove_interface") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeInterfaceByName_ = call (load_sym libgio "g_dbus_object_skeleton_remove_interface_by_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setObjectPath_ = call (load_sym libgio "g_dbus_object_skeleton_set_object_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioDBusObjectSkeletonClass.t
    type 'a dbusobjectclass_t = 'a GioDBusObjectClass.t
    type 'a dbusmethodinvocationclass_t = 'a GioDBusMethodInvocationClass.t
    type 'a dbusinterfaceskeletonclass_t = 'a GioDBusInterfaceSkeletonClass.t
    type t = base class_t
    fun asDBusObject self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new objectPath = (FFI.String.C.withConstPtr ---> GioDBusObjectSkeletonClass.C.fromPtr true) new_ objectPath
    fun addInterface self interface = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addInterface_ (self & interface)
    fun flush self = (GObjectObjectClass.C.withPtr ---> I) flush_ self
    fun removeInterface self interface = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeInterface_ (self & interface)
    fun removeInterfaceByName self interfaceName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) removeInterfaceByName_ (self & interfaceName)
    fun setObjectPath self objectPath = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setObjectPath_ (self & objectPath)
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
