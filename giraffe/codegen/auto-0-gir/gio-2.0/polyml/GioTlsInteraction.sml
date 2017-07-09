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
    end
    type 'a class = 'a GioTlsInteractionClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type tls_interaction_result_t = GioTlsInteractionResult.t
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a tls_password_class = 'a GioTlsPasswordClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun askPassword self password cancellable =
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
    fun invokeAskPassword self password cancellable =
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
  end
