structure GioSimpleAsyncResult :>
  GIO_SIMPLE_ASYNC_RESULT
    where type 'a class = 'a GioSimpleAsyncResultClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_simple_async_result_get_type" : unit -> GObjectType.C.val_;
    val complete_ = _import "g_simple_async_result_complete" : GioSimpleAsyncResultClass.C.notnull GioSimpleAsyncResultClass.C.p -> unit;
    val completeInIdle_ = _import "g_simple_async_result_complete_in_idle" : GioSimpleAsyncResultClass.C.notnull GioSimpleAsyncResultClass.C.p -> unit;
    val getOpResGboolean_ = _import "g_simple_async_result_get_op_res_gboolean" : GioSimpleAsyncResultClass.C.notnull GioSimpleAsyncResultClass.C.p -> FFI.Bool.C.val_;
    val getOpResGssize_ = _import "g_simple_async_result_get_op_res_gssize" : GioSimpleAsyncResultClass.C.notnull GioSimpleAsyncResultClass.C.p -> FFI.Int64.C.val_;
    val propagateError_ = fn x1 & x2 => (_import "g_simple_async_result_propagate_error" : GioSimpleAsyncResultClass.C.notnull GioSimpleAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val setHandleCancellation_ = fn x1 & x2 => (_import "g_simple_async_result_set_handle_cancellation" : GioSimpleAsyncResultClass.C.notnull GioSimpleAsyncResultClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setOpResGboolean_ = fn x1 & x2 => (_import "g_simple_async_result_set_op_res_gboolean" : GioSimpleAsyncResultClass.C.notnull GioSimpleAsyncResultClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setOpResGssize_ = fn x1 & x2 => (_import "g_simple_async_result_set_op_res_gssize" : GioSimpleAsyncResultClass.C.notnull GioSimpleAsyncResultClass.C.p * FFI.Int64.C.val_ -> unit;) (x1, x2)
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
