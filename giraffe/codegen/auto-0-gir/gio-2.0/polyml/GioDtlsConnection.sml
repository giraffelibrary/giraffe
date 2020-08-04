structure GioDtlsConnection :>
  GIO_DTLS_CONNECTION
    where type 'a class = 'a GioDtlsConnectionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    where type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    where type 'a tls_interaction_class = 'a GioTlsInteractionClass.class
    where type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type tls_rehandshake_mode_t = GioTlsRehandshakeMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dtls_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val close_ =
        call (getSymbol "g_dtls_connection_close")
          (
            GioDtlsConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val closeFinish_ =
        call (getSymbol "g_dtls_connection_close_finish")
          (
            GioDtlsConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val emitAcceptCertificate_ =
        call (getSymbol "g_dtls_connection_emit_accept_certificate")
          (
            GioDtlsConnectionClass.PolyML.cPtr
             &&> GioTlsCertificateClass.PolyML.cPtr
             &&> GioTlsCertificateFlags.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val getCertificate_ = call (getSymbol "g_dtls_connection_get_certificate") (GioDtlsConnectionClass.PolyML.cPtr --> GioTlsCertificateClass.PolyML.cPtr)
      val getDatabase_ = call (getSymbol "g_dtls_connection_get_database") (GioDtlsConnectionClass.PolyML.cPtr --> GioTlsDatabaseClass.PolyML.cPtr)
      val getInteraction_ = call (getSymbol "g_dtls_connection_get_interaction") (GioDtlsConnectionClass.PolyML.cPtr --> GioTlsInteractionClass.PolyML.cPtr)
      val getPeerCertificate_ = call (getSymbol "g_dtls_connection_get_peer_certificate") (GioDtlsConnectionClass.PolyML.cPtr --> GioTlsCertificateClass.PolyML.cPtr)
      val getPeerCertificateErrors_ = call (getSymbol "g_dtls_connection_get_peer_certificate_errors") (GioDtlsConnectionClass.PolyML.cPtr --> GioTlsCertificateFlags.PolyML.cVal)
      val getRehandshakeMode_ = call (getSymbol "g_dtls_connection_get_rehandshake_mode") (GioDtlsConnectionClass.PolyML.cPtr --> GioTlsRehandshakeMode.PolyML.cVal)
      val getRequireCloseNotify_ = call (getSymbol "g_dtls_connection_get_require_close_notify") (GioDtlsConnectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val handshake_ =
        call (getSymbol "g_dtls_connection_handshake")
          (
            GioDtlsConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val handshakeFinish_ =
        call (getSymbol "g_dtls_connection_handshake_finish")
          (
            GioDtlsConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setCertificate_ = call (getSymbol "g_dtls_connection_set_certificate") (GioDtlsConnectionClass.PolyML.cPtr &&> GioTlsCertificateClass.PolyML.cPtr --> cVoid)
      val setDatabase_ = call (getSymbol "g_dtls_connection_set_database") (GioDtlsConnectionClass.PolyML.cPtr &&> GioTlsDatabaseClass.PolyML.cPtr --> cVoid)
      val setInteraction_ = call (getSymbol "g_dtls_connection_set_interaction") (GioDtlsConnectionClass.PolyML.cPtr &&> GioTlsInteractionClass.PolyML.cOptPtr --> cVoid)
      val setRehandshakeMode_ = call (getSymbol "g_dtls_connection_set_rehandshake_mode") (GioDtlsConnectionClass.PolyML.cPtr &&> GioTlsRehandshakeMode.PolyML.cVal --> cVoid)
      val setRequireCloseNotify_ = call (getSymbol "g_dtls_connection_set_require_close_notify") (GioDtlsConnectionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val shutdown_ =
        call (getSymbol "g_dtls_connection_shutdown")
          (
            GioDtlsConnectionClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val shutdownFinish_ =
        call (getSymbol "g_dtls_connection_shutdown_finish")
          (
            GioDtlsConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GioDtlsConnectionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    type 'a tls_interaction_class = 'a GioTlsInteractionClass.class
    type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type tls_rehandshake_mode_t = GioTlsRehandshakeMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun close self cancellable =
      (
        GioDtlsConnectionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GioDtlsConnectionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun emitAcceptCertificate self (peerCert, errors) =
      (
        GioDtlsConnectionClass.FFI.withPtr false
         &&&> GioTlsCertificateClass.FFI.withPtr false
         &&&> GioTlsCertificateFlags.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        emitAcceptCertificate_
        (
          self
           & peerCert
           & errors
        )
    fun getCertificate self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsCertificateClass.FFI.fromPtr false) getCertificate_ self
    fun getDatabase self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsDatabaseClass.FFI.fromPtr false) getDatabase_ self
    fun getInteraction self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsInteractionClass.FFI.fromPtr false) getInteraction_ self
    fun getPeerCertificate self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsCertificateClass.FFI.fromPtr false) getPeerCertificate_ self
    fun getPeerCertificateErrors self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsCertificateFlags.FFI.fromVal) getPeerCertificateErrors_ self
    fun getRehandshakeMode self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsRehandshakeMode.FFI.fromVal) getRehandshakeMode_ self
    fun getRequireCloseNotify self = (GioDtlsConnectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRequireCloseNotify_ self
    fun handshake self cancellable =
      (
        GioDtlsConnectionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioDtlsConnectionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        handshakeFinish_
        (
          self
           & result
           & []
        )
    fun setCertificate self certificate = (GioDtlsConnectionClass.FFI.withPtr false &&&> GioTlsCertificateClass.FFI.withPtr false ---> I) setCertificate_ (self & certificate)
    fun setDatabase self database = (GioDtlsConnectionClass.FFI.withPtr false &&&> GioTlsDatabaseClass.FFI.withPtr false ---> I) setDatabase_ (self & database)
    fun setInteraction self interaction = (GioDtlsConnectionClass.FFI.withPtr false &&&> GioTlsInteractionClass.FFI.withOptPtr false ---> I) setInteraction_ (self & interaction)
    fun setRehandshakeMode self mode = (GioDtlsConnectionClass.FFI.withPtr false &&&> GioTlsRehandshakeMode.FFI.withVal ---> I) setRehandshakeMode_ (self & mode)
    fun setRequireCloseNotify self requireCloseNotify = (GioDtlsConnectionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRequireCloseNotify_ (self & requireCloseNotify)
    fun shutdown
      self
      (
        shutdownRead,
        shutdownWrite,
        cancellable
      ) =
      (
        GioDtlsConnectionClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        shutdown_
        (
          self
           & shutdownRead
           & shutdownWrite
           & cancellable
           & []
        )
    fun shutdownFinish self result =
      (
        GioDtlsConnectionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        shutdownFinish_
        (
          self
           & result
           & []
        )
    local
      open ClosureMarshal Signal
    in
      fun acceptCertificateSig f = signal "accept-certificate" (get 0w1 GioTlsCertificateClass.t &&&> get 0w2 GioTlsCertificateFlags.t ---> ret boolean) (fn peerCert & errors => f (peerCert, errors))
    end
    local
      open Property
    in
      val baseSocketProp =
        {
          get = fn x => get "base-socket" GioDatagramBasedClass.tOpt x,
          new = fn x => new "base-socket" GioDatagramBasedClass.tOpt x
        }
      val certificateProp =
        {
          get = fn x => get "certificate" GioTlsCertificateClass.tOpt x,
          set = fn x => set "certificate" GioTlsCertificateClass.tOpt x,
          new = fn x => new "certificate" GioTlsCertificateClass.tOpt x
        }
      val databaseProp =
        {
          get = fn x => get "database" GioTlsDatabaseClass.tOpt x,
          set = fn x => set "database" GioTlsDatabaseClass.tOpt x,
          new = fn x => new "database" GioTlsDatabaseClass.tOpt x
        }
      val interactionProp =
        {
          get = fn x => get "interaction" GioTlsInteractionClass.tOpt x,
          set = fn x => set "interaction" GioTlsInteractionClass.tOpt x,
          new = fn x => new "interaction" GioTlsInteractionClass.tOpt x
        }
      val peerCertificateProp = {get = fn x => get "peer-certificate" GioTlsCertificateClass.tOpt x}
      val peerCertificateErrorsProp = {get = fn x => get "peer-certificate-errors" GioTlsCertificateFlags.t x}
      val rehandshakeModeProp =
        {
          get = fn x => get "rehandshake-mode" GioTlsRehandshakeMode.t x,
          set = fn x => set "rehandshake-mode" GioTlsRehandshakeMode.t x,
          new = fn x => new "rehandshake-mode" GioTlsRehandshakeMode.t x
        }
      val requireCloseNotifyProp =
        {
          get = fn x => get "require-close-notify" boolean x,
          set = fn x => set "require-close-notify" boolean x,
          new = fn x => new "require-close-notify" boolean x
        }
    end
  end
