structure GioDBusInterface :>
  GIO_D_BUS_INTERFACE
    where type 'a class = 'a GioDBusInterfaceClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    val getType_ = _import "g_dbus_interface_get_type" : unit -> GObjectType.FFI.val_;
    val getInfo_ = _import "g_dbus_interface_get_info" : GioDBusInterfaceClass.FFI.notnull GioDBusInterfaceClass.FFI.p -> GioDBusInterfaceInfoRecord.FFI.notnull GioDBusInterfaceInfoRecord.FFI.p;
    val getObject_ = _import "g_dbus_interface_get_object" : GioDBusInterfaceClass.FFI.notnull GioDBusInterfaceClass.FFI.p -> GioDBusObjectClass.FFI.notnull GioDBusObjectClass.FFI.p;
    val setObject_ = fn x1 & x2 => (_import "g_dbus_interface_set_object" : GioDBusInterfaceClass.FFI.notnull GioDBusInterfaceClass.FFI.p * GioDBusObjectClass.FFI.notnull GioDBusObjectClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GioDBusInterfaceClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getInfo self = (GioDBusInterfaceClass.FFI.withPtr ---> GioDBusInterfaceInfoRecord.FFI.fromPtr false) getInfo_ self
    fun getObject self = (GioDBusInterfaceClass.FFI.withPtr ---> GioDBusObjectClass.FFI.fromPtr false) getObject_ self
    fun setObject self object = (GioDBusInterfaceClass.FFI.withPtr &&&> GioDBusObjectClass.FFI.withPtr ---> I) setObject_ (self & object)
  end
