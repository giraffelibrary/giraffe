signature GIO_D_BUS_OBJECT_MANAGER_CLIENT =
  sig
    type 'a class_t
    type 'a async_initable_class_t
    type 'a d_bus_object_manager_class_t
    type 'a initable_class_t
    type 'a async_result_class_t
    type 'a d_bus_proxy_class_t
    type 'a d_bus_object_proxy_class_t
    type bus_type_t
    type 'a d_bus_connection_class_t
    type d_bus_object_manager_client_flags_t
    type t = base class_t
    val asAsyncInitable : 'a class_t -> base async_initable_class_t
    val asDBusObjectManager : 'a class_t -> base d_bus_object_manager_class_t
    val asInitable : 'a class_t -> base initable_class_t
    val getType : unit -> GObject.Type.t
    val newFinish : 'a async_result_class_t -> base class_t
    val newForBusFinish : 'a async_result_class_t -> base class_t
    val getConnection : 'a class_t -> base d_bus_connection_class_t
    val getFlags : 'a class_t -> d_bus_object_manager_client_flags_t
    val getName : 'a class_t -> string
    val getNameOwner : 'a class_t -> string
    val interfaceProxySignalSig :
      (base d_bus_object_proxy_class_t
        -> base d_bus_proxy_class_t
        -> string
        -> string
        -> GLib.VariantRecord.t
        -> unit)
       -> 'a class_t Signal.signal
    val busTypeProp : ('a class_t, bus_type_t) Property.writeonly
    val connectionProp : ('a class_t, base d_bus_connection_class_t option, 'b d_bus_connection_class_t option) Property.readwrite
    val flagsProp : ('a class_t, d_bus_object_manager_client_flags_t, d_bus_object_manager_client_flags_t) Property.readwrite
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val nameOwnerProp : ('a class_t, string option) Property.readonly
    val objectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
