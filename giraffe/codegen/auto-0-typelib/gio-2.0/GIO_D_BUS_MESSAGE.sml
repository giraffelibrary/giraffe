signature GIO_D_BUS_MESSAGE =
  sig
    type 'a class_t
    type dbusmessagebyteorder_t
    type dbusmessageflags_t
    type dbusmessageheaderfield_t
    type dbusmessagetype_t
    type 'a unixfdlistclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newMethodCall :
      string
       -> string
       -> string
       -> string
       -> base class_t
    val newSignal :
      string
       -> string
       -> string
       -> base class_t
    val copy : 'a class_t -> base class_t
    val getArg0 : 'a class_t -> string
    val getBody : 'a class_t -> GLib.VariantRecord.t
    val getByteOrder : 'a class_t -> dbusmessagebyteorder_t
    val getDestination : 'a class_t -> string
    val getErrorName : 'a class_t -> string
    val getFlags : 'a class_t -> dbusmessageflags_t
    val getHeader :
      'a class_t
       -> dbusmessageheaderfield_t
       -> GLib.VariantRecord.t
    val getInterface : 'a class_t -> string
    val getLocked : 'a class_t -> bool
    val getMember : 'a class_t -> string
    val getMessageType : 'a class_t -> dbusmessagetype_t
    val getNumUnixFds : 'a class_t -> LargeInt.int
    val getPath : 'a class_t -> string
    val getReplySerial : 'a class_t -> LargeInt.int
    val getSender : 'a class_t -> string
    val getSerial : 'a class_t -> LargeInt.int
    val getSignature : 'a class_t -> string
    val getUnixFdList : 'a class_t -> base unixfdlistclass_t
    val lock : 'a class_t -> unit
    val newMethodErrorLiteral :
      'a class_t
       -> string
       -> string
       -> base class_t
    val newMethodReply : 'a class_t -> base class_t
    val print :
      'a class_t
       -> LargeInt.int
       -> string
    val setBody :
      'a class_t
       -> GLib.VariantRecord.t
       -> unit
    val setByteOrder :
      'a class_t
       -> dbusmessagebyteorder_t
       -> unit
    val setDestination :
      'a class_t
       -> string
       -> unit
    val setErrorName :
      'a class_t
       -> string
       -> unit
    val setFlags :
      'a class_t
       -> dbusmessageflags_t
       -> unit
    val setHeader :
      'a class_t
       -> dbusmessageheaderfield_t
       -> GLib.VariantRecord.t
       -> unit
    val setInterface :
      'a class_t
       -> string
       -> unit
    val setMember :
      'a class_t
       -> string
       -> unit
    val setMessageType :
      'a class_t
       -> dbusmessagetype_t
       -> unit
    val setNumUnixFds :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPath :
      'a class_t
       -> string
       -> unit
    val setReplySerial :
      'a class_t
       -> LargeInt.int
       -> unit
    val setSender :
      'a class_t
       -> string
       -> unit
    val setSerial :
      'a class_t
       -> LargeInt.int
       -> unit
    val setSignature :
      'a class_t
       -> string
       -> unit
    val setUnixFdList :
      'a class_t
       -> 'b unixfdlistclass_t option
       -> unit
    val toGerror : 'a class_t -> bool
    val lockedProp : ('a class_t, bool) Property.readonly
  end
