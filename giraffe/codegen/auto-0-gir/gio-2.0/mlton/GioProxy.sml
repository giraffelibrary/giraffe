structure GioProxy :>
  GIO_PROXY
    where type 'a class = 'a GioProxyClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a proxy_address_class = 'a GioProxyAddressClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_proxy_get_type" : unit -> GObjectType.C.val_;
    val getDefaultForProtocol_ = _import "mlton_g_proxy_get_default_for_protocol" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val connect_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_proxy_connect" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val connectFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_proxy_connect_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val supportsHostname_ = _import "g_proxy_supports_hostname" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GioProxyClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a proxy_address_class = 'a GioProxyAddressClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefaultForProtocol protocol = (Utf8.C.withPtr ---> GioProxyClass.C.fromPtr true) getDefaultForProtocol_ protocol
    fun connect self connection proxyAddress cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        connect_
        (
          self
           & connection
           & proxyAddress
           & cancellable
           & []
        )
    fun connectFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        connectFinish_
        (
          self
           & result
           & []
        )
    fun supportsHostname self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsHostname_ self
  end
