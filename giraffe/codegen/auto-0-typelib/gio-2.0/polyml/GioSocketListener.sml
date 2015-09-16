structure GioSocketListener :>
  GIO_SOCKET_LISTENER
    where type 'a class_t = 'a GioSocketListenerClass.t
    where type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t
    where type socket_protocol_t = GioSocketProtocol.t
    where type socket_type_t = GioSocketType.t
    where type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    where type 'a socket_class_t = 'a GioSocketClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_listener_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_socket_listener_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val accept_ =
        call (load_sym libgio "g_socket_listener_accept")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val acceptFinish_ =
        call (load_sym libgio "g_socket_listener_accept_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val acceptSocket_ =
        call (load_sym libgio "g_socket_listener_accept_socket")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val acceptSocketFinish_ =
        call (load_sym libgio "g_socket_listener_accept_socket_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val addAddress_ =
        call (load_sym libgio "g_socket_listener_add_address")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GioSocketType.PolyML.VAL
             &&> GioSocketProtocol.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val addAnyInetPort_ =
        call (load_sym libgio "g_socket_listener_add_any_inet_port")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.UInt16.PolyML.VAL
          )
      val addInetPort_ =
        call (load_sym libgio "g_socket_listener_add_inet_port")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt16.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val addSocket_ =
        call (load_sym libgio "g_socket_listener_add_socket")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val close_ = call (load_sym libgio "g_socket_listener_close") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setBacklog_ = call (load_sym libgio "g_socket_listener_set_backlog") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioSocketListenerClass.t
    type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type socket_protocol_t = GioSocketProtocol.t
    type socket_type_t = GioSocketType.t
    type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    type 'a socket_class_t = 'a GioSocketClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSocketListenerClass.C.fromPtr true) new_ ()
    fun accept self cancellable =
      let
        val sourceObject & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
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
             &&&> GLibErrorRecord.C.handleError
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
             &&&> GLibErrorRecord.C.handleError
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
             &&&> GLibErrorRecord.C.handleError
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
             &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
