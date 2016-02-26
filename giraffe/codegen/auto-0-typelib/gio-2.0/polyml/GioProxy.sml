structure GioProxy :>
  GIO_PROXY
    where type 'a class_t = 'a GioProxyClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a proxy_address_class_t = 'a GioProxyAddressClass.t
    where type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_proxy_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefaultForProtocol_ = call (load_sym libgio "g_proxy_get_default_for_protocol") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val connect_ =
        call (load_sym libgio "g_proxy_connect")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val connectFinish_ =
        call (load_sym libgio "g_proxy_connect_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val supportsHostname_ = call (load_sym libgio "g_proxy_supports_hostname") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a GioProxyClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a proxy_address_class_t = 'a GioProxyAddressClass.t
    type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefaultForProtocol protocol = (Utf8.C.withPtr ---> GioProxyClass.C.fromPtr true) getDefaultForProtocol_ protocol
    fun connect self connection proxyAddress cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
