signature GIO_ICON =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val hash : unit -> LargeInt.int
    val newForString : string -> base class_t
    val equal :
      'a class_t
       -> 'b class_t
       -> bool
    val toString : 'a class_t -> string
  end
