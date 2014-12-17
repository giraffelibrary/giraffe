signature GIO_UNIX_CONNECTION =
  sig
    type 'a class_t
    type 'a credentialsclass_t
    type 'a cancellableclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val receiveCredentials :
      'a class_t
       -> 'b cancellableclass_t option
       -> base credentialsclass_t
    val receiveFd :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val sendCredentials :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val sendFd :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
  end
