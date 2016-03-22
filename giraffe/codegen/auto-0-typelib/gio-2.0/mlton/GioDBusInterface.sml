structure GioDBusInterface :>
  GIO_D_BUS_INTERFACE
    where type 'a class = 'a GioDBusInterfaceClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    val getType_ = _import "g_dbus_interface_get_type" : unit -> GObjectType.C.val_;
    val getInfo_ = _import "g_dbus_interface_get_info" : GioDBusInterfaceClass.C.notnull GioDBusInterfaceClass.C.p -> GioDBusInterfaceInfoRecord.C.notnull GioDBusInterfaceInfoRecord.C.p;
    val getObject_ = _import "g_dbus_interface_get_object" : GioDBusInterfaceClass.C.notnull GioDBusInterfaceClass.C.p -> GioDBusObjectClass.C.notnull GioDBusObjectClass.C.p;
    val setObject_ = fn x1 & x2 => (_import "g_dbus_interface_set_object" : GioDBusInterfaceClass.C.notnull GioDBusInterfaceClass.C.p * GioDBusObjectClass.C.notnull GioDBusObjectClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GioDBusInterfaceClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInfo self = (GioDBusInterfaceClass.C.withPtr ---> GioDBusInterfaceInfoRecord.C.fromPtr false) getInfo_ self
    fun getObject self = (GioDBusInterfaceClass.C.withPtr ---> GioDBusObjectClass.C.fromPtr false) getObject_ self
    fun setObject self object = (GioDBusInterfaceClass.C.withPtr &&&> GioDBusObjectClass.C.withPtr ---> I) setObject_ (self & object)
  end
