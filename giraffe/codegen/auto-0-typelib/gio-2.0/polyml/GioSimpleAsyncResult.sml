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
      val getOpResGboolean_ = call (load_sym libgio "g_simple_async_result_get_op_res_gboolean") (GioSimpleAsyncResultClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getOpResGssize_ = call (load_sym libgio "g_simple_async_result_get_op_res_gssize") (GioSimpleAsyncResultClass.PolyML.cPtr --> FFI.Int64.PolyML.cVal)
      val propagateError_ = call (load_sym libgio "g_simple_async_result_propagate_error") (GioSimpleAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val setHandleCancellation_ = call (load_sym libgio "g_simple_async_result_set_handle_cancellation") (GioSimpleAsyncResultClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setOpResGboolean_ = call (load_sym libgio "g_simple_async_result_set_op_res_gboolean") (GioSimpleAsyncResultClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setOpResGssize_ = call (load_sym libgio "g_simple_async_result_set_op_res_gssize") (GioSimpleAsyncResultClass.PolyML.cPtr &&> FFI.Int64.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioSimpleAsyncResultClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    fun asAsyncResult self = (GObjectObjectClass.C.withPtr ---> GioAsyncResultClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun complete self = (GioSimpleAsyncResultClass.C.withPtr ---> I) complete_ self
    fun completeInIdle self = (GioSimpleAsyncResultClass.C.withPtr ---> I) completeInIdle_ self
    fun getOpResGboolean self = (GioSimpleAsyncResultClass.C.withPtr ---> FFI.Bool.C.fromVal) getOpResGboolean_ self
    fun getOpResGssize self = (GioSimpleAsyncResultClass.C.withPtr ---> FFI.Int64.C.fromVal) getOpResGssize_ self
    fun propagateError self = (GioSimpleAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) propagateError_ (self & [])
    fun setHandleCancellation self handleCancellation = (GioSimpleAsyncResultClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHandleCancellation_ (self & handleCancellation)
    fun setOpResGboolean self opRes = (GioSimpleAsyncResultClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setOpResGboolean_ (self & opRes)
    fun setOpResGssize self opRes = (GioSimpleAsyncResultClass.C.withPtr &&&> FFI.Int64.C.withVal ---> I) setOpResGssize_ (self & opRes)
  end
