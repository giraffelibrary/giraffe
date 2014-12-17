signature GIO_PROXY_ADDRESS =
  sig
    type 'a class_t
    type 'a socketconnectableclass_t
    type 'a inetaddressclass_t
    type t = base class_t
    val asSocketConnectable : 'a class_t -> base socketconnectableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a inetaddressclass_t
       -> LargeInt.int
       -> string
       -> string
       -> LargeInt.int
       -> string option
       -> string option
       -> base class_t
    val getDestinationHostname : 'a class_t -> string
    val getDestinationPort : 'a class_t -> LargeInt.int
    val getPassword : 'a class_t -> string
    val getProtocol : 'a class_t -> string
    val getUsername : 'a class_t -> string
    val destinationHostnameProp : ('a class_t, string option, string option) Property.readwrite
    val destinationPortProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val passwordProp : ('a class_t, string option, string option) Property.readwrite
    val protocolProp : ('a class_t, string option, string option) Property.readwrite
    val usernameProp : ('a class_t, string option, string option) Property.readwrite
  end
