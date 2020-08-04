structure GioSimpleAsyncResult :>
  GIO_SIMPLE_ASYNC_RESULT
    where type 'a class = 'a GioSimpleAsyncResultClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_simple_async_result_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val complete_ = call (getSymbol "g_simple_async_result_complete") (GioSimpleAsyncResultClass.PolyML.cPtr --> cVoid)
      val completeInIdle_ = call (getSymbol "g_simple_async_result_complete_in_idle") (GioSimpleAsyncResultClass.PolyML.cPtr --> cVoid)
      val getOpResGboolean_ = call (getSymbol "g_simple_async_result_get_op_res_gboolean") (GioSimpleAsyncResultClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getOpResGssize_ = call (getSymbol "g_simple_async_result_get_op_res_gssize") (GioSimpleAsyncResultClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val propagateError_ = call (getSymbol "g_simple_async_result_propagate_error") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val setCheckCancellable_ = call (getSymbol "g_simple_async_result_set_check_cancellable") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GioCancellableClass.PolyML.cOptPtr --> cVoid)
      val setHandleCancellation_ = call (getSymbol "g_simple_async_result_set_handle_cancellation") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setOpResGboolean_ = call (getSymbol "g_simple_async_result_set_op_res_gboolean") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setOpResGssize_ = call (getSymbol "g_simple_async_result_set_op_res_gssize") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GInt64.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioSimpleAsyncResultClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    fun asAsyncResult self = (GObjectObjectClass.FFI.withPtr false ---> GioAsyncResultClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun complete self = (GioSimpleAsyncResultClass.FFI.withPtr false ---> I) complete_ self
    fun completeInIdle self = (GioSimpleAsyncResultClass.FFI.withPtr false ---> I) completeInIdle_ self
    fun getOpResGboolean self = (GioSimpleAsyncResultClass.FFI.withPtr false ---> GBool.FFI.fromVal) getOpResGboolean_ self
    fun getOpResGssize self = (GioSimpleAsyncResultClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getOpResGssize_ self
    fun propagateError self = (GioSimpleAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) propagateError_ (self & [])
    fun setCheckCancellable self checkCancellable = (GioSimpleAsyncResultClass.FFI.withPtr false &&&> GioCancellableClass.FFI.withOptPtr false ---> I) setCheckCancellable_ (self & checkCancellable)
    fun setHandleCancellation self handleCancellation = (GioSimpleAsyncResultClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHandleCancellation_ (self & handleCancellation)
    fun setOpResGboolean self opRes = (GioSimpleAsyncResultClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setOpResGboolean_ (self & opRes)
    fun setOpResGssize self opRes = (GioSimpleAsyncResultClass.FFI.withPtr false &&&> GInt64.FFI.withVal ---> I) setOpResGssize_ (self & opRes)
  end
