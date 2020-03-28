signature GIO_D_BUS_MESSAGE =
  sig
    type 'a class
    type d_bus_message_byte_order_t
    type d_bus_message_flags_t
    type d_bus_message_header_field_t
    type d_bus_message_type_t
    type 'a unix_f_d_list_class
    type d_bus_capability_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromBlob : GUInt8CArrayN.t * d_bus_capability_flags_t -> base class
    val newMethodCall :
      string option
       * string
       * string option
       * string
       -> base class
    val newSignal :
      string
       * string
       * string
       -> base class
    val bytesNeeded : GUInt8CArrayN.t -> LargeInt.int
    val copy : 'a class -> base class
    val getArg0 : 'a class -> string
    val getBody : 'a class -> GLib.VariantRecord.t
    val getByteOrder : 'a class -> d_bus_message_byte_order_t
    val getDestination : 'a class -> string
    val getErrorName : 'a class -> string
    val getFlags : 'a class -> d_bus_message_flags_t
    val getHeader :
      'a class
       -> d_bus_message_header_field_t
       -> GLib.VariantRecord.t
    val getHeaderFields : 'a class -> GUInt8CArray.t
    val getInterface : 'a class -> string
    val getLocked : 'a class -> bool
    val getMember : 'a class -> string
    val getMessageType : 'a class -> d_bus_message_type_t
    val getNumUnixFds : 'a class -> LargeInt.int
    val getPath : 'a class -> string
    val getReplySerial : 'a class -> LargeInt.int
    val getSender : 'a class -> string
    val getSerial : 'a class -> LargeInt.int
    val getSignature : 'a class -> string
    val getUnixFdList : 'a class -> base unix_f_d_list_class
    val lock : 'a class -> unit
    val newMethodErrorLiteral :
      'a class
       -> string * string
       -> base class
    val newMethodReply : 'a class -> base class
    val print :
      'a class
       -> LargeInt.int
       -> string
    val setBody :
      'a class
       -> GLib.VariantRecord.t
       -> unit
    val setByteOrder :
      'a class
       -> d_bus_message_byte_order_t
       -> unit
    val setDestination :
      'a class
       -> string
       -> unit
    val setErrorName :
      'a class
       -> string
       -> unit
    val setFlags :
      'a class
       -> d_bus_message_flags_t
       -> unit
    val setHeader :
      'a class
       -> d_bus_message_header_field_t * GLib.VariantRecord.t option
       -> unit
    val setInterface :
      'a class
       -> string
       -> unit
    val setMember :
      'a class
       -> string
       -> unit
    val setMessageType :
      'a class
       -> d_bus_message_type_t
       -> unit
    val setNumUnixFds :
      'a class
       -> LargeInt.int
       -> unit
    val setPath :
      'a class
       -> string
       -> unit
    val setReplySerial :
      'a class
       -> LargeInt.int
       -> unit
    val setSender :
      'a class
       -> string
       -> unit
    val setSerial :
      'a class
       -> LargeInt.int
       -> unit
    val setSignature :
      'a class
       -> string
       -> unit
    val setUnixFdList :
      'a class
       -> 'b unix_f_d_list_class option
       -> unit
    val toBlob :
      'a class
       -> d_bus_capability_flags_t
       -> GUInt8CArrayN.t
    val toGerror : 'a class -> unit
    val lockedProp : {get : 'a class -> bool}
  end
