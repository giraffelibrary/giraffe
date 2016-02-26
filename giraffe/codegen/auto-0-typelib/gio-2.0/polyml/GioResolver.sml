structure GioResolver :>
  GIO_RESOLVER
    where type 'a class_t = 'a GioResolverClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a inet_address_class_t = 'a GioInetAddressClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_resolver_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libgio "g_resolver_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val lookupByAddress_ =
        call (load_sym libgio "g_resolver_lookup_by_address")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val lookupByAddressFinish_ =
        call (load_sym libgio "g_resolver_lookup_by_address_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val setDefault_ = call (load_sym libgio "g_resolver_set_default") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioResolverClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a inet_address_class_t = 'a GioInetAddressClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioResolverClass.C.fromPtr true) getDefault_ ()
    fun lookupByAddress self address cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> Utf8.C.fromPtr true
      )
        lookupByAddress_
        (
          self
           & address
           & cancellable
           & []
        )
    fun lookupByAddressFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> Utf8.C.fromPtr true
      )
        lookupByAddressFinish_
        (
          self
           & result
           & []
        )
    fun setDefault self = (GObjectObjectClass.C.withPtr ---> I) setDefault_ self
    local
      open ClosureMarshal Signal
    in
      fun reloadSig f = signal "reload" (void ---> ret_void) f
    end
  end
