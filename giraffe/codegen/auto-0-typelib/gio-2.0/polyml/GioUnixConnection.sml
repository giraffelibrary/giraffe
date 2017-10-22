structure GioUnixConnection :>
  GIO_UNIX_CONNECTION
    where type 'a class = 'a GioUnixConnectionClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val receiveCredentials_ =
        call (getSymbol "g_unix_connection_receive_credentials")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioCredentialsClass.PolyML.cPtr
          )
      val receiveCredentialsFinish_ =
        call (getSymbol "g_unix_connection_receive_credentials_finish")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioCredentialsClass.PolyML.cPtr
          )
      val receiveFd_ =
        call (getSymbol "g_unix_connection_receive_fd")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt32.PolyML.cVal
          )
      val sendCredentials_ =
        call (getSymbol "g_unix_connection_send_credentials")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val sendCredentialsFinish_ =
        call (getSymbol "g_unix_connection_send_credentials_finish")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val sendFd_ =
        call (getSymbol "g_unix_connection_send_fd")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GioUnixConnectionClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun receiveCredentials self cancellable =
      (
        GioUnixConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioUnixConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
        GioUnixConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
      )
        receiveFd_
        (
          self
           & cancellable
           & []
        )
    fun sendCredentials self cancellable =
      (
        GioUnixConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioUnixConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
        GioUnixConnectionClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
