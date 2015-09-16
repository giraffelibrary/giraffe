signature GIO_D_BUS_CONNECTION =
  sig
    type 'a class_t
    type 'a async_initable_class_t
    type 'a initable_class_t
    type 'a unix_f_d_list_class_t
    type d_bus_call_flags_t
    type 'a credentials_class_t
    type 'a async_result_class_t
    type 'a cancellable_class_t
    type d_bus_send_message_flags_t
    type 'a d_bus_message_class_t
    type 'a d_bus_auth_observer_class_t
    type d_bus_capability_flags_t
    type d_bus_connection_flags_t
    type 'a i_o_stream_class_t
    type t = base class_t
    val asAsyncInitable : 'a class_t -> base async_initable_class_t
    val asInitable : 'a class_t -> base initable_class_t
    val getType : unit -> GObject.Type.t
    val newFinish : 'a async_result_class_t -> base class_t
    val newForAddressFinish : 'a async_result_class_t -> base class_t
    val newForAddressSync :
      string
       -> d_bus_connection_flags_t
       -> 'a d_bus_auth_observer_class_t option
       -> 'b cancellable_class_t option
       -> base class_t
    val newSync :
      'a i_o_stream_class_t
       -> string option
       -> d_bus_connection_flags_t
       -> 'b d_bus_auth_observer_class_t option
       -> 'c cancellable_class_t option
       -> base class_t
    val callFinish :
      'a class_t
       -> 'b async_result_class_t
       -> GLib.VariantRecord.t
    val callSync :
      'a class_t
       -> string
       -> string
       -> string
       -> string
       -> GLib.VariantRecord.t option
       -> GLib.VariantTypeRecord.t option
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
       -> string
       -> string
       -> string
       -> GLib.VariantRecord.t option
       -> GLib.VariantTypeRecord.t option
       -> d_bus_call_flags_t
       -> LargeInt.int
       -> 'b unix_f_d_list_class_t option
       -> 'c cancellable_class_t option
       -> GLib.VariantRecord.t * base unix_f_d_list_class_t
    val closeFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val closeSync :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val emitSignal :
      'a class_t
       -> string option
       -> string
       -> string
       -> string
       -> GLib.VariantRecord.t option
       -> bool
    val flushFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val flushSync :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val getCapabilities : 'a class_t -> d_bus_capability_flags_t
    val getExitOnClose : 'a class_t -> bool
    val getGuid : 'a class_t -> string
    val getPeerCredentials : 'a class_t -> base credentials_class_t
    val getStream : 'a class_t -> base i_o_stream_class_t
    val getUniqueName : 'a class_t -> string
    val isClosed : 'a class_t -> bool
    val removeFilter :
      'a class_t
       -> LargeInt.int
       -> unit
    val sendMessage :
      'a class_t
       -> 'b d_bus_message_class_t
       -> d_bus_send_message_flags_t
       -> LargeInt.int option
    val sendMessageWithReplyFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base d_bus_message_class_t
    val sendMessageWithReplySync :
      'a class_t
       -> 'b d_bus_message_class_t
       -> d_bus_send_message_flags_t
       -> LargeInt.int
       -> 'c cancellable_class_t option
       -> base d_bus_message_class_t * LargeInt.int
    val setExitOnClose :
      'a class_t
       -> bool
       -> unit
    val signalUnsubscribe :
      'a class_t
       -> LargeInt.int
       -> unit
    val startMessageProcessing : 'a class_t -> unit
    val unregisterObject :
      'a class_t
       -> LargeInt.int
       -> bool
    val unregisterSubtree :
      'a class_t
       -> LargeInt.int
       -> bool
    val addressProp : ('a class_t, string option) Property.writeonly
    val authenticationObserverProp : ('a class_t, 'b d_bus_auth_observer_class_t option) Property.writeonly
    val capabilitiesProp : ('a class_t, d_bus_capability_flags_t) Property.readonly
    val closedProp : ('a class_t, bool) Property.readonly
    val exitOnCloseProp : ('a class_t, bool, bool) Property.readwrite
    val flagsProp : ('a class_t, d_bus_connection_flags_t) Property.writeonly
    val guidProp : ('a class_t, string option, string option) Property.readwrite
    val streamProp : ('a class_t, base i_o_stream_class_t option, 'b i_o_stream_class_t option) Property.readwrite
    val uniqueNameProp : ('a class_t, string option) Property.readonly
  end
