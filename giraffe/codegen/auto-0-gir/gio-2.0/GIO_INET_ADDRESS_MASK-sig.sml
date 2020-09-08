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
    val addressProp : ('a class, unit -> base inet_address_class option, 'b inet_address_class option -> unit, 'b inet_address_class option -> unit) Property.t
    val familyProp : ('a class, unit -> socket_family_t, unit, unit) Property.t
    val lengthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
