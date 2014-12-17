structure GioSimpleAsyncResult :>
  GIO_SIMPLE_ASYNC_RESULT
    where type 'a class_t = 'a GioSimpleAsyncResultClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_simple_async_result_get_type" : unit -> GObjectType.C.val_;
    val complete_ = _import "g_simple_async_result_complete" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val completeInIdle_ = _import "g_simple_async_result_complete_in_idle" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getOpResGboolean_ = _import "g_simple_async_result_get_op_res_gboolean" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getOpResGssize_ = _import "g_simple_async_result_get_op_res_gssize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.SSize.C.val_;
    val propagateError_ = fn x1 & x2 => (_import "g_simple_async_result_propagate_error" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val setHandleCancellation_ = fn x1 & x2 => (_import "g_simple_async_result_set_handle_cancellation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setOpResGboolean_ = fn x1 & x2 => (_import "g_simple_async_result_set_op_res_gboolean" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setOpResGssize_ = fn x1 & x2 => (_import "g_simple_async_result_set_op_res_gssize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.SSize.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GioSimpleAsyncResultClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
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
