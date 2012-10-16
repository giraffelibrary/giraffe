signature GIO_CREDENTIALS =
  sig
    type 'a class_t
    type credentialstype_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getUnixUser : 'a class_t -> LargeInt.int
    val isSameUser :
      'a class_t
       -> 'b class_t
       -> bool
    val setNative :
      'a class_t
       -> credentialstype_t
       -> unit
    val setUnixUser :
      'a class_t
       -> LargeInt.int
       -> bool
    val toString : 'a class_t -> string
  end
