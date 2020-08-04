structure GioSocketAddressEnumerator :>
  GIO_SOCKET_ADDRESS_ENUMERATOR
    where type 'a class = 'a GioSocketAddressEnumeratorClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_socket_address_enumerator_get_type" : unit -> GObjectType.FFI.val_;
    val next_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_address_enumerator_next" :
              GioSocketAddressEnumeratorClass.FFI.non_opt GioSocketAddressEnumeratorClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val nextFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_address_enumerator_next_finish" :
              GioSocketAddressEnumeratorClass.FFI.non_opt GioSocketAddressEnumeratorClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioSocketAddressEnumeratorClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun next self cancellable =
      (
        GioSocketAddressEnumeratorClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioSocketAddressClass.FFI.fromPtr true
      )
        next_
        (
          self
           & cancellable
           & []
        )
    fun nextFinish self result =
      (
        GioSocketAddressEnumeratorClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioSocketAddressClass.FFI.fromPtr true
      )
        nextFinish_
        (
          self
           & result
           & []
        )
  end
