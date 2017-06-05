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
    val getType_ = _import "g_proxy_resolver_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "g_proxy_resolver_get_default" : unit -> GioProxyResolverClass.FFI.notnull GioProxyResolverClass.FFI.p;
    val isSupported_ = _import "g_proxy_resolver_is_supported" : GioProxyResolverClass.FFI.notnull GioProxyResolverClass.FFI.p -> GBool.FFI.val_;
    val lookup_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_proxy_resolver_lookup" :
              GioProxyResolverClass.FFI.notnull GioProxyResolverClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val lookupFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_proxy_resolver_lookup_finish" :
              GioProxyResolverClass.FFI.notnull GioProxyResolverClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioProxyResolverClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioProxyResolverClass.FFI.fromPtr false) getDefault_ ()
    fun isSupported self = (GioProxyResolverClass.FFI.withPtr ---> GBool.FFI.fromVal) isSupported_ self
    fun lookup self uri cancellable =
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
