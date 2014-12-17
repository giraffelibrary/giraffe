signature GIO_UNIX_F_D_LIST =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val append :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val get :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getLength : 'a class_t -> LargeInt.int
  end
