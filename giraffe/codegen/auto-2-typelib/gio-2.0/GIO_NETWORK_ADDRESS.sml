signature GIO_NETWORK_ADDRESS =
  sig
    type 'a class_t
    type 'a socketconnectableclass_t
    val asSocketConnectable : 'a class_t -> base socketconnectableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> LargeInt.int
       -> base socketconnectableclass_t
    val parse :
      string
       -> LargeInt.int
       -> base socketconnectableclass_t
    val parseUri :
      string
       -> LargeInt.int
       -> base socketconnectableclass_t
    val getHostname : 'a class_t -> string
    val getPort : 'a class_t -> LargeInt.int
    val getScheme : 'a class_t -> string
    val hostnameProp : ('a class_t, string option, string option) Property.readwrite
    val portProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val schemeProp : ('a class_t, string option, string option) Property.readwrite
  end
