structure GioDBusObject :>
  GIO_D_BUS_OBJECT
    where type 'a class_t = 'a GioDBusObjectClass.t
    where type 'a d_bus_interface_class_t = 'a GioDBusInterfaceClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getInterface_ = call (load_sym libgio "g_dbus_object_get_interface") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getObjectPath_ = call (load_sym libgio "g_dbus_object_get_object_path") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class_t = 'a GioDBusObjectClass.t
    type 'a d_bus_interface_class_t = 'a GioDBusInterfaceClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInterface self interfaceName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioDBusInterfaceClass.C.fromPtr true) getInterface_ (self & interfaceName)
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
    end
  end
