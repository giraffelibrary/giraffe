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
    val getType_ = _import "g_tls_connection_get_type" : unit -> GObjectType.FFI.val_;
    val emitAcceptCertificate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_connection_emit_accept_certificate" :
              GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p
               * GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p
               * GioTlsCertificateFlags.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCertificate_ = _import "g_tls_connection_get_certificate" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p -> GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p;
    val getDatabase_ = _import "g_tls_connection_get_database" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p -> GioTlsDatabaseClass.FFI.notnull GioTlsDatabaseClass.FFI.p;
    val getInteraction_ = _import "g_tls_connection_get_interaction" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p -> GioTlsInteractionClass.FFI.notnull GioTlsInteractionClass.FFI.p;
    val getPeerCertificate_ = _import "g_tls_connection_get_peer_certificate" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p -> GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p;
    val getPeerCertificateErrors_ = _import "g_tls_connection_get_peer_certificate_errors" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p -> GioTlsCertificateFlags.FFI.val_;
    val getRehandshakeMode_ = _import "g_tls_connection_get_rehandshake_mode" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p -> GioTlsRehandshakeMode.FFI.val_;
    val getRequireCloseNotify_ = _import "g_tls_connection_get_require_close_notify" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p -> GBool.FFI.val_;
    val handshake_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_connection_handshake" :
              GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val handshakeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_connection_handshake_finish" :
              GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCertificate_ = fn x1 & x2 => (_import "g_tls_connection_set_certificate" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p * GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p -> unit;) (x1, x2)
    val setDatabase_ = fn x1 & x2 => (_import "g_tls_connection_set_database" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p * GioTlsDatabaseClass.FFI.notnull GioTlsDatabaseClass.FFI.p -> unit;) (x1, x2)
    val setInteraction_ = fn x1 & x2 => (_import "g_tls_connection_set_interaction" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p * unit GioTlsInteractionClass.FFI.p -> unit;) (x1, x2)
    val setRehandshakeMode_ = fn x1 & x2 => (_import "g_tls_connection_set_rehandshake_mode" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p * GioTlsRehandshakeMode.FFI.val_ -> unit;) (x1, x2)
    val setRequireCloseNotify_ = fn x1 & x2 => (_import "g_tls_connection_set_require_close_notify" : GioTlsConnectionClass.FFI.notnull GioTlsConnectionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
    fun emitAcceptCertificate self peerCert errors =
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
         ---> GBool.FFI.fromVal
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
         ---> GBool.FFI.fromVal
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
