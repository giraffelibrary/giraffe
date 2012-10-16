structure GioProxy :>
  GIO_PROXY
    where type 'a class_t = 'a GioProxyClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a proxyaddressclass_t = 'a GioProxyAddressClass.t
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_proxy_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefaultForProtocol_ = call (load_sym libgio "g_proxy_get_default_for_protocol") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val connect_ =
        call (load_sym libgio "g_proxy_connect")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val connectFinish_ =
        call (load_sym libgio "g_proxy_connect_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val supportsHostname_ = call (load_sym libgio "g_proxy_supports_hostname") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a GioProxyClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a proxyaddressclass_t = 'a GioProxyAddressClass.t
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefaultForProtocol protocol = (FFI.String.withConstPtr ---> GioProxyClass.C.fromPtr true) getDefaultForProtocol_ protocol
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
    fun supportsHostname self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) supportsHostname_ self
  end
