structure GioSimpleAsyncResult :>
  GIO_SIMPLE_ASYNC_RESULT
    where type 'a class = 'a GioSimpleAsyncResultClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_async_result_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val complete_ = call (load_sym libgio "g_simple_async_result_complete") (GioSimpleAsyncResultClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val completeInIdle_ = call (load_sym libgio "g_simple_async_result_complete_in_idle") (GioSimpleAsyncResultClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getOpResGboolean_ = call (load_sym libgio "g_simple_async_result_get_op_res_gboolean") (GioSimpleAsyncResultClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getOpResGssize_ = call (load_sym libgio "g_simple_async_result_get_op_res_gssize") (GioSimpleAsyncResultClass.PolyML.cPtr --> GSSize.PolyML.cVal)
      val propagateError_ = call (load_sym libgio "g_simple_async_result_propagate_error") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val setHandleCancellation_ = call (load_sym libgio "g_simple_async_result_set_handle_cancellation") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setOpResGboolean_ = call (load_sym libgio "g_simple_async_result_set_op_res_gboolean") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setOpResGssize_ = call (load_sym libgio "g_simple_async_result_set_op_res_gssize") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GSSize.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioSimpleAsyncResultClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    fun asAsyncResult self = (GObjectObjectClass.FFI.withPtr ---> GioAsyncResultClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun complete self = (GioSimpleAsyncResultClass.FFI.withPtr ---> I) complete_ self
    fun completeInIdle self = (GioSimpleAsyncResultClass.FFI.withPtr ---> I) completeInIdle_ self
    fun getOpResGboolean self = (GioSimpleAsyncResultClass.FFI.withPtr ---> GBool.FFI.fromVal) getOpResGboolean_ self
    fun getOpResGssize self = (GioSimpleAsyncResultClass.FFI.withPtr ---> GSSize.FFI.fromVal) getOpResGssize_ self
    fun propagateError self = (GioSimpleAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) propagateError_ (self & [])
    fun setHandleCancellation self handleCancellation = (GioSimpleAsyncResultClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHandleCancellation_ (self & handleCancellation)
    fun setOpResGboolean self opRes = (GioSimpleAsyncResultClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setOpResGboolean_ (self & opRes)
    fun setOpResGssize self opRes = (GioSimpleAsyncResultClass.FFI.withPtr &&&> GSSize.FFI.withVal ---> I) setOpResGssize_ (self & opRes)
  end
