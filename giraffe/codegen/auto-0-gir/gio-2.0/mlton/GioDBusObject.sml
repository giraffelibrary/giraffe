structure GioDBusObject :>
  GIO_D_BUS_OBJECT
    where type 'a class = 'a GioDBusObjectClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class =
  struct
    val getType_ = _import "g_dbus_object_get_type" : unit -> GObjectType.FFI.val_;
    val getInterface_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_get_interface" :
              GioDBusObjectClass.FFI.notnull GioDBusObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioDBusInterfaceClass.FFI.notnull GioDBusInterfaceClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getObjectPath_ = _import "g_dbus_object_get_object_path" : GioDBusObjectClass.FFI.notnull GioDBusObjectClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    type 'a class = 'a GioDBusObjectClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getInterface self interfaceName = (GioDBusObjectClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusInterfaceClass.FFI.fromPtr true) getInterface_ (self & interfaceName)
    fun getObjectPath self = (GioDBusObjectClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
    end
  end
