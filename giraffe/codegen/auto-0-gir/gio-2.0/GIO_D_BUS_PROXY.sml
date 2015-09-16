signature GIO_D_BUS_PROXY =
  sig
    type 'a class_t
    type 'a async_initable_class_t
    type 'a d_bus_interface_class_t
    type 'a initable_class_t
    type 'a async_result_class_t
    type 'a cancellable_class_t
    type 'a unix_f_d_list_class_t
    type d_bus_call_flags_t
    type bus_type_t
    type 'a d_bus_connection_class_t
    type d_bus_proxy_flags_t
    type d_bus_interface_info_record_t
    type t = base class_t
    val asAsyncInitable : 'a class_t -> base async_initable_class_t
    val asDBusInterface : 'a class_t -> base d_bus_interface_class_t
    val asInitable : 'a class_t -> base initable_class_t
    val getType : unit -> GObject.Type.t
    val newFinish : 'a async_result_class_t -> base class_t
    val newForBusFinish : 'a async_result_class_t -> base class_t
    val newForBusSync :
      bus_type_t
       -> d_bus_proxy_flags_t
       -> d_bus_interface_info_record_t option
       -> string
       -> string
       -> string
       -> 'a cancellable_class_t option
       -> base class_t
    val newSync :
      'a d_bus_connection_class_t
       -> d_bus_proxy_flags_t
       -> d_bus_interface_info_record_t option
       -> string option
       -> string
       -> string
       -> 'b cancellable_class_t option
       -> base class_t
    val callFinish :
      'a class_t
       -> 'b async_result_class_t
       -> GLib.VariantRecord.t
    val callSync :
      'a class_t
       -> string
       -> GLib.VariantRecord.t option
       -> d_bus_call_flags_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> GLib.VariantRecord.t
    val callWithUnixFdListFinish :
      'a class_t
       -> 'b async_result_class_t
       -> GLib.VariantRecord.t * base unix_f_d_list_class_t
    val callWithUnixFdListSync :
      'a class_t
       -> string
       -> GLib.VariantRecord.t option
       -> d_bus_call_flags_t
       -> LargeInt.int
       -> 'b unix_f_d_list_class_t option
       -> 'c cancellable_class_t option
       -> GLib.VariantRecord.t * base unix_f_d_list_class_t
    val getCachedProperty :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
    val getConnection : 'a class_t -> base d_bus_connection_class_t
    val getDefaultTimeout : 'a class_t -> LargeInt.int
    val getFlags : 'a class_t -> d_bus_proxy_flags_t
    val getInterfaceInfo : 'a class_t -> d_bus_interface_info_record_t
    val getInterfaceName : 'a class_t -> string
    val getName : 'a class_t -> string
    val getNameOwner : 'a class_t -> string
    val getObjectPath : 'a class_t -> string
    val setCachedProperty :
      'a class_t
       -> string
       -> GLib.VariantRecord.t option
       -> unit
    val setDefaultTimeout :
      'a class_t
       -> LargeInt.int
       -> unit
    val setInterfaceInfo :
      'a class_t
       -> d_bus_interface_info_record_t option
       -> unit
    val gSignalSig :
      (string
        -> string
        -> GLib.VariantRecord.t
        -> unit)
       -> 'a class_t Signal.signal
    val gBusTypeProp : ('a class_t, bus_type_t) Property.writeonly
    val gConnectionProp : ('a class_t, base d_bus_connection_class_t option, 'b d_bus_connection_class_t option) Property.readwrite
    val gDefaultTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gFlagsProp : ('a class_t, d_bus_proxy_flags_t, d_bus_proxy_flags_t) Property.readwrite
    val gInterfaceInfoProp : ('a class_t, d_bus_interface_info_record_t option, d_bus_interface_info_record_t option) Property.readwrite
    val gInterfaceNameProp : ('a class_t, string option, string option) Property.readwrite
    val gNameProp : ('a class_t, string option, string option) Property.readwrite
    val gNameOwnerProp : ('a class_t, string option) Property.readonly
    val gObjectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
