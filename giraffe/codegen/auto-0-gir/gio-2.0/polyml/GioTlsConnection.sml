structure GioTlsConnection :>
  GIO_TLS_CONNECTION
    where type 'a class = 'a GioTlsConnectionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    where type 'a tls_interaction_class = 'a GioTlsInteractionClass.class
    where type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type tls_rehandshake_mode_t = GioTlsRehandshakeMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val emitAcceptCertificate_ =
        call (getSymbol "g_tls_connection_emit_accept_certificate")
          (
            GioTlsConnectionClass.PolyML.cPtr
             &&> GioTlsCertificateClass.PolyML.cPtr
             &&> GioTlsCertificateFlags.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val getCertificate_ = call (getSymbol "g_tls_connection_get_certificate") (GioTlsConnectionClass.PolyML.cPtr --> GioTlsCertificateClass.PolyML.cPtr)
      val getDatabase_ = call (getSymbol "g_tls_connection_get_database") (GioTlsConnectionClass.PolyML.cPtr --> GioTlsDatabaseClass.PolyML.cPtr)
      val getInteraction_ = call (getSymbol "g_tls_connection_get_interaction") (GioTlsConnectionClass.PolyML.cPtr --> GioTlsInteractionClass.PolyML.cPtr)
      val getPeerCertificate_ = call (getSymbol "g_tls_connection_get_peer_certificate") (GioTlsConnectionClass.PolyML.cPtr --> GioTlsCertificateClass.PolyML.cPtr)
      val getPeerCertificateErrors_ = call (getSymbol "g_tls_connection_get_peer_certificate_errors") (GioTlsConnectionClass.PolyML.cPtr --> GioTlsCertificateFlags.PolyML.cVal)
      val getRehandshakeMode_ = call (getSymbol "g_tls_connection_get_rehandshake_mode") (GioTlsConnectionClass.PolyML.cPtr --> GioTlsRehandshakeMode.PolyML.cVal)
      val getRequireCloseNotify_ = call (getSymbol "g_tls_connection_get_require_close_notify") (GioTlsConnectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val handshake_ =
        call (getSymbol "g_tls_connection_handshake")
          (
            GioTlsConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val handshakeFinish_ =
        call (getSymbol "g_tls_connection_handshake_finish")
          (
            GioTlsConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setCertificate_ = call (getSymbol "g_tls_connection_set_certificate") (GioTlsConnectionClass.PolyML.cPtr &&> GioTlsCertificateClass.PolyML.cPtr --> cVoid)
      val setDatabase_ = call (getSymbol "g_tls_connection_set_database") (GioTlsConnectionClass.PolyML.cPtr &&> GioTlsDatabaseClass.PolyML.cPtr --> cVoid)
      val setInteraction_ = call (getSymbol "g_tls_connection_set_interaction") (GioTlsConnectionClass.PolyML.cPtr &&> GioTlsInteractionClass.PolyML.cOptPtr --> cVoid)
      val setRehandshakeMode_ = call (getSymbol "g_tls_connection_set_rehandshake_mode") (GioTlsConnectionClass.PolyML.cPtr &&> GioTlsRehandshakeMode.PolyML.cVal --> cVoid)
      val setRequireCloseNotify_ = call (getSymbol "g_tls_connection_set_require_close_notify") (GioTlsConnectionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioTlsConnectionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    type 'a tls_interaction_class = 'a GioTlsInteractionClass.class
    type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type tls_rehandshake_mode_t = GioTlsRehandshakeMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun emitAcceptCertificate self (peerCert, errors) =
      (
        GioTlsConnectionClass.FFI.withPtr
         &&&> GioTlsCertificateClass.FFI.withPtr
         &&&> GioTlsCertificateFlags.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        emitAcceptCertificate_
        (
          self
           & peerCert
           & errors
        )
    fun getCertificate self = (GioTlsConnectionClass.FFI.withPtr ---> GioTlsCertificateClass.FFI.fromPtr false) getCertificate_ self
    fun getDatabase self = (GioTlsConnectionClass.FFI.withPtr ---> GioTlsDatabaseClass.FFI.fromPtr false) getDatabase_ self
    fun getInteraction self = (GioTlsConnectionClass.FFI.withPtr ---> GioTlsInteractionClass.FFI.fromPtr false) getInteraction_ self
    fun getPeerCertificate self = (GioTlsConnectionClass.FFI.withPtr ---> GioTlsCertificateClass.FFI.fromPtr false) getPeerCertificate_ self
    fun getPeerCertificateErrors self = (GioTlsConnectionClass.FFI.withPtr ---> GioTlsCertificateFlags.FFI.fromVal) getPeerCertificateErrors_ self
    fun getRehandshakeMode self = (GioTlsConnectionClass.FFI.withPtr ---> GioTlsRehandshakeMode.FFI.fromVal) getRehandshakeMode_ self
    fun getRequireCloseNotify self = (GioTlsConnectionClass.FFI.withPtr ---> GBool.FFI.fromVal) getRequireCloseNotify_ self
    fun handshake self cancellable =
      (
        GioTlsConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        handshake_
        (
          self
           & cancellable
           & []
        )
    fun handshakeFinish self result =
      (
        GioTlsConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        handshakeFinish_
        (
          self
           & result
           & []
        )
    fun setCertificate self certificate = (GioTlsConnectionClass.FFI.withPtr &&&> GioTlsCertificateClass.FFI.withPtr ---> I) setCertificate_ (self & certificate)
    fun setDatabase self database = (GioTlsConnectionClass.FFI.withPtr &&&> GioTlsDatabaseClass.FFI.withPtr ---> I) setDatabase_ (self & database)
    fun setInteraction self interaction = (GioTlsConnectionClass.FFI.withPtr &&&> GioTlsInteractionClass.FFI.withOptPtr ---> I) setInteraction_ (self & interaction)
    fun setRehandshakeMode self mode = (GioTlsConnectionClass.FFI.withPtr &&&> GioTlsRehandshakeMode.FFI.withVal ---> I) setRehandshakeMode_ (self & mode)
    fun setRequireCloseNotify self requireCloseNotify = (GioTlsConnectionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRequireCloseNotify_ (self & requireCloseNotify)
    local
      open ClosureMarshal Signal
    in
      fun acceptCertificateSig f = signal "accept-certificate" (get 0w1 GioTlsCertificateClass.t &&&> get 0w2 GioTlsCertificateFlags.t ---> ret boolean) (fn peerCert & errors => f (peerCert, errors))
    end
    local
      open Property
    in
      val baseIoStreamProp =
        {
          get = fn x => get "base-io-stream" GioIOStreamClass.tOpt x,
          set = fn x => set "base-io-stream" GioIOStreamClass.tOpt x
        }
      val certificateProp =
        {
          get = fn x => get "certificate" GioTlsCertificateClass.tOpt x,
          set = fn x => set "certificate" GioTlsCertificateClass.tOpt x
        }
      val databaseProp =
        {
          get = fn x => get "database" GioTlsDatabaseClass.tOpt x,
          set = fn x => set "database" GioTlsDatabaseClass.tOpt x
        }
      val interactionProp =
        {
          get = fn x => get "interaction" GioTlsInteractionClass.tOpt x,
          set = fn x => set "interaction" GioTlsInteractionClass.tOpt x
        }
      val peerCertificateProp = {get = fn x => get "peer-certificate" GioTlsCertificateClass.tOpt x}
      val peerCertificateErrorsProp = {get = fn x => get "peer-certificate-errors" GioTlsCertificateFlags.t x}
      val rehandshakeModeProp =
        {
          get = fn x => get "rehandshake-mode" GioTlsRehandshakeMode.t x,
          set = fn x => set "rehandshake-mode" GioTlsRehandshakeMode.t x
        }
      val requireCloseNotifyProp =
        {
          get = fn x => get "require-close-notify" boolean x,
          set = fn x => set "require-close-notify" boolean x
        }
    end
  end
