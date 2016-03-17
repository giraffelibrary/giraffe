structure GioResolver :>
  GIO_RESOLVER
    where type 'a class = 'a GioResolverClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_resolver_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "g_resolver_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val lookupByAddress_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_resolver_lookup_by_address" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefault_ = _import "g_resolver_set_default" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class = 'a GioResolverClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioResolverClass.C.fromPtr true) getDefault_ ()
    fun lookupByAddress self address cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
         &&&> GLibErrorRecord.handleError
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
