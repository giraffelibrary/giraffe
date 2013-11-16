structure GioDBusObjectManager :>
  GIO_D_BUS_OBJECT_MANAGER
    where type 'a class_t = 'a GioDBusObjectManagerClass.t
    where type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    where type 'a dbusobjectclass_t = 'a GioDBusObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_manager_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getInterface_ =
        call (load_sym libgio "g_dbus_object_manager_get_interface")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val getObject_ = call (load_sym libgio "g_dbus_object_manager_get_object") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getObjectPath_ = call (load_sym libgio "g_dbus_object_manager_get_object_path") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end
    type 'a class_t = 'a GioDBusObjectManagerClass.t
    type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    type 'a dbusobjectclass_t = 'a GioDBusObjectClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInterface self objectPath interfaceName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> GioDBusInterfaceClass.C.fromPtr true
      )
        getInterface_
        (
          self
           & objectPath
           & interfaceName
        )
    fun getObject self objectPath = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioDBusObjectClass.C.fromPtr true) getObject_ (self & objectPath)
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f object interface)
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f object interface)
      fun objectAddedSig f = signal "object-added" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
      fun objectRemovedSig f = signal "object-removed" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
    end
  end
