structure GioDBusInterface :>
  GIO_D_BUS_INTERFACE
    where type 'a class_t = 'a GioDBusInterfaceClass.t
    where type d_bus_interface_info_record_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_object_class_t = 'a GioDBusObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_interface_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getInfo_ = call (load_sym libgio "g_dbus_interface_get_info") (GObjectObjectClass.PolyML.PTR --> GioDBusInterfaceInfoRecord.PolyML.PTR)
      val getObject_ = call (load_sym libgio "g_dbus_interface_get_object") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setObject_ = call (load_sym libgio "g_dbus_interface_set_object") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioDBusInterfaceClass.t
    type d_bus_interface_info_record_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_object_class_t = 'a GioDBusObjectClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInfo self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceInfoRecord.C.fromPtr false) getInfo_ self
    fun getObject self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectClass.C.fromPtr false) getObject_ self
    fun setObject self object = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setObject_ (self & object)
  end
