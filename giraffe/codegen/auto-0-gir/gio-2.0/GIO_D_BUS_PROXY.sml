signature GIO_D_BUS_PROXY =
  sig
    type 'a class
    type 'a async_initable_class
    type 'a d_bus_interface_class
    type 'a initable_class
    type 'a async_result_class
    type 'a cancellable_class
    type 'a unix_f_d_list_class
    type d_bus_call_flags_t
    type bus_type_t
    type 'a d_bus_connection_class
    type d_bus_proxy_flags_t
    type d_bus_interface_info_t
    type t = base class
    val asAsyncInitable : 'a class -> base async_initable_class
    val asDBusInterface : 'a class -> base d_bus_interface_class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val newFinish : 'a async_result_class -> base class
    val newForBusFinish : 'a async_result_class -> base class
    val newForBusSync :
      bus_type_t
       * d_bus_proxy_flags_t
       * d_bus_interface_info_t option
       * string
       * string
       * string
       * 'a cancellable_class option
       -> base class
    val newSync :
      'a d_bus_connection_class
       * d_bus_proxy_flags_t
       * d_bus_interface_info_t option
       * string option
       * string
       * string
       * 'b cancellable_class option
       -> base class
    val callFinish :
      'a class
       -> 'b async_result_class
       -> GLib.VariantRecord.t
    val callSync :
      'a class
       -> string
           * GLib.VariantRecord.t option
           * d_bus_call_flags_t
           * LargeInt.int
           * 'b cancellable_class option
       -> GLib.VariantRecord.t
    val callWithUnixFdListFinish :
      'a class
       -> 'b async_result_class
       -> GLib.VariantRecord.t * base unix_f_d_list_class
    val callWithUnixFdListSync :
      'a class
       -> string
           * GLib.VariantRecord.t option
           * d_bus_call_flags_t
           * LargeInt.int
           * 'b unix_f_d_list_class option
           * 'c cancellable_class option
       -> GLib.VariantRecord.t * base unix_f_d_list_class
    val getCachedProperty :
      'a class
       -> string
       -> GLib.VariantRecord.t
    val getCachedPropertyNames : 'a class -> string list
    val getConnection : 'a class -> base d_bus_connection_class
    val getDefaultTimeout : 'a class -> LargeInt.int
    val getFlags : 'a class -> d_bus_proxy_flags_t
    val getInterfaceInfo : 'a class -> d_bus_interface_info_t
    val getInterfaceName : 'a class -> string
    val getName : 'a class -> string
    val getNameOwner : 'a class -> string
    val getObjectPath : 'a class -> string
    val setCachedProperty :
      'a class
       -> string * GLib.VariantRecord.t option
       -> unit
    val setDefaultTimeout :
      'a class
       -> LargeInt.int
       -> unit
    val setInterfaceInfo :
      'a class
       -> d_bus_interface_info_t option
       -> unit
    val gPropertiesChangedSig : (GLib.VariantRecord.t * string list -> unit) -> 'a class Signal.t
    val gSignalSig :
      (string option
        * string
        * GLib.VariantRecord.t
        -> unit)
       -> 'a class Signal.t
    val gBusTypeProp : {new : bus_type_t -> 'a class Property.t}
    val gConnectionProp :
      {
        get : 'a class -> base d_bus_connection_class option,
        new : 'b d_bus_connection_class option -> 'a class Property.t
      }
    val gDefaultTimeoutProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val gFlagsProp :
      {
        get : 'a class -> d_bus_proxy_flags_t,
        new : d_bus_proxy_flags_t -> 'a class Property.t
      }
    val gInterfaceInfoProp :
      {
        get : 'a class -> d_bus_interface_info_t option,
        set :
          d_bus_interface_info_t option
           -> 'a class
           -> unit,
        new : d_bus_interface_info_t option -> 'a class Property.t
      }
    val gInterfaceNameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val gNameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val gNameOwnerProp : {get : 'a class -> string option}
    val gObjectPathProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
