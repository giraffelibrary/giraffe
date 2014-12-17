structure GioTlsInteraction :>
  GIO_TLS_INTERACTION
    where type 'a class_t = 'a GioTlsInteractionClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type tlsinteractionresult_t = GioTlsInteractionResult.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a tlspasswordclass_t = 'a GioTlsPasswordClass.t =
  struct
    val getType_ = _import "g_tls_interaction_get_type" : unit -> GObjectType.C.val_;
    val askPassword_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_tls_interaction_ask_password" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioTlsInteractionResult.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioTlsInteractionResult.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioTlsInteractionResult.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GioTlsInteractionClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type tlsinteractionresult_t = GioTlsInteractionResult.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a tlspasswordclass_t = 'a GioTlsPasswordClass.t
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
