structure GioSocketAddressEnumerator :>
  GIO_SOCKET_ADDRESS_ENUMERATOR
    where type 'a class_t = 'a GioSocketAddressEnumeratorClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_address_enumerator_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val next_ =
        call (load_sym libgio "g_socket_address_enumerator_next")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val nextFinish_ =
        call (load_sym libgio "g_socket_address_enumerator_next_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
    end
    type 'a class_t = 'a GioSocketAddressEnumeratorClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun next self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioSocketAddressClass.C.fromPtr true
      )
        nextFinish_
        (
          self
           & result
           & []
        )
  end
