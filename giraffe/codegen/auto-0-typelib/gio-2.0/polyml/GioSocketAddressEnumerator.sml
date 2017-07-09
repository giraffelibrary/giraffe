structure GioSocketAddressEnumerator :>
  GIO_SOCKET_ADDRESS_ENUMERATOR
    where type 'a class = 'a GioSocketAddressEnumeratorClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_address_enumerator_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val next_ =
        call (getSymbol "g_socket_address_enumerator_next")
          (
            GioSocketAddressEnumeratorClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketAddressClass.PolyML.cPtr
          )
      val nextFinish_ =
        call (getSymbol "g_socket_address_enumerator_next_finish")
          (
            GioSocketAddressEnumeratorClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketAddressClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioSocketAddressEnumeratorClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun next self cancellable =
      (
        GioSocketAddressEnumeratorClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioSocketAddressEnumeratorClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
