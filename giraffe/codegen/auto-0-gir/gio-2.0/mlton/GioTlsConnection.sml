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
              GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p
               * GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p
               * GioTlsCertificateFlags.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCertificate_ = _import "g_tls_connection_get_certificate" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
    val getDatabase_ = _import "g_tls_connection_get_database" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p -> GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p;
    val getInteraction_ = _import "g_tls_connection_get_interaction" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p -> GioTlsInteractionClass.FFI.non_opt GioTlsInteractionClass.FFI.p;
    val getPeerCertificate_ = _import "g_tls_connection_get_peer_certificate" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
    val getPeerCertificateErrors_ = _import "g_tls_connection_get_peer_certificate_errors" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p -> GioTlsCertificateFlags.FFI.val_;
    val getRehandshakeMode_ = _import "g_tls_connection_get_rehandshake_mode" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p -> GioTlsRehandshakeMode.FFI.val_;
    val getRequireCloseNotify_ = _import "g_tls_connection_get_require_close_notify" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p -> GBool.FFI.val_;
    val getUseSystemCertdb_ = _import "g_tls_connection_get_use_system_certdb" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p -> GBool.FFI.val_;
    val handshake_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_connection_handshake" :
              GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCertificate_ = fn x1 & x2 => (_import "g_tls_connection_set_certificate" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p * GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p -> unit;) (x1, x2)
    val setDatabase_ = fn x1 & x2 => (_import "g_tls_connection_set_database" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p * GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p -> unit;) (x1, x2)
    val setInteraction_ = fn x1 & x2 => (_import "g_tls_connection_set_interaction" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p * GioTlsInteractionClass.FFI.opt GioTlsInteractionClass.FFI.p -> unit;) (x1, x2)
    val setRehandshakeMode_ = fn x1 & x2 => (_import "g_tls_connection_set_rehandshake_mode" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p * GioTlsRehandshakeMode.FFI.val_ -> unit;) (x1, x2)
    val setRequireCloseNotify_ = fn x1 & x2 => (_import "g_tls_connection_set_require_close_notify" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUseSystemCertdb_ = fn x1 & x2 => (_import "g_tls_connection_set_use_system_certdb" : GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
        GioTlsConnectionClass.FFI.withPtr false
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
    fun getCertificate self = (GioTlsConnectionClass.FFI.withPtr false ---> GioTlsCertificateClass.FFI.fromPtr false) getCertificate_ self
    fun getDatabase self = (GioTlsConnectionClass.FFI.withPtr false ---> GioTlsDatabaseClass.FFI.fromPtr false) getDatabase_ self
    fun getInteraction self = (GioTlsConnectionClass.FFI.withPtr false ---> GioTlsInteractionClass.FFI.fromPtr false) getInteraction_ self
    fun getPeerCertificate self = (GioTlsConnectionClass.FFI.withPtr false ---> GioTlsCertificateClass.FFI.fromPtr false) getPeerCertificate_ self
    fun getPeerCertificateErrors self = (GioTlsConnectionClass.FFI.withPtr false ---> GioTlsCertificateFlags.FFI.fromVal) getPeerCertificateErrors_ self
    fun getRehandshakeMode self = (GioTlsConnectionClass.FFI.withPtr false ---> GioTlsRehandshakeMode.FFI.fromVal) getRehandshakeMode_ self
    fun getRequireCloseNotify self = (GioTlsConnectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRequireCloseNotify_ self
    fun getUseSystemCertdb self = (GioTlsConnectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseSystemCertdb_ self
    fun handshake self cancellable =
      (
        GioTlsConnectionClass.FFI.withPtr false
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
        GioTlsConnectionClass.FFI.withPtr false
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
    fun setCertificate self certificate = (GioTlsConnectionClass.FFI.withPtr false &&&> GioTlsCertificateClass.FFI.withPtr false ---> I) setCertificate_ (self & certificate)
    fun setDatabase self database = (GioTlsConnectionClass.FFI.withPtr false &&&> GioTlsDatabaseClass.FFI.withPtr false ---> I) setDatabase_ (self & database)
    fun setInteraction self interaction = (GioTlsConnectionClass.FFI.withPtr false &&&> GioTlsInteractionClass.FFI.withOptPtr false ---> I) setInteraction_ (self & interaction)
    fun setRehandshakeMode self mode = (GioTlsConnectionClass.FFI.withPtr false &&&> GioTlsRehandshakeMode.FFI.withVal ---> I) setRehandshakeMode_ (self & mode)
    fun setRequireCloseNotify self requireCloseNotify = (GioTlsConnectionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRequireCloseNotify_ (self & requireCloseNotify)
    fun setUseSystemCertdb self useSystemCertdb = (GioTlsConnectionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseSystemCertdb_ (self & useSystemCertdb)
    local
      open ClosureMarshal Signal
    in
      fun acceptCertificateSig f = signal "accept-certificate" (get 0w1 GioTlsCertificateClass.t &&&> get 0w2 GioTlsCertificateFlags.t ---> ret boolean) (fn peerCert & errors => f (peerCert, errors))
    end
    local
      open ValueAccessor
    in
      val baseIoStreamProp =
        {
          name = "base-io-stream",
          gtype = fn () => C.gtype GioIOStreamClass.tOpt (),
          get = fn x => fn () => C.get GioIOStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioIOStreamClass.tOpt x
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
      val useSystemCertdbProp =
        {
          name = "use-system-certdb",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
