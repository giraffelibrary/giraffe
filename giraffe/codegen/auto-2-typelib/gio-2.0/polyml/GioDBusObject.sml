structure GioDBusObject :>
  GIO_D_BUS_OBJECT
    where type 'a class_t = 'a GioDBusObjectClass.t
    where type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getInterface_ = call (load_sym libgio "g_dbus_object_get_interface") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getObjectPath_ = call (load_sym libgio "g_dbus_object_get_object_path") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end
    type 'a class_t = 'a GioDBusObjectClass.t
    type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInterface self interfaceName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioDBusInterfaceClass.C.fromPtr true) getInterface_ (self & interfaceName)
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
    end
  end
