structure GioUnixConnection :>
  GIO_UNIX_CONNECTION
    where type 'a class = 'a GioUnixConnectionClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val receiveCredentials_ =
        call (load_sym libgio "g_unix_connection_receive_credentials")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val receiveFd_ =
        call (load_sym libgio "g_unix_connection_receive_fd")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int.PolyML.cVal
          )
      val sendCredentials_ =
        call (load_sym libgio "g_unix_connection_send_credentials")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val sendFd_ =
        call (load_sym libgio "g_unix_connection_send_fd")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a GioUnixConnectionClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun receiveCredentials self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
