structure GioSimpleAsyncResult :>
  GIO_SIMPLE_ASYNC_RESULT
    where type 'a class_t = 'a GioSimpleAsyncResultClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_async_result_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val complete_ = call (load_sym libgio "g_simple_async_result_complete") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val completeInIdle_ = call (load_sym libgio "g_simple_async_result_complete_in_idle") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getOpResGboolean_ = call (load_sym libgio "g_simple_async_result_get_op_res_gboolean") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getOpResGssize_ = call (load_sym libgio "g_simple_async_result_get_op_res_gssize") (GObjectObjectClass.PolyML.cPtr --> FFI.SSize.PolyML.cVal)
      val propagateError_ = call (load_sym libgio "g_simple_async_result_propagate_error") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val setHandleCancellation_ = call (load_sym libgio "g_simple_async_result_set_handle_cancellation") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOpResGboolean_ = call (load_sym libgio "g_simple_async_result_set_op_res_gboolean") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOpResGssize_ = call (load_sym libgio "g_simple_async_result_set_op_res_gssize") (GObjectObjectClass.PolyML.cPtr &&> FFI.SSize.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioSimpleAsyncResultClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    fun asAsyncResult self = (GObjectObjectClass.C.withPtr ---> GioAsyncResultClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun complete self = (GObjectObjectClass.C.withPtr ---> I) complete_ self
    fun completeInIdle self = (GObjectObjectClass.C.withPtr ---> I) completeInIdle_ self
    fun getOpResGboolean self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getOpResGboolean_ self
    fun getOpResGssize self = (GObjectObjectClass.C.withPtr ---> FFI.SSize.C.fromVal) getOpResGssize_ self
    fun propagateError self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) propagateError_ (self & [])
    fun setHandleCancellation self handleCancellation = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHandleCancellation_ (self & handleCancellation)
    fun setOpResGboolean self opRes = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setOpResGboolean_ (self & opRes)
    fun setOpResGssize self opRes = (GObjectObjectClass.C.withPtr &&&> FFI.SSize.C.withVal ---> I) setOpResGssize_ (self & opRes)
  end
