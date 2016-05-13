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
      val getType_ = call (load_sym libgio "g_proxy_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getDefaultForProtocol_ = call (load_sym libgio "g_proxy_get_default_for_protocol") (Utf8.PolyML.cInPtr --> GioProxyClass.PolyML.cPtr)
      val connect_ =
        call (load_sym libgio "g_proxy_connect")
          (
            GioProxyClass.PolyML.cPtr
             &&> GioIOStreamClass.PolyML.cPtr
             &&> GioProxyAddressClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val connectFinish_ =
        call (load_sym libgio "g_proxy_connect_finish")
          (
            GioProxyClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val supportsHostname_ = call (load_sym libgio "g_proxy_supports_hostname") (GioProxyClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
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
        GioProxyClass.C.withPtr
         &&&> GioIOStreamClass.C.withPtr
         &&&> GioProxyAddressClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioProxyClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        connectFinish_
        (
          self
           & result
           & []
        )
    fun supportsHostname self = (GioProxyClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsHostname_ self
  end
