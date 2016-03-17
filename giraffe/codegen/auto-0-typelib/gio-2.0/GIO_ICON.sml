signature GIO_ICON =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val newForString : string -> base class
    val equal :
      'a class
       -> 'b class
       -> bool
    val toString : 'a class -> string
  end
