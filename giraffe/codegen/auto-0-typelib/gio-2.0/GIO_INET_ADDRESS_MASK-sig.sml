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
    val addressProp :
      {
        get : 'a class -> base inet_address_class option,
        set :
          'b inet_address_class option
           -> 'a class
           -> unit,
        new : 'b inet_address_class option -> 'a class Property.t
      }
    val familyProp : {get : 'a class -> socket_family_t}
    val lengthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
