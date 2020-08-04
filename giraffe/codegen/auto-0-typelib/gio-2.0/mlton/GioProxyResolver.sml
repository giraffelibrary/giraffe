structure GioProxyResolver :>
  GIO_PROXY_RESOLVER
    where type 'a class = 'a GioProxyResolverClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_proxy_resolver_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "g_proxy_resolver_get_default" : unit -> GioProxyResolverClass.FFI.non_opt GioProxyResolverClass.FFI.p;
    val isSupported_ = _import "g_proxy_resolver_is_supported" : GioProxyResolverClass.FFI.non_opt GioProxyResolverClass.FFI.p -> GBool.FFI.val_;
    val lookup_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_proxy_resolver_lookup" :
              GioProxyResolverClass.FFI.non_opt GioProxyResolverClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
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
              GioProxyResolverClass.FFI.non_opt GioProxyResolverClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
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
    fun isSupported self = (GioProxyResolverClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSupported_ self
    fun lookup self (uri, cancellable) =
      (
        GioProxyResolverClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> Utf8CPtrArray.FFI.fromPtr ~1
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
        GioProxyResolverClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> Utf8CPtrArray.FFI.fromPtr ~1
      )
        lookupFinish_
        (
          self
           & result
           & []
        )
  end
