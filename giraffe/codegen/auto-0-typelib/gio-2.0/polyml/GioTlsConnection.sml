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
      val getType_ = call (load_sym libgio "g_tls_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val emitAcceptCertificate_ =
        call (load_sym libgio "g_tls_connection_emit_accept_certificate")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GioTlsCertificateFlags.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val getCertificate_ = call (load_sym libgio "g_tls_connection_get_certificate") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDatabase_ = call (load_sym libgio "g_tls_connection_get_database") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getInteraction_ = call (load_sym libgio "g_tls_connection_get_interaction") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPeerCertificate_ = call (load_sym libgio "g_tls_connection_get_peer_certificate") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPeerCertificateErrors_ = call (load_sym libgio "g_tls_connection_get_peer_certificate_errors") (GObjectObjectClass.PolyML.cPtr --> GioTlsCertificateFlags.PolyML.cVal)
      val getRehandshakeMode_ = call (load_sym libgio "g_tls_connection_get_rehandshake_mode") (GObjectObjectClass.PolyML.cPtr --> GioTlsRehandshakeMode.PolyML.cVal)
      val getRequireCloseNotify_ = call (load_sym libgio "g_tls_connection_get_require_close_notify") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val handshake_ =
        call (load_sym libgio "g_tls_connection_handshake")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val handshakeFinish_ =
        call (load_sym libgio "g_tls_connection_handshake_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setCertificate_ = call (load_sym libgio "g_tls_connection_set_certificate") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setDatabase_ = call (load_sym libgio "g_tls_connection_set_database") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setInteraction_ = call (load_sym libgio "g_tls_connection_set_interaction") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setRehandshakeMode_ = call (load_sym libgio "g_tls_connection_set_rehandshake_mode") (GObjectObjectClass.PolyML.cPtr &&> GioTlsRehandshakeMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRequireCloseNotify_ = call (load_sym libgio "g_tls_connection_set_require_close_notify") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun emitAcceptCertificate self peerCert errors =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GioTlsCertificateFlags.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        emitAcceptCertificate_
        (
          self
           & peerCert
           & errors
        )
    fun getCertificate self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateClass.C.fromPtr false) getCertificate_ self
    fun getDatabase self = (GObjectObjectClass.C.withPtr ---> GioTlsDatabaseClass.C.fromPtr false) getDatabase_ self
    fun getInteraction self = (GObjectObjectClass.C.withPtr ---> GioTlsInteractionClass.C.fromPtr false) getInteraction_ self
    fun getPeerCertificate self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateClass.C.fromPtr false) getPeerCertificate_ self
    fun getPeerCertificateErrors self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateFlags.C.fromVal) getPeerCertificateErrors_ self
    fun getRehandshakeMode self = (GObjectObjectClass.C.withPtr ---> GioTlsRehandshakeMode.C.fromVal) getRehandshakeMode_ self
    fun getRequireCloseNotify self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRequireCloseNotify_ self
    fun handshake self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        handshake_
        (
          self
           & cancellable
           & []
        )
    fun handshakeFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        handshakeFinish_
        (
          self
           & result
           & []
        )
    fun setCertificate self certificate = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setCertificate_ (self & certificate)
    fun setDatabase self database = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setDatabase_ (self & database)
    fun setInteraction self interaction = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setInteraction_ (self & interaction)
    fun setRehandshakeMode self mode = (GObjectObjectClass.C.withPtr &&&> GioTlsRehandshakeMode.C.withVal ---> I) setRehandshakeMode_ (self & mode)
    fun setRequireCloseNotify self requireCloseNotify = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRequireCloseNotify_ (self & requireCloseNotify)
    local
      open ClosureMarshal Signal
    in
      fun acceptCertificateSig f = signal "accept-certificate" (get 0w1 GioTlsCertificateClass.t &&&> get 0w2 GioTlsCertificateFlags.t ---> ret boolean) (fn peerCert & errors => f peerCert errors)
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
      val useSystemCertdbProp =
        {
          get = fn x => get "use-system-certdb" boolean x,
          set = fn x => set "use-system-certdb" boolean x
        }
    end
  end
