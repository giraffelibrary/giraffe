structure GioSimpleAsyncResult :>
  GIO_SIMPLE_ASYNC_RESULT
    where type 'a class = 'a GioSimpleAsyncResultClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_simple_async_result_get_type" : unit -> GObjectType.FFI.val_;
    val complete_ = _import "g_simple_async_result_complete" : GioSimpleAsyncResultClass.FFI.notnull GioSimpleAsyncResultClass.FFI.p -> unit;
    val completeInIdle_ = _import "g_simple_async_result_complete_in_idle" : GioSimpleAsyncResultClass.FFI.notnull GioSimpleAsyncResultClass.FFI.p -> unit;
    val getOpResGboolean_ = _import "g_simple_async_result_get_op_res_gboolean" : GioSimpleAsyncResultClass.FFI.notnull GioSimpleAsyncResultClass.FFI.p -> GBool.FFI.val_;
    val getOpResGssize_ = _import "g_simple_async_result_get_op_res_gssize" : GioSimpleAsyncResultClass.FFI.notnull GioSimpleAsyncResultClass.FFI.p -> GSSize.FFI.val_;
    val propagateError_ = fn x1 & x2 => (_import "g_simple_async_result_propagate_error" : GioSimpleAsyncResultClass.FFI.notnull GioSimpleAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val setHandleCancellation_ = fn x1 & x2 => (_import "g_simple_async_result_set_handle_cancellation" : GioSimpleAsyncResultClass.FFI.notnull GioSimpleAsyncResultClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setOpResGboolean_ = fn x1 & x2 => (_import "g_simple_async_result_set_op_res_gboolean" : GioSimpleAsyncResultClass.FFI.notnull GioSimpleAsyncResultClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setOpResGssize_ = fn x1 & x2 => (_import "g_simple_async_result_set_op_res_gssize" : GioSimpleAsyncResultClass.FFI.notnull GioSimpleAsyncResultClass.FFI.p * GSSize.FFI.val_ -> unit;) (x1, x2)
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
