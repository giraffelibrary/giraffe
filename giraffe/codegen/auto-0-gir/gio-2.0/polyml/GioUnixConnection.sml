structure GioUnixConnection :>
  GIO_UNIX_CONNECTION
    where type 'a class = 'a GioUnixConnectionClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
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
      val receiveFd_ =
        call (getSymbol "g_unix_connection_receive_fd")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt.PolyML.cVal
          )
      val sendCredentials_ =
        call (getSymbol "g_unix_connection_send_credentials")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val sendFd_ =
        call (getSymbol "g_unix_connection_send_fd")
          (
            GioUnixConnectionClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GioUnixConnectionClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
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
    fun receiveFd self cancellable =
      (
        GioUnixConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioUnixConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        sendCredentials_
        (
          self
           & cancellable
           & []
        )
    fun sendFd self fd cancellable =
      (
        GioUnixConnectionClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        sendFd_
        (
          self
           & fd
           & cancellable
           & []
        )
  end
