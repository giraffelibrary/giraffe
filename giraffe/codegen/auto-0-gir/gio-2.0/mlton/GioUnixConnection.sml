structure GioUnixConnection :>
  GIO_UNIX_CONNECTION
    where type 'a class = 'a GioUnixConnectionClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_unix_connection_get_type" : unit -> GObjectType.C.val_;
    val receiveCredentials_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_connection_receive_credentials" :
              GioUnixConnectionClass.C.notnull GioUnixConnectionClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioCredentialsClass.C.notnull GioCredentialsClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val receiveFd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_connection_receive_fd" :
              GioUnixConnectionClass.C.notnull GioUnixConnectionClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val sendCredentials_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_connection_send_credentials" :
              GioUnixConnectionClass.C.notnull GioUnixConnectionClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val sendFd_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_unix_connection_send_fd" :
              GioUnixConnectionClass.C.notnull GioUnixConnectionClass.C.p
               * FFI.Int.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GioUnixConnectionClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun receiveCredentials self cancellable =
      (
        GioUnixConnectionClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioCredentialsClass.C.fromPtr true
      )
        receiveCredentials_
        (
          self
           & cancellable
           & []
        )
    fun receiveFd self cancellable =
      (
        GioUnixConnectionClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int.C.fromVal
      )
        receiveFd_
        (
          self
           & cancellable
           & []
        )
    fun sendCredentials self cancellable =
      (
        GioUnixConnectionClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        sendCredentials_
        (
          self
           & cancellable
           & []
        )
    fun sendFd self fd cancellable =
      (
        GioUnixConnectionClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        sendFd_
        (
          self
           & fd
           & cancellable
           & []
        )
  end
