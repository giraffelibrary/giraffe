structure GioDBusObject :>
  GIO_D_BUS_OBJECT
    where type 'a class = 'a GioDBusObjectClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getInterface_ = call (load_sym libgio "g_dbus_object_get_interface") (GioDBusObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusInterfaceClass.PolyML.cPtr)
      val getObjectPath_ = call (load_sym libgio "g_dbus_object_get_object_path") (GioDBusObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioDBusObjectClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInterface self interfaceName = (GioDBusObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioDBusInterfaceClass.C.fromPtr true) getInterface_ (self & interfaceName)
    fun getObjectPath self = (GioDBusObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
    end
  end
