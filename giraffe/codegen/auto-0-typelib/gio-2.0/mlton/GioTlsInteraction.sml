structure GioTlsInteraction :>
  GIO_TLS_INTERACTION
    where type 'a class = 'a GioTlsInteractionClass.class
    where type 'a tls_password_class = 'a GioTlsPasswordClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type tls_certificate_request_flags_t = GioTlsCertificateRequestFlags.t
    where type 'a tls_connection_class = 'a GioTlsConnectionClass.class
    where type tls_interaction_result_t = GioTlsInteractionResult.t
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_tls_interaction_get_type" : unit -> GObjectType.FFI.val_;
    val askPassword_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_tls_interaction_ask_password" :
              GioTlsInteractionClass.FFI.non_opt GioTlsInteractionClass.FFI.p
               * GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsInteractionResult.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val askPasswordFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_interaction_ask_password_finish" :
              GioTlsInteractionClass.FFI.non_opt GioTlsInteractionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsInteractionResult.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val invokeAskPassword_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_tls_interaction_invoke_ask_password" :
              GioTlsInteractionClass.FFI.non_opt GioTlsInteractionClass.FFI.p
               * GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsInteractionResult.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val invokeRequestCertificate_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_tls_interaction_invoke_request_certificate" :
              GioTlsInteractionClass.FFI.non_opt GioTlsInteractionClass.FFI.p
               * GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p
               * GioTlsCertificateRequestFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsInteractionResult.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val requestCertificate_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_tls_interaction_request_certificate" :
              GioTlsInteractionClass.FFI.non_opt GioTlsInteractionClass.FFI.p
               * GioTlsConnectionClass.FFI.non_opt GioTlsConnectionClass.FFI.p
               * GioTlsCertificateRequestFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsInteractionResult.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val requestCertificateFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_interaction_request_certificate_finish" :
              GioTlsInteractionClass.FFI.non_opt GioTlsInteractionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsInteractionResult.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioTlsInteractionClass.class
    type 'a tls_password_class = 'a GioTlsPasswordClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type tls_certificate_request_flags_t = GioTlsCertificateRequestFlags.t
    type 'a tls_connection_class = 'a GioTlsConnectionClass.class
    type tls_interaction_result_t = GioTlsInteractionResult.t
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun askPassword self (password, cancellable) =
      (
        GioTlsInteractionClass.FFI.withPtr
         &&&> GioTlsPasswordClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.FFI.fromVal
      )
        askPassword_
        (
          self
           & password
           & cancellable
           & []
        )
    fun askPasswordFinish self result =
      (
        GioTlsInteractionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.FFI.fromVal
      )
        askPasswordFinish_
        (
          self
           & result
           & []
        )
    fun invokeAskPassword self (password, cancellable) =
      (
        GioTlsInteractionClass.FFI.withPtr
         &&&> GioTlsPasswordClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.FFI.fromVal
      )
        invokeAskPassword_
        (
          self
           & password
           & cancellable
           & []
        )
    fun invokeRequestCertificate
      self
      (
        connection,
        flags,
        cancellable
      ) =
      (
        GioTlsInteractionClass.FFI.withPtr
         &&&> GioTlsConnectionClass.FFI.withPtr
         &&&> GioTlsCertificateRequestFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.FFI.fromVal
      )
        invokeRequestCertificate_
        (
          self
           & connection
           & flags
           & cancellable
           & []
        )
    fun requestCertificate
      self
      (
        connection,
        flags,
        cancellable
      ) =
      (
        GioTlsInteractionClass.FFI.withPtr
         &&&> GioTlsConnectionClass.FFI.withPtr
         &&&> GioTlsCertificateRequestFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.FFI.fromVal
      )
        requestCertificate_
        (
          self
           & connection
           & flags
           & cancellable
           & []
        )
    fun requestCertificateFinish self result =
      (
        GioTlsInteractionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.FFI.fromVal
      )
        requestCertificateFinish_
        (
          self
           & result
           & []
        )
  end
