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
      val getType_ = call (load_sym libgio "g_socket_address_enumerator_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val next_ =
        call (load_sym libgio "g_socket_address_enumerator_next")
          (
            GioSocketAddressEnumeratorClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketAddressClass.PolyML.cPtr
          )
      val nextFinish_ =
        call (load_sym libgio "g_socket_address_enumerator_next_finish")
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
