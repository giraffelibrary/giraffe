structure GioDBusObject :>
  GIO_D_BUS_OBJECT
    where type 'a class_t = 'a GioDBusObjectClass.t
    where type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t =
  struct
    val getType_ = _import "g_dbus_object_get_type" : unit -> GObjectType.C.val_;
    val getInterface_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_get_interface" :
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
    val getObjectPath_ = _import "g_dbus_object_get_object_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    type 'a class_t = 'a GioDBusObjectClass.t
    type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInterface self interfaceName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioDBusInterfaceClass.C.fromPtr true) getInterface_ (self & interfaceName)
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
    end
  end
