structure GioDBusObjectManager :>
  GIO_D_BUS_OBJECT_MANAGER
    where type 'a class_t = 'a GioDBusObjectManagerClass.t
    where type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    where type 'a dbusobjectclass_t = 'a GioDBusObjectClass.t =
  struct
    val getType_ = _import "g_dbus_object_manager_get_type" : unit -> GObjectType.C.val_;
    val getInterface_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_object_manager_get_interface" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getObjectPath_ = _import "g_dbus_object_manager_get_object_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    type 'a class_t = 'a GioDBusObjectManagerClass.t
    type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    type 'a dbusobjectclass_t = 'a GioDBusObjectClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInterface self objectPath interfaceName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> GioDBusInterfaceClass.C.fromPtr true
      )
        getInterface_
        (
          self
           & objectPath
           & interfaceName
        )
    fun getObject self objectPath = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GioDBusObjectClass.C.fromPtr true) getObject_ (self & objectPath)
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f object interface)
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f object interface)
      fun objectAddedSig f = signal "object-added" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
      fun objectRemovedSig f = signal "object-removed" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
    end
  end
