structure GioUnixConnection :>
  GIO_UNIX_CONNECTION
    where type 'a class_t = 'a GioUnixConnectionClass.t
    where type 'a credentials_class_t = 'a GioCredentialsClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t =
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
             --> FFI.Int32.PolyML.cVal
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
             &&> FFI.Int32.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class_t = 'a GioUnixConnectionClass.t
    type 'a credentials_class_t = 'a GioCredentialsClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun receiveCredentials self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int32.C.fromVal
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.Int32.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
