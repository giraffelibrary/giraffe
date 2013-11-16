signature GIO_UNIX_SOCKET_ADDRESS =
  sig
    type 'a class_t
    type unixsocketaddresstype_t
    type 'a socketconnectableclass_t
    val asSocketConnectable : 'a class_t -> base socketconnectableclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val abstractNamesSupported : unit -> bool
    val getAddressType : 'a class_t -> unixsocketaddresstype_t
    val getPath : 'a class_t -> string
    val getPathLen : 'a class_t -> LargeInt.int
    val abstractProp : ('a class_t, bool, bool) Property.readwrite
    val addressTypeProp : ('a class_t, unixsocketaddresstype_t, unixsocketaddresstype_t) Property.readwrite
    val pathProp : ('a class_t, string option, string option) Property.readwrite
  end
