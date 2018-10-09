signature GIO_UNIX_CONNECTION =
  sig
    type 'a class
    type 'a credentials_class
    type 'a async_result_class
    type 'a cancellable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val receiveCredentials :
      'a class
       -> 'b cancellable_class option
       -> base credentials_class
    val receiveCredentialsFinish :
      'a class
       -> 'b async_result_class
       -> base credentials_class
    val receiveFd :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val sendCredentials :
      'a class
       -> 'b cancellable_class option
       -> unit
    val sendCredentialsFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val sendFd :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> unit
  end
