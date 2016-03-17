signature GIO_CREDENTIALS =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getUnixUser : 'a class -> LargeInt.int
    val isSameUser :
      'a class
       -> 'b class
       -> bool
    val setUnixUser :
      'a class
       -> LargeInt.int
       -> bool
    val toString : 'a class -> string
  end
