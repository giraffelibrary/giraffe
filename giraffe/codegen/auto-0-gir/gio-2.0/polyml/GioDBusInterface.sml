structure GioDBusInterface :>
  GIO_D_BUS_INTERFACE
    where type 'a class = 'a GioDBusInterfaceClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_interface_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val dupObject_ = call (getSymbol "g_dbus_interface_dup_object") (GioDBusInterfaceClass.PolyML.cPtr --> GioDBusObjectClass.PolyML.cPtr)
      val getInfo_ = call (getSymbol "g_dbus_interface_get_info") (GioDBusInterfaceClass.PolyML.cPtr --> GioDBusInterfaceInfoRecord.PolyML.cPtr)
      val setObject_ = call (getSymbol "g_dbus_interface_set_object") (GioDBusInterfaceClass.PolyML.cPtr &&> GioDBusObjectClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GioDBusInterfaceClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun dupObject self = (GioDBusInterfaceClass.FFI.withPtr ---> GioDBusObjectClass.FFI.fromPtr true) dupObject_ self
    fun getInfo self = (GioDBusInterfaceClass.FFI.withPtr ---> GioDBusInterfaceInfoRecord.FFI.fromPtr false) getInfo_ self
    fun setObject self object = (GioDBusInterfaceClass.FFI.withPtr &&&> GioDBusObjectClass.FFI.withOptPtr ---> I) setObject_ (self & object)
  end
