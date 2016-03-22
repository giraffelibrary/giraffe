structure GioSocketAddressEnumerator :>
  GIO_SOCKET_ADDRESS_ENUMERATOR
    where type 'a class = 'a GioSocketAddressEnumeratorClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_socket_address_enumerator_get_type" : unit -> GObjectType.C.val_;
    val next_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_address_enumerator_next" :
              GioSocketAddressEnumeratorClass.C.notnull GioSocketAddressEnumeratorClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p;
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
              GioSocketAddressEnumeratorClass.C.notnull GioSocketAddressEnumeratorClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p;
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun next self cancellable =
      (
        GioSocketAddressEnumeratorClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketAddressClass.C.fromPtr true
      )
        next_
        (
          self
           & cancellable
           & []
        )
    fun nextFinish self result =
      (
        GioSocketAddressEnumeratorClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketAddressClass.C.fromPtr true
      )
        nextFinish_
        (
          self
           & result
           & []
        )
  end
