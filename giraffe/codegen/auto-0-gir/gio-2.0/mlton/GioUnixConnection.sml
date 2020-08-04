structure GioUnixConnection :>
  GIO_UNIX_CONNECTION
    where type 'a class = 'a GioUnixConnectionClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_unix_connection_get_type" : unit -> GObjectType.FFI.val_;
    val receiveCredentials_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_connection_receive_credentials" :
              GioUnixConnectionClass.FFI.non_opt GioUnixConnectionClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val receiveCredentialsFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_connection_receive_credentials_finish" :
              GioUnixConnectionClass.FFI.non_opt GioUnixConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p;
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
              GioUnixConnectionClass.FFI.non_opt GioUnixConnectionClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt.FFI.val_;
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
              GioUnixConnectionClass.FFI.non_opt GioUnixConnectionClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val sendCredentialsFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_connection_send_credentials_finish" :
              GioUnixConnectionClass.FFI.non_opt GioUnixConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioUnixConnectionClass.FFI.non_opt GioUnixConnectionClass.FFI.p
               * GInt.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GioUnixConnectionClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun receiveCredentials self cancellable =
      (
        GioUnixConnectionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioCredentialsClass.FFI.fromPtr true
      )
        receiveCredentials_
        (
          self
           & cancellable
           & []
        )
    fun receiveCredentialsFinish self result =
      (
        GioUnixConnectionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioCredentialsClass.FFI.fromPtr true
      )
        receiveCredentialsFinish_
        (
          self
           & result
           & []
        )
    fun receiveFd self cancellable =
      (
        GioUnixConnectionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
      )
        receiveFd_
        (
          self
           & cancellable
           & []
        )
    fun sendCredentials self cancellable =
      (
        GioUnixConnectionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        sendCredentials_
        (
          self
           & cancellable
           & []
        )
    fun sendCredentialsFinish self result =
      (
        GioUnixConnectionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        sendCredentialsFinish_
        (
          self
           & result
           & []
        )
    fun sendFd self (fd, cancellable) =
      (
        GioUnixConnectionClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        sendFd_
        (
          self
           & fd
           & cancellable
           & []
        )
  end
