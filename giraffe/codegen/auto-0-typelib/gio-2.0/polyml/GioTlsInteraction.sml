structure GioTlsInteraction :>
  GIO_TLS_INTERACTION
    where type 'a class_t = 'a GioTlsInteractionClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t
    where type tls_interaction_result_t = GioTlsInteractionResult.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a tls_password_class_t = 'a GioTlsPasswordClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_interaction_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val askPassword_ =
        call (load_sym libgio "g_tls_interaction_ask_password")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GioTlsInteractionResult.PolyML.VAL
          )
      val askPasswordFinish_ =
        call (load_sym libgio "g_tls_interaction_ask_password_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GioTlsInteractionResult.PolyML.VAL
          )
      val invokeAskPassword_ =
        call (load_sym libgio "g_tls_interaction_invoke_ask_password")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GioTlsInteractionResult.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioTlsInteractionClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type tls_interaction_result_t = GioTlsInteractionResult.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a tls_password_class_t = 'a GioTlsPasswordClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun askPassword self password cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
