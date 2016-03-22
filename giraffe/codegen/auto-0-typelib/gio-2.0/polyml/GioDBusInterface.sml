structure GioDBusInterface :>
  GIO_D_BUS_INTERFACE
    where type 'a class = 'a GioDBusInterfaceClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_interface_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getInfo_ = call (load_sym libgio "g_dbus_interface_get_info") (GioDBusInterfaceClass.PolyML.cPtr --> GioDBusInterfaceInfoRecord.PolyML.cPtr)
      val getObject_ = call (load_sym libgio "g_dbus_interface_get_object") (GioDBusInterfaceClass.PolyML.cPtr --> GioDBusObjectClass.PolyML.cPtr)
      val setObject_ = call (load_sym libgio "g_dbus_interface_set_object") (GioDBusInterfaceClass.PolyML.cPtr &&> GioDBusObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioDBusInterfaceClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInfo self = (GioDBusInterfaceClass.C.withPtr ---> GioDBusInterfaceInfoRecord.C.fromPtr false) getInfo_ self
    fun getObject self = (GioDBusInterfaceClass.C.withPtr ---> GioDBusObjectClass.C.fromPtr false) getObject_ self
    fun setObject self object = (GioDBusInterfaceClass.C.withPtr &&&> GioDBusObjectClass.C.withPtr ---> I) setObject_ (self & object)
  end
