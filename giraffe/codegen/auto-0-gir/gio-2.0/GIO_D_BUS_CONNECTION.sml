signature GIO_D_BUS_CONNECTION =
  sig
    type 'a class
    type 'a async_initable_class
    type 'a initable_class
    type 'a unix_f_d_list_class
    type d_bus_call_flags_t
    type 'a credentials_class
    type 'a async_result_class
    type 'a cancellable_class
    type d_bus_send_message_flags_t
    type 'a d_bus_message_class
    type 'a d_bus_auth_observer_class
    type d_bus_capability_flags_t
    type d_bus_connection_flags_t
    type 'a i_o_stream_class
    type t = base class
    val asAsyncInitable : 'a class -> base async_initable_class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val newFinish : 'a async_result_class -> base class
    val newForAddressFinish : 'a async_result_class -> base class
    val newForAddressSync :
      string
       * d_bus_connection_flags_t
       * 'a d_bus_auth_observer_class option
       * 'b cancellable_class option
       -> base class
    val newSync :
      'a i_o_stream_class
       * string option
       * d_bus_connection_flags_t
       * 'b d_bus_auth_observer_class option
       * 'c cancellable_class option
       -> base class
    val callFinish :
      'a class
       -> 'b async_result_class
       -> GLib.VariantRecord.t
    val callSync :
      'a class
       -> string
           * string
           * string
           * string
           * GLib.VariantRecord.t option
           * GLib.VariantTypeRecord.t option
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
           * string
           * string
           * string
           * GLib.VariantRecord.t option
           * GLib.VariantTypeRecord.t option
           * d_bus_call_flags_t
           * LargeInt.int
           * 'b unix_f_d_list_class option
           * 'c cancellable_class option
       -> GLib.VariantRecord.t * base unix_f_d_list_class
    val closeFinish :
      'a class
       -> 'b async_result_class
       -> bool
    val closeSync :
      'a class
       -> 'b cancellable_class option
       -> bool
    val emitSignal :
      'a class
       -> string option
           * string
           * string
           * string
           * GLib.VariantRecord.t option
       -> bool
    val flushFinish :
      'a class
       -> 'b async_result_class
       -> bool
    val flushSync :
      'a class
       -> 'b cancellable_class option
       -> bool
    val getCapabilities : 'a class -> d_bus_capability_flags_t
    val getExitOnClose : 'a class -> bool
    val getGuid : 'a class -> string
    val getPeerCredentials : 'a class -> base credentials_class
    val getStream : 'a class -> base i_o_stream_class
    val getUniqueName : 'a class -> string
    val isClosed : 'a class -> bool
    val removeFilter :
      'a class
       -> LargeInt.int
       -> unit
    val sendMessage :
      'a class
       -> 'b d_bus_message_class * d_bus_send_message_flags_t
       -> LargeInt.int option
    val sendMessageWithReplyFinish :
      'a class
       -> 'b async_result_class
       -> base d_bus_message_class
    val sendMessageWithReplySync :
      'a class
       -> 'b d_bus_message_class
           * d_bus_send_message_flags_t
           * LargeInt.int
           * 'c cancellable_class option
       -> base d_bus_message_class * LargeInt.int
    val setExitOnClose :
      'a class
       -> bool
       -> unit
    val signalUnsubscribe :
      'a class
       -> LargeInt.int
       -> unit
    val startMessageProcessing : 'a class -> unit
    val unregisterObject :
      'a class
       -> LargeInt.int
       -> bool
    val unregisterSubtree :
      'a class
       -> LargeInt.int
       -> bool
    val addressProp : ('a class, string option) Property.writeonly
    val authenticationObserverProp : ('a class, 'b d_bus_auth_observer_class option) Property.writeonly
    val capabilitiesProp : ('a class, d_bus_capability_flags_t) Property.readonly
    val closedProp : ('a class, bool) Property.readonly
    val exitOnCloseProp : ('a class, bool, bool) Property.readwrite
    val flagsProp : ('a class, d_bus_connection_flags_t) Property.writeonly
    val guidProp : ('a class, string option, string option) Property.readwrite
    val streamProp : ('a class, base i_o_stream_class option, 'b i_o_stream_class option) Property.readwrite
    val uniqueNameProp : ('a class, string option) Property.readonly
  end
