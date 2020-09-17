structure GioDBusInterface :>
  GIO_D_BUS_INTERFACE
    where type 'a class = 'a GioDBusInterfaceClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    val getType_ = _import "g_dbus_interface_get_type" : unit -> GObjectType.FFI.val_;
    val getObject_ = _import "g_dbus_interface_dup_object" : GioDBusInterfaceClass.FFI.non_opt GioDBusInterfaceClass.FFI.p -> GioDBusObjectClass.FFI.non_opt GioDBusObjectClass.FFI.p;
    val getInfo_ = _import "g_dbus_interface_get_info" : GioDBusInterfaceClass.FFI.non_opt GioDBusInterfaceClass.FFI.p -> GioDBusInterfaceInfoRecord.FFI.non_opt GioDBusInterfaceInfoRecord.FFI.p;
    val setObject_ = fn x1 & x2 => (_import "g_dbus_interface_set_object" : GioDBusInterfaceClass.FFI.non_opt GioDBusInterfaceClass.FFI.p * GioDBusObjectClass.FFI.opt GioDBusObjectClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GioDBusInterfaceClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getObject self = (GioDBusInterfaceClass.FFI.withPtr false ---> GioDBusObjectClass.FFI.fromPtr true) getObject_ self
    fun getInfo self = (GioDBusInterfaceClass.FFI.withPtr false ---> GioDBusInterfaceInfoRecord.FFI.fromPtr false) getInfo_ self before GioDBusInterfaceClass.FFI.touchPtr self
    fun setObject self object = (GioDBusInterfaceClass.FFI.withPtr false &&&> GioDBusObjectClass.FFI.withOptPtr false ---> I) setObject_ (self & object)
  end
