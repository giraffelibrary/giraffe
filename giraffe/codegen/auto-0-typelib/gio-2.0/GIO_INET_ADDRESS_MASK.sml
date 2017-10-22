signature GIO_INET_ADDRESS_MASK =
  sig
    type 'a class
    type 'a initable_class
    type 'a inet_address_class
    type socket_family_t
    type t = base class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val new : 'a inet_address_class * LargeInt.int -> base class
    val newFromString : string -> base class
    val equal :
      'a class
       -> 'b class
       -> bool
    val getAddress : 'a class -> base inet_address_class
    val getFamily : 'a class -> socket_family_t
    val getLength : 'a class -> LargeInt.int
    val matches :
      'a class
       -> 'b inet_address_class
       -> bool
    val toString : 'a class -> string
    val addressProp : ('a class, base inet_address_class option, 'b inet_address_class option) Property.readwrite
    val familyProp : ('a class, socket_family_t) Property.readonly
    val lengthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
