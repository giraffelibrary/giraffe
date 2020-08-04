structure GioDBusObject :>
  GIO_D_BUS_OBJECT
    where type 'a class = 'a GioDBusObjectClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_object_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getInterface_ = call (getSymbol "g_dbus_object_get_interface") (GioDBusObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusInterfaceClass.PolyML.cPtr)
      val getObjectPath_ = call (getSymbol "g_dbus_object_get_object_path") (GioDBusObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioDBusObjectClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getInterface self interfaceName = (GioDBusObjectClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioDBusInterfaceClass.FFI.fromPtr true) getInterface_ (self & interfaceName)
    fun getObjectPath self = (GioDBusObjectClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
    end
  end
