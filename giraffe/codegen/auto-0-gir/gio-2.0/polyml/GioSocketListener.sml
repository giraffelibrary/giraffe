structure GioSocketListener :>
  GIO_SOCKET_LISTENER
    where type 'a class = 'a GioSocketListenerClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type socket_protocol_t = GioSocketProtocol.t
    where type socket_type_t = GioSocketType.t
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type 'a socket_class = 'a GioSocketClass.class
    where type socket_listener_event_t = GioSocketListenerEvent.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_listener_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_socket_listener_new") (cVoid --> GioSocketListenerClass.PolyML.cPtr)
      val accept_ =
        call (getSymbol "g_socket_listener_accept")
          (
            GioSocketListenerClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val acceptFinish_ =
        call (getSymbol "g_socket_listener_accept_finish")
          (
            GioSocketListenerClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val acceptSocket_ =
        call (getSymbol "g_socket_listener_accept_socket")
          (
            GioSocketListenerClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketClass.PolyML.cPtr
          )
      val acceptSocketFinish_ =
        call (getSymbol "g_socket_listener_accept_socket_finish")
          (
            GioSocketListenerClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketClass.PolyML.cPtr
          )
      val addAddress_ =
        call (getSymbol "g_socket_listener_add_address")
          (
            GioSocketListenerClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> GioSocketType.PolyML.cVal
             &&> GioSocketProtocol.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GioSocketAddressClass.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val addAnyInetPort_ =
        call (getSymbol "g_socket_listener_add_any_inet_port")
          (
            GioSocketListenerClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt16.PolyML.cVal
          )
      val addInetPort_ =
        call (getSymbol "g_socket_listener_add_inet_port")
          (
            GioSocketListenerClass.PolyML.cPtr
             &&> GUInt16.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val addSocket_ =
        call (getSymbol "g_socket_listener_add_socket")
          (
            GioSocketListenerClass.PolyML.cPtr
             &&> GioSocketClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val close_ = call (getSymbol "g_socket_listener_close") (GioSocketListenerClass.PolyML.cPtr --> cVoid)
      val setBacklog_ = call (getSymbol "g_socket_listener_set_backlog") (GioSocketListenerClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioSocketListenerClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type socket_protocol_t = GioSocketProtocol.t
    type socket_type_t = GioSocketType.t
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type socket_listener_event_t = GioSocketListenerEvent.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioSocketListenerClass.FFI.fromPtr true) new_ ()
    fun accept self cancellable =
      let
        val sourceObject & retVal =
          (
            GioSocketListenerClass.FFI.withPtr false
             &&&> GObjectObjectClass.FFI.withRefOptPtr false
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.FFI.fromPtr false && GioSocketConnectionClass.FFI.fromPtr true
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
            GioSocketListenerClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GObjectObjectClass.FFI.withRefOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.FFI.fromPtr false && GioSocketConnectionClass.FFI.fromPtr true
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
            GioSocketListenerClass.FFI.withPtr false
             &&&> GObjectObjectClass.FFI.withRefOptPtr false
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.FFI.fromPtr false && GioSocketClass.FFI.fromPtr true
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
            GioSocketListenerClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GObjectObjectClass.FFI.withRefOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.FFI.fromPtr false && GioSocketClass.FFI.fromPtr true
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
    fun addAddress
      self
      (
        address,
        type',
        protocol,
        sourceObject
      ) =
      let
        val effectiveAddress & () =
          (
            GioSocketListenerClass.FFI.withPtr false
             &&&> GioSocketAddressClass.FFI.withPtr false
             &&&> GioSocketType.FFI.withVal
             &&&> GioSocketProtocol.FFI.withVal
             &&&> GObjectObjectClass.FFI.withOptPtr false
             &&&> GioSocketAddressClass.FFI.withRefOptPtr true
             &&&> GLibErrorRecord.handleError
             ---> GioSocketAddressClass.FFI.fromPtr true && ignore
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
        effectiveAddress
      end
    fun addAnyInetPort self sourceObject =
      (
        GioSocketListenerClass.FFI.withPtr false
         &&&> GObjectObjectClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GUInt16.FFI.fromVal
      )
        addAnyInetPort_
        (
          self
           & sourceObject
           & []
        )
    fun addInetPort self (port, sourceObject) =
      (
        GioSocketListenerClass.FFI.withPtr false
         &&&> GUInt16.FFI.withVal
         &&&> GObjectObjectClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addInetPort_
        (
          self
           & port
           & sourceObject
           & []
        )
    fun addSocket self (socket, sourceObject) =
      (
        GioSocketListenerClass.FFI.withPtr false
         &&&> GioSocketClass.FFI.withPtr false
         &&&> GObjectObjectClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addSocket_
        (
          self
           & socket
           & sourceObject
           & []
        )
    fun close self = (GioSocketListenerClass.FFI.withPtr false ---> I) close_ self
    fun setBacklog self listenBacklog = (GioSocketListenerClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setBacklog_ (self & listenBacklog)
    local
      open ClosureMarshal Signal
    in
      fun eventSig f = signal "event" (get 0w1 GioSocketListenerEvent.t &&&> get 0w2 GioSocketClass.t ---> ret_void) (fn event & socket => f (event, socket))
    end
    local
      open ValueAccessor
    in
      val listenBacklogProp =
        {
          name = "listen-backlog",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
