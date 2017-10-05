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
    val getType_ = _import "g_socket_listener_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_socket_listener_new" : unit -> GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p;
    val accept_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_listener_accept" :
              GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p
               * (unit, GObjectObjectClass.FFI.notnull) GObjectObjectClass.FFI.r
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val acceptFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_listener_accept_finish" :
              GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, GObjectObjectClass.FFI.notnull) GObjectObjectClass.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val acceptSocket_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_listener_accept_socket" :
              GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p
               * (unit, GObjectObjectClass.FFI.notnull) GObjectObjectClass.FFI.r
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketClass.FFI.notnull GioSocketClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val acceptSocketFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_listener_accept_socket_finish" :
              GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, GObjectObjectClass.FFI.notnull) GObjectObjectClass.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketClass.FFI.notnull GioSocketClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addAddress_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "g_socket_listener_add_address" :
              GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p
               * GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p
               * GioSocketType.FFI.val_
               * GioSocketProtocol.FFI.val_
               * unit GObjectObjectClass.FFI.p
               * (unit, GioSocketAddressClass.FFI.notnull) GioSocketAddressClass.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val addAnyInetPort_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_listener_add_any_inet_port" :
              GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p
               * unit GObjectObjectClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt16.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val addInetPort_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_listener_add_inet_port" :
              GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p
               * GUInt16.FFI.val_
               * unit GObjectObjectClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addSocket_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_listener_add_socket" :
              GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p
               * GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * unit GObjectObjectClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val close_ = _import "g_socket_listener_close" : GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p -> unit;
    val setBacklog_ = fn x1 & x2 => (_import "g_socket_listener_set_backlog" : GioSocketListenerClass.FFI.notnull GioSocketListenerClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioSocketListenerClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type socket_protocol_t = GioSocketProtocol.t
    type socket_type_t = GioSocketType.t
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioSocketListenerClass.FFI.fromPtr true) new_ ()
    fun accept self cancellable =
      let
        val sourceObject & retVal =
          (
            GioSocketListenerClass.FFI.withPtr
             &&&> GObjectObjectClass.FFI.withRefOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
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
            GioSocketListenerClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GObjectObjectClass.FFI.withRefOptPtr
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
            GioSocketListenerClass.FFI.withPtr
             &&&> GObjectObjectClass.FFI.withRefOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
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
            GioSocketListenerClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GObjectObjectClass.FFI.withRefOptPtr
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
            GioSocketListenerClass.FFI.withPtr
             &&&> GioSocketAddressClass.FFI.withPtr
             &&&> GioSocketType.FFI.withVal
             &&&> GioSocketProtocol.FFI.withVal
             &&&> GObjectObjectClass.FFI.withOptPtr
             &&&> GioSocketAddressClass.FFI.withRefOptPtr
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
        GioSocketListenerClass.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withOptPtr
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
        GioSocketListenerClass.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> GObjectObjectClass.FFI.withOptPtr
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
        GioSocketListenerClass.FFI.withPtr
         &&&> GioSocketClass.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withOptPtr
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
    fun close self = (GioSocketListenerClass.FFI.withPtr ---> I) close_ self
    fun setBacklog self listenBacklog = (GioSocketListenerClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setBacklog_ (self & listenBacklog)
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
