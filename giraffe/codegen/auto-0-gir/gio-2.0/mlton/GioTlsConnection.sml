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
    val getType_ = _import "g_tls_connection_get_type" : unit -> GObjectType.C.val_;
    val emitAcceptCertificate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_connection_emit_accept_certificate" :
              GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p
               * GioTlsCertificateClass.C.notnull GioTlsCertificateClass.C.p
               * GioTlsCertificateFlags.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCertificate_ = _import "g_tls_connection_get_certificate" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p -> GioTlsCertificateClass.C.notnull GioTlsCertificateClass.C.p;
    val getDatabase_ = _import "g_tls_connection_get_database" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p -> GioTlsDatabaseClass.C.notnull GioTlsDatabaseClass.C.p;
    val getInteraction_ = _import "g_tls_connection_get_interaction" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p -> GioTlsInteractionClass.C.notnull GioTlsInteractionClass.C.p;
    val getPeerCertificate_ = _import "g_tls_connection_get_peer_certificate" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p -> GioTlsCertificateClass.C.notnull GioTlsCertificateClass.C.p;
    val getPeerCertificateErrors_ = _import "g_tls_connection_get_peer_certificate_errors" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p -> GioTlsCertificateFlags.C.val_;
    val getRehandshakeMode_ = _import "g_tls_connection_get_rehandshake_mode" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p -> GioTlsRehandshakeMode.C.val_;
    val getRequireCloseNotify_ = _import "g_tls_connection_get_require_close_notify" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p -> FFI.Bool.C.val_;
    val handshake_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_connection_handshake" :
              GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCertificate_ = fn x1 & x2 => (_import "g_tls_connection_set_certificate" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p * GioTlsCertificateClass.C.notnull GioTlsCertificateClass.C.p -> unit;) (x1, x2)
    val setDatabase_ = fn x1 & x2 => (_import "g_tls_connection_set_database" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p * GioTlsDatabaseClass.C.notnull GioTlsDatabaseClass.C.p -> unit;) (x1, x2)
    val setInteraction_ = fn x1 & x2 => (_import "g_tls_connection_set_interaction" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p * unit GioTlsInteractionClass.C.p -> unit;) (x1, x2)
    val setRehandshakeMode_ = fn x1 & x2 => (_import "g_tls_connection_set_rehandshake_mode" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p * GioTlsRehandshakeMode.C.val_ -> unit;) (x1, x2)
    val setRequireCloseNotify_ = fn x1 & x2 => (_import "g_tls_connection_set_require_close_notify" : GioTlsConnectionClass.C.notnull GioTlsConnectionClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
        GioTlsConnectionClass.C.withPtr
         &&&> GioTlsCertificateClass.C.withPtr
         &&&> GioTlsCertificateFlags.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        emitAcceptCertificate_
        (
          self
           & peerCert
           & errors
        )
    fun getCertificate self = (GioTlsConnectionClass.C.withPtr ---> GioTlsCertificateClass.C.fromPtr false) getCertificate_ self
    fun getDatabase self = (GioTlsConnectionClass.C.withPtr ---> GioTlsDatabaseClass.C.fromPtr false) getDatabase_ self
    fun getInteraction self = (GioTlsConnectionClass.C.withPtr ---> GioTlsInteractionClass.C.fromPtr false) getInteraction_ self
    fun getPeerCertificate self = (GioTlsConnectionClass.C.withPtr ---> GioTlsCertificateClass.C.fromPtr false) getPeerCertificate_ self
    fun getPeerCertificateErrors self = (GioTlsConnectionClass.C.withPtr ---> GioTlsCertificateFlags.C.fromVal) getPeerCertificateErrors_ self
    fun getRehandshakeMode self = (GioTlsConnectionClass.C.withPtr ---> GioTlsRehandshakeMode.C.fromVal) getRehandshakeMode_ self
    fun getRequireCloseNotify self = (GioTlsConnectionClass.C.withPtr ---> FFI.Bool.C.fromVal) getRequireCloseNotify_ self
    fun handshake self cancellable =
      (
        GioTlsConnectionClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioTlsConnectionClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        handshakeFinish_
        (
          self
           & result
           & []
        )
    fun setCertificate self certificate = (GioTlsConnectionClass.C.withPtr &&&> GioTlsCertificateClass.C.withPtr ---> I) setCertificate_ (self & certificate)
    fun setDatabase self database = (GioTlsConnectionClass.C.withPtr &&&> GioTlsDatabaseClass.C.withPtr ---> I) setDatabase_ (self & database)
    fun setInteraction self interaction = (GioTlsConnectionClass.C.withPtr &&&> GioTlsInteractionClass.C.withOptPtr ---> I) setInteraction_ (self & interaction)
    fun setRehandshakeMode self mode = (GioTlsConnectionClass.C.withPtr &&&> GioTlsRehandshakeMode.C.withVal ---> I) setRehandshakeMode_ (self & mode)
    fun setRequireCloseNotify self requireCloseNotify = (GioTlsConnectionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRequireCloseNotify_ (self & requireCloseNotify)
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
    end
  end
