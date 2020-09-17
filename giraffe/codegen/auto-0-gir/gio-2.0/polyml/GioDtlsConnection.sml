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
    fun getCertificate self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsCertificateClass.FFI.fromPtr false) getCertificate_ self before GioDtlsConnectionClass.FFI.touchPtr self
    fun getDatabase self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsDatabaseClass.FFI.fromPtr false) getDatabase_ self before GioDtlsConnectionClass.FFI.touchPtr self
    fun getInteraction self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsInteractionClass.FFI.fromPtr false) getInteraction_ self before GioDtlsConnectionClass.FFI.touchPtr self
    fun getPeerCertificate self = (GioDtlsConnectionClass.FFI.withPtr false ---> GioTlsCertificateClass.FFI.fromPtr false) getPeerCertificate_ self before GioDtlsConnectionClass.FFI.touchPtr self
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
      open ValueAccessor
    in
      val baseSocketProp =
        {
          name = "base-socket",
          gtype = fn () => C.gtype GioDatagramBasedClass.tOpt (),
          get = fn x => fn () => C.get GioDatagramBasedClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioDatagramBasedClass.tOpt x
        }
      val certificateProp =
        {
          name = "certificate",
          gtype = fn () => C.gtype GioTlsCertificateClass.tOpt (),
          get = fn x => fn () => C.get GioTlsCertificateClass.tOpt x,
          set = fn x => C.set GioTlsCertificateClass.tOpt x,
          init = fn x => C.set GioTlsCertificateClass.tOpt x
        }
      val databaseProp =
        {
          name = "database",
          gtype = fn () => C.gtype GioTlsDatabaseClass.tOpt (),
          get = fn x => fn () => C.get GioTlsDatabaseClass.tOpt x,
          set = fn x => C.set GioTlsDatabaseClass.tOpt x,
          init = fn x => C.set GioTlsDatabaseClass.tOpt x
        }
      val interactionProp =
        {
          name = "interaction",
          gtype = fn () => C.gtype GioTlsInteractionClass.tOpt (),
          get = fn x => fn () => C.get GioTlsInteractionClass.tOpt x,
          set = fn x => C.set GioTlsInteractionClass.tOpt x,
          init = fn x => C.set GioTlsInteractionClass.tOpt x
        }
      val peerCertificateProp =
        {
          name = "peer-certificate",
          gtype = fn () => C.gtype GioTlsCertificateClass.tOpt (),
          get = fn x => fn () => C.get GioTlsCertificateClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val peerCertificateErrorsProp =
        {
          name = "peer-certificate-errors",
          gtype = fn () => C.gtype GioTlsCertificateFlags.t (),
          get = fn x => fn () => C.get GioTlsCertificateFlags.t x,
          set = ignore,
          init = ignore
        }
      val rehandshakeModeProp =
        {
          name = "rehandshake-mode",
          gtype = fn () => C.gtype GioTlsRehandshakeMode.t (),
          get = fn x => fn () => C.get GioTlsRehandshakeMode.t x,
          set = fn x => C.set GioTlsRehandshakeMode.t x,
          init = fn x => C.set GioTlsRehandshakeMode.t x
        }
      val requireCloseNotifyProp =
        {
          name = "require-close-notify",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
