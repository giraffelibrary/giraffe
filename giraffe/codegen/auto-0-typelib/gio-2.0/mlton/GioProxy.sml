structure GioProxy :>
  GIO_PROXY
    where type 'a class = 'a GioProxyClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a proxy_address_class = 'a GioProxyAddressClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_proxy_get_type" : unit -> GObjectType.FFI.val_;
    val getDefaultForProtocol_ = _import "mlton_g_proxy_get_default_for_protocol" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioProxyClass.FFI.non_opt GioProxyClass.FFI.p;
    val connect_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_proxy_connect" :
              GioProxyClass.FFI.non_opt GioProxyClass.FFI.p
               * GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p
               * GioProxyAddressClass.FFI.non_opt GioProxyAddressClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p;
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
              GioProxyClass.FFI.non_opt GioProxyClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val supportsHostname_ = _import "g_proxy_supports_hostname" : GioProxyClass.FFI.non_opt GioProxyClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioProxyClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a proxy_address_class = 'a GioProxyAddressClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefaultForProtocol protocol = (Utf8.FFI.withPtr ---> GioProxyClass.FFI.fromPtr true) getDefaultForProtocol_ protocol
    fun connect
      self
      (
        connection,
        proxyAddress,
        cancellable
      ) =
      (
        GioProxyClass.FFI.withPtr
         &&&> GioIOStreamClass.FFI.withPtr
         &&&> GioProxyAddressClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.FFI.fromPtr true
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
        GioProxyClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.FFI.fromPtr true
      )
        connectFinish_
        (
          self
           & result
           & []
        )
    fun supportsHostname self = (GioProxyClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsHostname_ self
  end
