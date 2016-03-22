structure GioDBusObjectManager :>
  GIO_D_BUS_OBJECT_MANAGER
    where type 'a class = 'a GioDBusObjectManagerClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    val getType_ = _import "g_dbus_object_manager_get_type" : unit -> GObjectType.C.val_;
    val getInterface_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_object_manager_get_interface" :
              GioDBusObjectManagerClass.C.notnull GioDBusObjectManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioDBusInterfaceClass.C.notnull GioDBusInterfaceClass.C.p;
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
              GioDBusObjectManagerClass.C.notnull GioDBusObjectManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioDBusObjectClass.C.notnull GioDBusObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getObjectPath_ = _import "g_dbus_object_manager_get_object_path" : GioDBusObjectManagerClass.C.notnull GioDBusObjectManagerClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type 'a class = 'a GioDBusObjectManagerClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInterface self objectPath interfaceName =
      (
        GioDBusObjectManagerClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GioDBusInterfaceClass.C.fromPtr true
      )
        getInterface_
        (
          self
           & objectPath
           & interfaceName
        )
    fun getObject self objectPath = (GioDBusObjectManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> GioDBusObjectClass.C.fromPtr true) getObject_ (self & objectPath)
    fun getObjectPath self = (GioDBusObjectManagerClass.C.withPtr ---> Utf8.C.fromPtr false) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f object interface)
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f object interface)
      fun objectAddedSig f = signal "object-added" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
      fun objectRemovedSig f = signal "object-removed" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
    end
  end
