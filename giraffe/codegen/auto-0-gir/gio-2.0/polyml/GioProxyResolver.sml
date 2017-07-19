structure GioProxyResolver :>
  GIO_PROXY_RESOLVER
    where type 'a class = 'a GioProxyResolverClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_proxy_resolver_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "g_proxy_resolver_get_default") (cVoid --> GioProxyResolverClass.PolyML.cPtr)
      val isSupported_ = call (getSymbol "g_proxy_resolver_is_supported") (GioProxyResolverClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val lookup_ =
        call (getSymbol "g_proxy_resolver_lookup")
          (
            GioProxyResolverClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CVector.PolyML.cOutPtr
          )
      val lookupFinish_ =
        call (getSymbol "g_proxy_resolver_lookup_finish")
          (
            GioProxyResolverClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CVector.PolyML.cOutPtr
          )
    end
    type 'a class = 'a GioProxyResolverClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioProxyResolverClass.FFI.fromPtr false) getDefault_ ()
    fun isSupported self = (GioProxyResolverClass.FFI.withPtr ---> GBool.FFI.fromVal) isSupported_ self
    fun lookup self (uri, cancellable) =
      (
        GioProxyResolverClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8CVector.FFI.fromPtr 2
      )
        lookup_
        (
          self
           & uri
           & cancellable
           & []
        )
    fun lookupFinish self result =
      (
        GioProxyResolverClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8CVector.FFI.fromPtr 2
      )
        lookupFinish_
        (
          self
           & result
           & []
        )
  end
