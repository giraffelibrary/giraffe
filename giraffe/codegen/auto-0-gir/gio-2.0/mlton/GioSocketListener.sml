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
    val getType_ = _import "g_socket_listener_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_socket_listener_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val accept_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_listener_accept" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioSocketType.C.val_
               * GioSocketProtocol.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt16.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt16.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val close_ = _import "g_socket_listener_close" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setBacklog_ = fn x1 & x2 => (_import "g_socket_listener_set_backlog" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
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
    fun setBacklog self listenBacklog = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setBacklog_ (self & listenBacklog)
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
