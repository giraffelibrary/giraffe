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
    val getType_ = _import "g_dtls_connection_get_type" : unit -> GObjectType.FFI.val_;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_connection_close" :
              GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val closeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_connection_close_finish" :
              GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val emitAcceptCertificate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_connection_emit_accept_certificate" :
              GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p
               * GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p
               * GioTlsCertificateFlags.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCertificate_ = _import "g_dtls_connection_get_certificate" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
    val getDatabase_ = _import "g_dtls_connection_get_database" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p -> GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p;
    val getInteraction_ = _import "g_dtls_connection_get_interaction" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p -> GioTlsInteractionClass.FFI.non_opt GioTlsInteractionClass.FFI.p;
    val getPeerCertificate_ = _import "g_dtls_connection_get_peer_certificate" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
    val getPeerCertificateErrors_ = _import "g_dtls_connection_get_peer_certificate_errors" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p -> GioTlsCertificateFlags.FFI.val_;
    val getRehandshakeMode_ = _import "g_dtls_connection_get_rehandshake_mode" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p -> GioTlsRehandshakeMode.FFI.val_;
    val getRequireCloseNotify_ = _import "g_dtls_connection_get_require_close_notify" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p -> GBool.FFI.val_;
    val handshake_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_connection_handshake" :
              GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p
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
            _import "g_dtls_connection_handshake_finish" :
              GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCertificate_ = fn x1 & x2 => (_import "g_dtls_connection_set_certificate" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p * GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p -> unit;) (x1, x2)
    val setDatabase_ = fn x1 & x2 => (_import "g_dtls_connection_set_database" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p * GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p -> unit;) (x1, x2)
    val setInteraction_ = fn x1 & x2 => (_import "g_dtls_connection_set_interaction" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p * GioTlsInteractionClass.FFI.opt GioTlsInteractionClass.FFI.p -> unit;) (x1, x2)
    val setRehandshakeMode_ = fn x1 & x2 => (_import "g_dtls_connection_set_rehandshake_mode" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p * GioTlsRehandshakeMode.FFI.val_ -> unit;) (x1, x2)
    val setRequireCloseNotify_ = fn x1 & x2 => (_import "g_dtls_connection_set_require_close_notify" : GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val shutdown_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_dtls_connection_shutdown" :
              GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val shutdownFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_connection_shutdown_finish" :
              GioDtlsConnectionClass.FFI.non_opt GioDtlsConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
