signature GIO_D_BUS_OBJECT_MANAGER_CLIENT =
  sig
    type 'a class
    type 'a async_initable_class
    type 'a d_bus_object_manager_class
    type 'a initable_class
    type 'a async_result_class
    type 'a d_bus_proxy_class
    type 'a d_bus_object_proxy_class
    type bus_type_t
    type 'a d_bus_connection_class
    type d_bus_object_manager_client_flags_t
    type t = base class
    val asAsyncInitable : 'a class -> base async_initable_class
    val asDBusObjectManager : 'a class -> base d_bus_object_manager_class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val newFinish : 'a async_result_class -> base class
    val newForBusFinish : 'a async_result_class -> base class
    val getConnection : 'a class -> base d_bus_connection_class
    val getFlags : 'a class -> d_bus_object_manager_client_flags_t
    val getName : 'a class -> string
    val getNameOwner : 'a class -> string option
    val interfaceProxyPropertiesChangedSig :
      (base d_bus_object_proxy_class
        * base d_bus_proxy_class
        * GLib.VariantRecord.t
        * string list
        -> unit)
       -> 'a class Signal.t
    val interfaceProxySignalSig :
      (base d_bus_object_proxy_class
        * base d_bus_proxy_class
        * string
        * string
        * GLib.VariantRecord.t
        -> unit)
       -> 'a class Signal.t
    val busTypeProp : ('a class, bus_type_t) Property.writeonly
    val connectionProp : ('a class, base d_bus_connection_class option, 'b d_bus_connection_class option) Property.readwrite
    val flagsProp : ('a class, d_bus_object_manager_client_flags_t, d_bus_object_manager_client_flags_t) Property.readwrite
    val nameProp : ('a class, string option, string option) Property.readwrite
    val nameOwnerProp : ('a class, string option) Property.readonly
    val objectPathProp : ('a class, string option, string option) Property.readwrite
  end
