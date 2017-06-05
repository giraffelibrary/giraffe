structure GioTlsInteraction :>
  GIO_TLS_INTERACTION
    where type 'a class = 'a GioTlsInteractionClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type tls_interaction_result_t = GioTlsInteractionResult.t
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a tls_password_class = 'a GioTlsPasswordClass.class =
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
              GioTlsInteractionClass.FFI.notnull GioTlsInteractionClass.FFI.p
               * GioTlsPasswordClass.FFI.notnull GioTlsPasswordClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioTlsInteractionClass.FFI.notnull GioTlsInteractionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioTlsInteractionClass.FFI.notnull GioTlsInteractionClass.FFI.p
               * GioTlsPasswordClass.FFI.notnull GioTlsPasswordClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioTlsInteractionResult.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
