structure GioSocketListener :>
  GIO_SOCKET_LISTENER
    where type 'a class = 'a GioSocketListenerClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type socket_protocol_t = GioSocketProtocol.t
    where type socket_type_t = GioSocketType.t
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type 'a socket_class = 'a GioSocketClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_listener_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_socket_listener_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val accept_ =
        call (load_sym libgio "g_socket_listener_accept")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val acceptFinish_ =
        call (load_sym libgio "g_socket_listener_accept_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val acceptSocket_ =
        call (load_sym libgio "g_socket_listener_accept_socket")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val acceptSocketFinish_ =
        call (load_sym libgio "g_socket_listener_accept_socket_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val addAddress_ =
        call (load_sym libgio "g_socket_listener_add_address")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GioSocketType.PolyML.cVal
             &&> GioSocketProtocol.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val addAnyInetPort_ =
        call (load_sym libgio "g_socket_listener_add_any_inet_port")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt16.PolyML.cVal
          )
      val addInetPort_ =
        call (load_sym libgio "g_socket_listener_add_inet_port")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val addSocket_ =
        call (load_sym libgio "g_socket_listener_add_socket")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val close_ = call (load_sym libgio "g_socket_listener_close") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setBacklog_ = call (load_sym libgio "g_socket_listener_set_backlog") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioSocketListenerClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type socket_protocol_t = GioSocketProtocol.t
    type socket_type_t = GioSocketType.t
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSocketListenerClass.C.fromPtr true) new_ ()
    fun accept self cancellable =
      let
        val sourceObject & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.C.fromPtr false && GioSocketConnectionClass.C.fromPtr true
          )
            accept_
            (
              self
               & NONE
               & cancellable
               & []
            )
      in
        (retVal, sourceObject)
      end
    fun acceptFinish self result =
      let
        val sourceObject & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.C.fromPtr false && GioSocketConnectionClass.C.fromPtr true
          )
            acceptFinish_
            (
              self
               & result
               & NONE
               & []
            )
      in
        (retVal, sourceObject)
      end
    fun acceptSocket self cancellable =
      let
        val sourceObject & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.C.fromPtr false && GioSocketClass.C.fromPtr true
          )
            acceptSocket_
            (
              self
               & NONE
               & cancellable
               & []
            )
      in
        (retVal, sourceObject)
      end
    fun acceptSocketFinish self result =
      let
        val sourceObject & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.C.fromPtr false && GioSocketClass.C.fromPtr true
          )
            acceptSocketFinish_
            (
              self
               & result
               & NONE
               & []
            )
      in
        (retVal, sourceObject)
      end
    fun addAddress self address type' protocol sourceObject =
      let
        val effectiveAddress & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GioSocketType.C.withVal
             &&&> GioSocketProtocol.C.withVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GioSocketAddressClass.C.fromPtr true && FFI.Bool.C.fromVal
          )
            addAddress_
            (
              self
               & address
               & type'
               & protocol
               & sourceObject
               & NONE
               & []
            )
      in
        if retVal then SOME effectiveAddress else NONE
      end
    fun addAnyInetPort self sourceObject =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt16.C.fromVal
      )
        addAnyInetPort_
        (
          self
           & sourceObject
           & []
        )
    fun addInetPort self port sourceObject =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        addInetPort_
        (
          self
           & port
           & sourceObject
           & []
        )
    fun addSocket self socket sourceObject =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        addSocket_
        (
          self
           & socket
           & sourceObject
           & []
        )
    fun close self = (GObjectObjectClass.C.withPtr ---> I) close_ self
    fun setBacklog self listenBacklog = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setBacklog_ (self & listenBacklog)
    local
      open Property
    in
      val listenBacklogProp =
        {
          get = fn x => get "listen-backlog" int x,
          set = fn x => set "listen-backlog" int x
        }
    end
  end
