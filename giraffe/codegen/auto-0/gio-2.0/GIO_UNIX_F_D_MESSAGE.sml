signature GIO_UNIX_F_D_MESSAGE =
  sig
    type 'a class_t
    type 'a unixfdlistclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithFdList : 'a unixfdlistclass_t -> base class_t
    val appendFd :
      'a class_t
       -> LargeInt.int
       -> bool
    val getFdList : 'a class_t -> base unixfdlistclass_t
    val fdListProp : ('a class_t, base unixfdlistclass_t option, 'b unixfdlistclass_t option) Property.readwrite
  end
