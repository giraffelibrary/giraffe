structure GioResolver :>
  GIO_RESOLVER
    where type 'a class = 'a GioResolverClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_resolver_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "g_resolver_get_default" : unit -> GioResolverClass.FFI.notnull GioResolverClass.FFI.p;
    val lookupByAddress_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_resolver_lookup_by_address" :
              GioResolverClass.FFI.notnull GioResolverClass.FFI.p
               * GioInetAddressClass.FFI.notnull GioInetAddressClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val lookupByAddressFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_resolver_lookup_by_address_finish" :
              GioResolverClass.FFI.notnull GioResolverClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefault_ = _import "g_resolver_set_default" : GioResolverClass.FFI.notnull GioResolverClass.FFI.p -> unit;
    type 'a class = 'a GioResolverClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioResolverClass.FFI.fromPtr true) getDefault_ ()
    fun lookupByAddress self (address, cancellable) =
      (
        GioResolverClass.FFI.withPtr
         &&&> GioInetAddressClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
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
        GioResolverClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        lookupByAddressFinish_
        (
          self
           & result
           & []
        )
    fun setDefault self = (GioResolverClass.FFI.withPtr ---> I) setDefault_ self
    local
      open ClosureMarshal Signal
    in
      fun reloadSig f = signal "reload" (void ---> ret_void) f
    end
  end
