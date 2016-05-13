structure GioTlsInteraction :>
  GIO_TLS_INTERACTION
    where type 'a class = 'a GioTlsInteractionClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type tls_interaction_result_t = GioTlsInteractionResult.t
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a tls_password_class = 'a GioTlsPasswordClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_interaction_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val askPassword_ =
        call (load_sym libgio "g_tls_interaction_ask_password")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioTlsPasswordClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
      val askPasswordFinish_ =
        call (load_sym libgio "g_tls_interaction_ask_password_finish")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
      val invokeAskPassword_ =
        call (load_sym libgio "g_tls_interaction_invoke_ask_password")
          (
            GioTlsInteractionClass.PolyML.cPtr
             &&> GioTlsPasswordClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsInteractionResult.PolyML.cVal
          )
    end
    type 'a class = 'a GioTlsInteractionClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type tls_interaction_result_t = GioTlsInteractionResult.t
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a tls_password_class = 'a GioTlsPasswordClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun askPassword self password cancellable =
      (
        GioTlsInteractionClass.C.withPtr
         &&&> GioTlsPasswordClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.C.fromVal
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
        GioTlsInteractionClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.C.fromVal
      )
        askPasswordFinish_
        (
          self
           & result
           & []
        )
    fun invokeAskPassword self password cancellable =
      (
        GioTlsInteractionClass.C.withPtr
         &&&> GioTlsPasswordClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsInteractionResult.C.fromVal
      )
        invokeAskPassword_
        (
          self
           & password
           & cancellable
           & []
        )
  end
