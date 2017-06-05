signature GIO_UNIX_F_D_LIST =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromArray : LargeInt.int vector -> base class
    val append :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val get :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getLength : 'a class -> LargeInt.int
    val peekFds : 'a class -> LargeInt.int vector
    val stealFds : 'a class -> LargeInt.int vector
  end
