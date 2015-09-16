signature GIO_UNIX_CONNECTION =
  sig
    type 'a class_t
    type 'a credentials_class_t
    type 'a cancellable_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val receiveCredentials :
      'a class_t
       -> 'b cancellable_class_t option
       -> base credentials_class_t
    val receiveFd :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val sendCredentials :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val sendFd :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> bool
  end
