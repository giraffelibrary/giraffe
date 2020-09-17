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
    val getType_ = _import "g_socket_listener_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_socket_listener_new" : unit -> GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p;
    val accept_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_listener_accept" :
              GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p
               * (GObjectObjectClass.FFI.opt, GObjectObjectClass.FFI.non_opt) GObjectObjectClass.FFI.r
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GObjectObjectClass.FFI.opt, GObjectObjectClass.FFI.non_opt) GObjectObjectClass.FFI.r
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p
               * (GObjectObjectClass.FFI.opt, GObjectObjectClass.FFI.non_opt) GObjectObjectClass.FFI.r
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketClass.FFI.non_opt GioSocketClass.FFI.p;
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
              GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GObjectObjectClass.FFI.opt, GObjectObjectClass.FFI.non_opt) GObjectObjectClass.FFI.r
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketClass.FFI.non_opt GioSocketClass.FFI.p;
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
              GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p
               * GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p
               * GioSocketType.FFI.val_
               * GioSocketProtocol.FFI.val_
               * GObjectObjectClass.FFI.opt GObjectObjectClass.FFI.p
               * (GioSocketAddressClass.FFI.opt, GioSocketAddressClass.FFI.non_opt) GioSocketAddressClass.FFI.r
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p
               * GObjectObjectClass.FFI.opt GObjectObjectClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p
               * GUInt16.FFI.val_
               * GObjectObjectClass.FFI.opt GObjectObjectClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p
               * GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GObjectObjectClass.FFI.opt GObjectObjectClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val close_ = _import "g_socket_listener_close" : GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p -> unit;
    val setBacklog_ = fn x1 & x2 => (_import "g_socket_listener_set_backlog" : GioSocketListenerClass.FFI.non_opt GioSocketListenerClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
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
        (retVal, sourceObject) before GioSocketListenerClass.FFI.touchPtr self before GioCancellableClass.FFI.touchOptPtr cancellable
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
        (retVal, sourceObject) before GioSocketListenerClass.FFI.touchPtr self before GioAsyncResultClass.FFI.touchPtr result
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
        (retVal, sourceObject) before GioSocketListenerClass.FFI.touchPtr self before GioCancellableClass.FFI.touchOptPtr cancellable
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
        (retVal, sourceObject) before GioSocketListenerClass.FFI.touchPtr self before GioAsyncResultClass.FFI.touchPtr result
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
