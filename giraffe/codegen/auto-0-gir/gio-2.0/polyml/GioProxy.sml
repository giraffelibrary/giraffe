structure GioProxy :>
  GIO_PROXY
    where type 'a class = 'a GioProxyClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a proxy_address_class = 'a GioProxyAddressClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_proxy_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefaultForProtocol_ = call (getSymbol "g_proxy_get_default_for_protocol") (Utf8.PolyML.cInPtr --> GioProxyClass.PolyML.cPtr)
      val connect_ =
        call (getSymbol "g_proxy_connect")
          (
            GioProxyClass.PolyML.cPtr
             &&> GioIOStreamClass.PolyML.cPtr
             &&> GioProxyAddressClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val connectFinish_ =
        call (getSymbol "g_proxy_connect_finish")
          (
            GioProxyClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val supportsHostname_ = call (getSymbol "g_proxy_supports_hostname") (GioProxyClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
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
