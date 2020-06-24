structure GioDBusObjectManager :>
  GIO_D_BUS_OBJECT_MANAGER
    where type 'a class = 'a GioDBusObjectManagerClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    val getType_ = _import "g_dbus_object_manager_get_type" : unit -> GObjectType.FFI.val_;
    val getInterface_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_object_manager_get_interface" :
              GioDBusObjectManagerClass.FFI.non_opt GioDBusObjectManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioDBusInterfaceClass.FFI.non_opt GioDBusInterfaceClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getObject_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_manager_get_object" :
              GioDBusObjectManagerClass.FFI.non_opt GioDBusObjectManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioDBusObjectClass.FFI.non_opt GioDBusObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getObjectPath_ = _import "g_dbus_object_manager_get_object_path" : GioDBusObjectManagerClass.FFI.non_opt GioDBusObjectManagerClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type 'a class = 'a GioDBusObjectManagerClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getInterface self (objectPath, interfaceName) =
      (
        GioDBusObjectManagerClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GioDBusInterfaceClass.FFI.fromPtr true
      )
        getInterface_
        (
          self
           & objectPath
           & interfaceName
        )
    fun getObject self objectPath = (GioDBusObjectManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusObjectClass.FFI.fromPtr true) getObject_ (self & objectPath)
    fun getObjectPath self = (GioDBusObjectManagerClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f (object, interface))
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f (object, interface))
      fun objectAddedSig f = signal "object-added" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
      fun objectRemovedSig f = signal "object-removed" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
    end
  end
