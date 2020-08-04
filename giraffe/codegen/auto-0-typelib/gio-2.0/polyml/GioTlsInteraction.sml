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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_interaction_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val askPassword_ =
        call (getSymbol "g_tls_interaction_ask_password")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioTlsPasswordClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
      val askPasswordFinish_ =
        call (getSymbol "g_tls_interaction_ask_password_finish")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
      val invokeAskPassword_ =
        call (getSymbol "g_tls_interaction_invoke_ask_password")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioTlsPasswordClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
      val invokeRequestCertificate_ =
        call (getSymbol "g_tls_interaction_invoke_request_certificate")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioTlsConnectionClass.PolyML.cPtr
             &&> GioTlsCertificateRequestFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
      val requestCertificate_ =
        call (getSymbol "g_tls_interaction_request_certificate")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioTlsConnectionClass.PolyML.cPtr
             &&> GioTlsCertificateRequestFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
      val requestCertificateFinish_ =
        call (getSymbol "g_tls_interaction_request_certificate_finish")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
    end
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
        GioTlsInteractionClass.FFI.withPtr false
         &&&> GioTlsPasswordClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioTlsInteractionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioTlsInteractionClass.FFI.withPtr false
         &&&> GioTlsPasswordClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioTlsInteractionClass.FFI.withPtr false
         &&&> GioTlsConnectionClass.FFI.withPtr false
         &&&> GioTlsCertificateRequestFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioTlsInteractionClass.FFI.withPtr false
         &&&> GioTlsConnectionClass.FFI.withPtr false
         &&&> GioTlsCertificateRequestFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioTlsInteractionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
